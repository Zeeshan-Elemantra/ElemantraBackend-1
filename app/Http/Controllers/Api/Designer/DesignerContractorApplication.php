<?php

namespace App\Http\Controllers\Api\Designer;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Models\ReviewCategory;
use Illuminate\Support\Carbon;
use App\Enums\ProjectModelEnum;
use App\Models\ProjectWorkType;
use App\Enums\ProjectStatusEnum;
use Illuminate\Support\Facades\Log;
use App\Enums\ApplicationStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Enums\ElemantraVerificationEnum;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectTurnkeyContractor;
use App\Http\Requests\Api\CostSummeryGet;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ApplicationProfile;
use App\Http\Requests\Api\GetOverAllCostUser;
use App\Models\ProjectWorkRequestApplication;
use App\Http\Requests\Api\TurnkeyContractorApplicationGet;
use App\Http\Requests\Api\TurnkeyContractorApplicationMeet;
use App\Http\Requests\Api\DesignerContractorApplicationMeet;
use App\Http\Requests\Api\IndividualContractorApplicationMeet;

class DesignerContractorApplication extends Controller
{
    //

    public function myApplications()
    {
        try {
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


            // $projectTurnkey = ProjectTurnkeyContractor::withWhereHas(
            //     'application',
            //     fn ($q) => $q->whereNull('assigned_at')
            // )
            //     ->with(['address'])
            //     ->withCount(['projectWorkType'])
            //     ->where('user_id', Auth::id())
            //     ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            //     ->get()
            //     ->map(function ($project) {
            //         $applicationsByUser = $project->application->groupBy('user_id');
            //         $workTypeCount = $project->project_work_type_count;
            //         $applicationCount = 0;
            //         $requestMeetCount = 0;
            //         $applicationsByUser->every(function ($userApplication, $keyUserId) use ($workTypeCount, &$applicationCount, &$requestMeetCount) {
            //             if ($userApplication->count() == $workTypeCount) {
            //                 $applicationCount += 1;
            //             }
            //             if ($userApplication->where('application_status', (string)ApplicationStatusEnum::MEET->value)->count() == $workTypeCount) {
            //                 $requestMeetCount += 1;
            //             }
            //         });
            //         if ($applicationCount != 0 || $requestMeetCount != 0) {
            //             $project->application_count = $applicationCount;
            //             $project->request_meet_count = $requestMeetCount;
            //             return $project;
            //         }
            //     })->filter();

            $projectTurnkey = ProjectTurnkeyContractor::withWhereHas(
                'application',
                fn ($q) => $q->whereNull('assigned_at')
            )
                ->with(['address'])
                // ->withCount([
                //     'application' => fn ($q) => $q->distinct('user_id')->whereNotNull('applied_at'),
                //     'application as request_meet_count' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                // ])
                ->where('user_id', Auth::id())
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                ->get();

            if ($projectTurnkey->isNotEmpty()) {
                foreach ($projectTurnkey as $key => $project) {
                    $applicationCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', Auth::id())
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->where('project_id', $project->id)
                        ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                        ->distinct('user_id')
                        ->whereNotNull('applied_at')
                        ->count();
                    $applicationRequestMeetCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', Auth::id())
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->where('project_id', $project->id)
                        ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                        ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                        ->distinct('user_id')
                        ->whereNotNull('applied_at')
                        ->count();
                    $project->application_count = $applicationCount;
                    $project->request_meet_count = $applicationRequestMeetCount;
                }
            }

            // dd($projectTurnkeyTemp->toArray());

            $projects = $projectTurnkey->merge($projectIndividuals)->merge($projectLabours)->sortByDesc('created_at')->values();

            return $this->apiSuccess(compact('projects'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getApplication(TurnkeyContractorApplicationGet $request)
    {
        try {
            $project = null;
            if ($request->project_type_id == ProjectTypeEnum::TURNKEY_CONTRACTOR->value) {
                $project = ProjectTurnkeyContractor::withCount(['projectWorkType', 'application' => fn ($q) => $q->when(
                    $request->filter_elemantra_verified,
                    fn ($q) => $q->whereHas('user', fn ($q) => $q->where('elemantra_verification', (string)ElemantraVerificationEnum::VERIFIED->value))
                )])
                    ->whereId($request->id)
                    ->first();
                // $newProject = new ProjectTurnkeyContractor($project->toArray());
                $project->setRelation('application', $project->application
                    ->groupBy('user_id')
                    ->map(function ($userApplications, $keyUserId) use ($project) {
                        $user = User::withAvg('reviewRatings', 'rating')->find($keyUserId);
                        $overAllCost = $userApplications->sum('over_all_total');
                        if ($project->project_work_type_count == $userApplications->count()) {
                            $user->over_all_cost = $overAllCost;
                            $user->assigned_at = $userApplications[0]->assigned_at;
                            $user->applied_at = $userApplications[0]->applied_at;
                            $user->application_status = $userApplications[0]->application_status;
                            $user->application_status_text = $userApplications[0]->application_status_text;

                            return $user;
                        }
                    })
                    ->filter()
                    ->when(
                        $request->filter_lowest_cost,
                        fn ($q) => $q->sortBy('over_all_cost')
                    )
                    ->when(
                        $request->filter_highest_cost,
                        fn ($q) => $q->sortByDesc('over_all_cost')
                    )
                    ->when(
                        $request->filter_high_rated,
                        fn ($q) => $q->sortByDesc('review_ratings_avg_rating')
                    )
                    ->when(
                        $request->filter_assigned,
                        fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                    )
                    ->when(
                        $request->filter_meet_request,
                        fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                    )

                    ->values());
            } elseif ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                $project = ProjectIndividualContractor::with([
                    'projectWorkType' => fn ($q) => $q->with([
                        'workType',
                        'application' => fn ($q) => $q->with([
                            'user' => fn ($q) => $q->withAvg('reviewRatings', 'rating')
                        ])
                            // ->whereNotIn('application_status', [(string)ApplicationStatusEnum::ASSIGNED->value])
                            ->when(
                                $request->filter_assigned,
                                fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                            )
                            ->when(
                                $request->filter_meet_request,
                                fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                            )
                            ->when(
                                $request->filter_lowest_cost,
                                fn ($q) => $q->orderBy('over_all_total')
                            )->when(
                                $request->filter_highest_cost,
                                fn ($q) => $q->orderByDesc('over_all_total')
                            )->when(
                                !$request->filter_highest_cost && !$request->filter_lowest_cost,
                                fn ($q) => $q->orderByDesc('id')
                            )
                            ->when(
                                $request->filter_elemantra_verified,
                                fn ($q) => $q->whereHas('user', fn ($q) => $q->where('elemantra_verification', (string)ElemantraVerificationEnum::VERIFIED->value))
                            ),
                    ])
                        ->whereHas('application', fn ($q) => $q->whereNotNull('applied_at'))

                ])
                    ->whereId($request->id)->first();
            } elseif ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
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




            return $this->apiSuccess(compact('project'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function overAllCost(GetOverAllCostUser $request)
    {
        try {
            $userId = $request->user_id;
            $project = ProjectTurnkeyContractor::with([
                'projectWorkType' => fn ($q) => $q->with([
                    'workType',
                ])
                    ->withWhereHas('application', fn ($q) => $q->where('user_id', $userId))
                    ->withSum([
                        'application as over_all_cost' => fn ($q) => $q->where('user_id', $userId)
                    ], 'over_all_total')

            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->where('user_id', $userId)], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('user_id', $userId)], 'over_all_total')
                ->whereId($request->id)
                ->first();

            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
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

    public function requestMeet(DesignerContractorApplicationMeet $request)
    {
        try {
            $update = [
                'application_status' => (string)ApplicationStatusEnum::MEET->value,
                'meet_at' => Carbon::now()
            ];
            $uuid = null;
            $projectName = null;
            if ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
                $projectApplication = ProjectLabourApplication::find($request->id);
                $application = ProjectLabourApplication::whereId($request->id)->update($update);
                $uuid = $projectApplication->user->uuid;
                $projectName = $projectApplication->project->name;
            } elseif ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                $projectApplication = ProjectWorkTypeApplication::find($request->id);
                $application = ProjectWorkTypeApplication::whereId($request->id)->update($update);
                $uuid = $projectApplication->user->uuid;
                $projectName = $projectApplication->project->name;
            } elseif ($request->project_type_id == ProjectTypeEnum::TURNKEY_CONTRACTOR->value) {
                $project = ProjectTurnkeyContractor::find($request->project_id);
                // $application = $project->application->where('user_id', $request->user_id)->each(function ($application) use ($update) {
                //     $application->update($update);
                // });
                $application = $project->application()->where('user_id', $request->user_id)->update($update);

                $projectApplication = ProjectWorkTypeApplication::find($request->id);
                $uuid = User::find($request->user_id)->uuid;
                $projectName = $project->name;
            }

            //send notification
            $title = "Application Accepted";
            $message = "You are shortlisted for project " . $projectName;
            $usersUuid = [$uuid];
            sendNotification($usersUuid, $title, $message);

            return $this->apiSuccess(compact('application'), "Meet Request Sent Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function profile(ApplicationProfile $request)
    {
        try {
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

    public function assign(DesignerContractorApplicationMeet $request)
    {
        try {
            $currentTime = Carbon::now();
            $applicationUpdateArr = [
                'application_status' => (string)ApplicationStatusEnum::ASSIGNED->value,
                'assigned_at' => $currentTime
            ];

            $uuid = null;
            $projectName = null;

            if ($request->project_type_id == ProjectTypeEnum::SKILLED_LABOUR->value) {
                $application = ProjectLabourApplication::find($request->id);

                $applicationUpdate = $application->update($applicationUpdateArr);

                $projectAssign = $application->project()->update([
                    'assigned_user_id' => $application->user_id,
                    'assigned_at' => $currentTime,
                    'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
                ]);

                $uuid = $application->user->uuid;
                $projectName = $application->project->name;
            } elseif ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {

                $application = ProjectWorkTypeApplication::find($request->id);

                $applicationUpdate = $application->update($applicationUpdateArr);

                $applicationWorkType = $application->projectWorkType()->update([
                    'assigned_user_id' => $application->user_id,
                    'assigned_at' => $currentTime,
                ]);

                if ($application->project->projectWorkType->count() === $application->project->projectWorkType->whereNotNull('assigned_user_id')->count()) {
                    $projectAssignUpdate = $application->project()->update([
                        'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
                    ]);
                }

                $uuid = $application->user->uuid;
                $projectName = $application->project->name;
            } elseif ($request->project_type_id == ProjectTypeEnum::TURNKEY_CONTRACTOR->value) {
                $project = ProjectTurnkeyContractor::find($request->project_id);
                $userId = $request->user_id;
                if ($project->workRequest->count() == $project->applicationRequest->where('user_id', $userId)->count()) {
                    $applicationWorkType = $project->projectWorkType()->update([
                        'assigned_user_id' => $userId,
                        'assigned_at' => $currentTime,
                    ]);
                    $application = $project->application()->where('user_id', $userId)->update($applicationUpdateArr);
                    $projectUpdate = $project->update([
                        'assigned_user_id' => $userId,
                        'assigned_at' => $currentTime,
                        'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
                    ]);
                    $uuid = User::find($userId)->uuid;
                    $projectName = $project->name;
                } else {
                    return $this->apiError('Applicant not filled all boqs request', 500);
                }
            }

            //send notification
            $title = "Congratulation";
            $message = "You are assigned for project " . $projectName;
            $usersUuid = [$uuid];
            sendNotification($usersUuid, $title, $message);

            return $this->apiSuccess(compact('application'), "Application Assigned successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
