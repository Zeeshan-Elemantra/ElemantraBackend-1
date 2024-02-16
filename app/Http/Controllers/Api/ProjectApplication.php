<?php

namespace App\Http\Controllers\Api;

use App\Enums\ApplicationStatusEnum;
use App\Models\User;
use App\Enums\UserRoleEnum;
use App\Models\ProjectType;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Models\ProjectWorkRequest;
use Illuminate\Console\Application;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\CostSummeryGet;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ApplicationProfile;
use App\Http\Requests\Api\ApplicationRequestMeetAdd;
use App\Models\ProjectWorkRequestApplication;
use App\Http\Requests\Api\ProjectIndividualAdd;
use App\Http\Requests\Api\ApplicationsProjectGet;
use App\Http\Requests\Api\ApplicationAssignAdd;
use App\Models\ProjectLabourApplication;
use App\Models\ReviewCategory;
use Carbon\Carbon;

class ProjectApplication extends Controller
{
    // public function receivedApplications()
    // {
    //     try {
    //         if (Auth::user()->role_id == UserRoleEnum::TURNKEY_CONTRACTOR->value) {
    //             $individualProjects = ProjectIndividualContractor::whereHas('application')->withCount('application')->get();
    //             return $this->apiSuccess(compact('individualProjects'), "Count Fetched successfully");
    //         }
    //     } catch (\Exception $ex) {
    //         return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
    //     }
    // }


    // public function getProjectApplications(ApplicationsProjectGet $request)
    // {
    //     try {
    //         $project = null;
    //         if ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
    //             $project = ProjectIndividualContractor::with([
    //                 'projectWorkType' => fn ($q) => $q->with(['application.user', 'application.applicationRequest', 'workType'])
    //             ])
    //                 ->whereId($request->project_id)->first();
    //         }
    //         return $this->apiSuccess(compact('project'), "Count Fetched successfully");
    //     } catch (\Exception $ex) {
    //         return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
    //     }
    // }

    public function costSummery(CostSummeryGet $request)
    {
        try {
            $summery = ProjectWorkRequestApplication::with(['workRequest' => fn ($q) => $q->with('item', 'itemCategory', 'unit', 'itemDetail', 'itemBrandSpecification')])
                ->where('project_work_type_application_id', $request->id)
                ->get();
            return $this->apiSuccess(compact('summery'), "Summery Fetched successfully");
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
                'review'=>fn($q)=>$q->with('rating.reviewCategory','reviewByUser'),
            ])->withCount([
                'review'
            ])->first();

            $reviewCategoryAvg = ReviewCategory::with([
                'rating' => fn ($q) => $q->where('user_id', Auth::id())
            ])->withCount([
                'rating'
            ])->withAvg('rating as average_rating', 'rating')->get();

            $profile->avg_rating_category = $reviewCategoryAvg;
            $profile->ovreall_rating = $reviewCategoryAvg->pluck('average_rating')->avg();

            // $profile->overall_avg = $reviewCategoryAvg->withAvg('')
            // dd($profile->toArray());

            // $profile = User::whereId($request->id)->with([
            //     'reviewRatings'])
            // ->withCount('review')->first()->toArray();
            // dd($profile);
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
            if($request->project_type_id!=ProjectTypeEnum::SKILLED_LABOUR->value){
                $application = ProjectWorkTypeApplication::whereId($request->id)->update($update);
            }else{
                $application = ProjectLabourApplication::whereId($request->id)->update($update);
            }
            return $this->apiSuccess(compact('application'), "Meet Request Sent successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function assign(ApplicationAssignAdd $request)
    {
        try {
            $application = ProjectWorkTypeApplication::find($request->id);
            $updateApplicationStatus = $application->update(['application_status' => (string)ApplicationStatusEnum::ASSIGNED->value]);
            $workType = $application->projectWorkType()->update([
                'assigned_user_id' => $application->user_id,
                'assigned_at' => Carbon::now()
            ]);
            return $this->apiSuccess(compact('application'), "application Assigned successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
