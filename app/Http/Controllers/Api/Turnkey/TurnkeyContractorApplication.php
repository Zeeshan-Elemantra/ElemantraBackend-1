<?php

namespace App\Http\Controllers\Api\Turnkey;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Models\ReviewCategory;
use Illuminate\Support\Carbon;
use App\Enums\ProjectStatusEnum;
use App\Enums\ApplicationStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Enums\ElemantraVerificationEnum;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectTurnkeyContractor;
use App\Http\Requests\Api\CostSummeryGet;
use App\Models\ProjectWorkTypeApplication;
use App\Http\Requests\Api\ProjectLabourGet;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ProjectTurnkeyGet;
use App\Http\Requests\Api\ApplicationProfile;
use App\Models\ProjectWorkRequestApplication;
use App\Http\Requests\Api\LabourApplicationGet;
use App\Http\Requests\Api\ApplicationRequestMeetAdd;
use App\Http\Requests\Api\TurnkeyContractorApplicationGet;
use App\Http\Requests\Api\TurnkeyContractorApplicationMeet;
use App\Http\Requests\Api\IndividualContractorApplicationGet;
use App\Http\Requests\Api\IndividualContractorApplicationMeet;

class TurnkeyContractorApplication extends Controller
{
    public function myApplications()
    {
        try {
            // $projectIndividuals = ProjectIndividualContractor::withWhereHas(
            //     'application',
            //     fn ($q) => $q->whereNot('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
            //         ->whereNotNull('applied_at')
            // )
            //     ->with('address')
            //     ->withCount([
            //         'application' => fn ($q) => $q->whereNotNull('applied_at'),
            //         'application as request_meet_count' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
            //     ])
            //     ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            //     ->where('user_id', Auth::id())
            //     ->get();

            $projectIndividuals = ProjectIndividualContractor::withWhereHas(
                'application',
                fn ($q) => $q->whereNotNull('applied_at')
                // ->whereNot('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
            )
                ->with('address')
                ->withCount([
                    'application' => fn ($q) => $q->whereNotNull('applied_at'),
                    'application as request_meet_count' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                ])
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                ->where('user_id', Auth::id())
                ->get();

            $projectLabours = ProjectLabourContractor::withWhereHas('application')
                ->with('address')
                ->withCount([
                    'application',
                    'application as request_meet_count' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                ])
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                ->where('user_id', Auth::id())
                ->get();
            $projects = $projectIndividuals->merge($projectLabours)->sortByDesc('created_at')->values();

            return $this->apiSuccess(compact('projects'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getApplication(TurnkeyContractorApplicationGet $request)
    {
        try {

            $project = null;
            if ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
                $project = ProjectLabourContractor::with([
                    'workType',
                    'application' => fn ($q) => $q->with([
                        'user' => fn ($q) => $q->withAvg('reviewRatings', 'rating'),
                    ])

                        ->when(
                            $request->filter_assigned,
                            fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                        )
                        ->when(
                            $request->filter_meet_request,
                            fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                        )
                        ->when(
                            $request->filter_elemantra_verified,
                            fn ($q) => $q->whereHas('user', fn ($q) => $q->where('elemantra_verification', (string)ElemantraVerificationEnum::VERIFIED->value))
                        )
                        ->orderByDesc('id')
                ])
                    ->whereId($request->id)->first();
            }

            if ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                $project = ProjectIndividualContractor::with([
                    'projectWorkType' => fn ($q) => $q->with([
                        'workType',
                        'application' => fn ($q) => $q->with(['user' => fn ($q) => $q->withAvg('reviewRatings', 'rating')])
                            ->whereNotNull('applied_at')
                            ->when(
                                $request->filter_assigned,
                                fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                            )
                            ->when(
                                $request->filter_meet_request,
                                fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                            )
                            ->when(
                                $request->lowest_cost,
                                fn ($q) => $q->orderBy('over_all_total')
                            )->when(
                                $request->highest_cost,
                                fn ($q) => $q->orderByDesc('over_all_total')
                            )
                            ->when(
                                $request->filter_elemantra_verified,
                                fn ($q) => $q->whereHas('user', fn ($q) => $q->where('elemantra_verification', (string)ElemantraVerificationEnum::VERIFIED->value))
                            )
                            ->when(
                                !$request->highest_cost && !$request->lowest_cost,
                                fn ($q) => $q->orderByDesc('id')
                            ),
                    ])->whereHas('application', fn ($q) => $q->whereNotNull('applied_at'))
                ])
                    ->whereId($request->id)->first();
            }

            return $this->apiSuccess(compact('project'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getCostDiffer(ProjectTurnkeyGet $request)
    {
        try {

            $project = ProjectTurnkeyContractor::with([
                'projectWorkType' => fn ($q) => $q->with([
                    'workType',
                ])
                    ->withWhereHas('application', fn ($q) => $q->where('user_id', Auth::id()))
                    ->withSum([
                        'application as over_all_cost' => fn ($q) => $q->where('user_id', Auth::id())
                    ], 'over_all_total')

            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->where('user_id', Auth::id())], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('user_id', Auth::id())], 'over_all_total')
                ->whereId($request->id)
                ->first();

            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function profile(ApplicationProfile $request)
    {
        try {
            // $profile = User::whereId($request->id)->with([
            //     'company', 'sampleProjects.images', 'userPropertyType.propertyType',
            //     'userWorkType.workType',
            //     'review' => fn ($q) => $q->with('rating.reviewCategory', 'reviewByUser'),
            // ])->withCount([
            //     'review'
            // ])->first();

            // $reviewCategoryAvg = ReviewCategory::with([
            //     'rating' => fn ($q) => $q->where('user_id', $request->id)
            // ])->withCount([
            //     'rating' => fn ($q) => $q->where('user_id', $request->id)
            // ])->withAvg('rating as average_rating', 'rating')->get();

            // $profile->avg_rating_category = $reviewCategoryAvg;
            // $profile->ovreall_rating = $reviewCategoryAvg->pluck('average_rating')->avg();

            $profile = User::whereId($request->id)->with([
                'company',
                'sampleProjects.images',
                'userPropertyType.propertyType',
                'userWorkType.workType',
                // 'reviewCategories' => fn ($q) => $q->withCount([
                //     'rating' => fn ($q) => $q->where('user_id', $request->id)
                // ])->withAvg('rating as average_rating', 'rating')
                //     ->whereHas('rating', fn ($q) => $q->where('user_id', $request->id)),
                'review' => fn ($q) => $q->with(['rating.reviewCategory', 'reviewByUser'])->whereHas('rating'),
            ])->withCount([
                'review'
            ])->withAvg('reviewRatings', 'rating')->first();

            $profile->review_categories = ReviewCategory::whereHas(
                'rating',
                fn ($q) => $q->where('user_id', $request->id)
            )
                ->withCount([
                    'rating' => fn ($q) => $q->where('user_id', $request->id)
                ])
                ->withAvg('rating as average_rating', 'rating')
                ->get();

            return $this->apiSuccess(compact('profile'), "Profile Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function requestMeet(IndividualContractorApplicationMeet $request)
    {
        try {
            $update = [
                'application_status' => (string)ApplicationStatusEnum::MEET->value,
                'meet_at' => Carbon::now()
            ];
            if ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
                $application = ProjectLabourApplication::whereId($request->id)->update($update);
                $projectApplication = ProjectLabourApplication::find($request->id);
            } elseif ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                $application = ProjectWorkTypeApplication::whereId($request->id)->update($update);
                $projectApplication = ProjectWorkTypeApplication::find($request->id);
            }
            //send notification
            $title = "Application Accepted";
            $message = "You are shortlisted for project " . $projectApplication->project->name;
            $usersUuid = [$projectApplication->user->uuid];
            sendNotification($usersUuid, $title, $message);
            return $this->apiSuccess(compact('application'), "Meet Request Sent Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function assign(TurnkeyContractorApplicationMeet $request)
    {
        try {
            $currentTime = Carbon::now();
            if ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
                $application = ProjectLabourApplication::find($request->id);

                $applicationUpdate = $application->update([
                    'application_status' => (string)ApplicationStatusEnum::ASSIGNED->value,
                    'assigned_at' => $currentTime
                ]);

                $projectAssign = $application->project()->update([
                    'assigned_user_id' => $application->user_id,
                    'assigned_at' => $currentTime,
                    'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
                ]);
            } elseif ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                $application = ProjectWorkTypeApplication::find($request->id);

                $applicationUpdate = $application->update([
                    'application_status' => (string)ApplicationStatusEnum::ASSIGNED->value,
                    'assigned_at' => $currentTime,
                ]);

                $applicationWorkType = $application->projectWorkType()->update([
                    'assigned_user_id' => $application->user_id,
                    'assigned_at' => $currentTime,
                ]);

                if ($application->project->projectWorkType->count() === $application->project->projectWorkType->whereNotNull('assigned_user_id')->count()) {
                    $projectAssignUpdate = $application->project()->update([
                        'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
                    ]);
                }
            }

            //send notification
            $title = "Congratulation";
            $message = "You are assigned for project ". $application->project->name;
            $usersUuid = [$application->user->uuid];
            sendNotification($usersUuid, $title, $message);

            return $this->apiSuccess(compact('application'), "Application Assigned successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function costSummery(CostSummeryGet $request)
    {
        try {
            $summery = ProjectWorkRequestApplication::with([
                'workRequest' => fn ($q) => $q->with('item', 'itemCategory', 'unit', 'itemDetail', 'itemBrandSpecification')
            ])
                ->where('project_work_type_application_id', $request->id)
                ->get();
            return $this->apiSuccess(compact('summery'), "Summery Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
