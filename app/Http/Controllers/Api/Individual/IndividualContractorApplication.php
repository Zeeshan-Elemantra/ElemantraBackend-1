<?php

namespace App\Http\Controllers\Api\Individual;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Models\ReviewCategory;
use Illuminate\Support\Carbon;
use Illuminate\Console\Application;
use App\Enums\ApplicationStatusEnum;
use App\Enums\ElemantraVerificationEnum;
use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectWorkTypeApplication;
use App\Http\Requests\Api\ProjectLabourGet;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ApplicationProfile;
use App\Http\Requests\Api\ApplicationAssignAdd;
use App\Http\Requests\Api\LabourApplicationGet;
use App\Http\Requests\Api\ApplicationsProjectGet;
use App\Http\Requests\Api\ApplicationRequestMeetAdd;

class IndividualContractorApplication extends Controller
{
    public function myApplications()
    {
        try {
            $projects = ProjectLabourContractor::withWhereHas('application')
                ->with(['address', 'workType'])
                ->withCount([
                    'application',
                    'application as request_meet_count' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                ])
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                ->where('user_id', Auth::id())
                ->get();
            return $this->apiSuccess(compact('projects'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getApplication(ProjectLabourGet $request)
    {
        try {
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

            return $this->apiSuccess(compact('project'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function profile(ApplicationProfile $request)
    {
        try {
            $profile = User::whereId($request->id)->with([
                'company', 'sampleProjects.images', 'userPropertyType.propertyType',
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


    public function requestMeet(ApplicationRequestMeetAdd $request)
    {
        try {
            $update = [
                'application_status' => (string)ApplicationStatusEnum::MEET->value,
                'meet_at' => Carbon::now()
            ];
            $application = ProjectLabourApplication::whereId($request->id)->update($update);
            $projectApplication = ProjectLabourApplication::find($request->id);

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

    public function assign(LabourApplicationGet $request)
    {
        try {
            $application = ProjectLabourApplication::find($request->id);

            $applicationUpdate = $application->update([
                'application_status' => (string)ApplicationStatusEnum::ASSIGNED->value
            ]);

            $projectAssign = $application->project()->update([
                'assigned_user_id' => $application->user_id,
                'assigned_at' => Carbon::now(),
                'project_status' => (string)ProjectStatusEnum::ASSIGNED->value
            ]);

            //send notification
            $title = "Congratulation";
            $message = "You are assigned for project " . $application->project->name;
            $usersUuid = [$application->user->uuid];
            sendNotification($usersUuid, $title, $message);
            return $this->apiSuccess(compact('application'), "Application Assigned successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
