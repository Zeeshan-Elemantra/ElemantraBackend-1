<?php

namespace App\Http\Controllers\Api\Individual;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\ProjectWorkType;
use App\Enums\ProjectStatusEnum;
use App\Models\ProjectWorkRequest;
use Illuminate\Console\Application;
use Illuminate\Support\Facades\Log;
use App\Enums\ApplicationStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectWorkTypeApplication;
use App\Http\Requests\Api\GetRequestToSave;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ApplyIndvidualWork;
use App\Http\Requests\Api\ProjectIndividualGet;
use App\Http\Requests\Api\ProjectIndividualRequestGet;

class IndividualFindController extends Controller
{
    public function searchProjects(Request $request)
    {
        try {
            $projects = ProjectIndividualContractor::with(['address', 'budgetRange', 'propertyType'])
                ->when($request->search, function ($q) use ($request) {
                    $q->where(function ($q) use ($request) {
                        $q->where('name', 'LIKE', '%' . $request->search . '%')
                            ->orWhereHas('address', function ($q) use ($request) {
                                $q->where('address', 'LIKE', '%' . $request->search . '%')
                                    ->orWhere('city', 'LIKE', '%' . $request->search . '%')
                                    ->orWhere('pincode', 'LIKE', '%' . $request->search . '%');
                            });
                    });
                })
                ->withWhereHas(
                    'projectWorkType',
                    fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id'))
                        ->whereNull('assigned_user_id')
                )
                ->whereIn('property_type_id', Auth::user()->userPropertyType->pluck('property_type_id'))
                ->whereIn('project_status', [(string)ProjectStatusEnum::LIVE->value, (string)ProjectStatusEnum::APPLICATIONS->value])
                ->latest()
                ->get();
            return $this->apiSuccess(compact('projects'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectIndividualGet $request)
    {
        try {

            $project = ProjectIndividualContractor::with([
                'address', 'budgetRange', 'propertyType', 'user',
                'projectWorkType' => fn ($q) => $q->with([
                    'workType',
                    'workRequest',
                    'workRequest.item',
                    'workRequest.itemCategory',
                    'workRequest.itemDetail',
                    'workRequest.itemBrandSpecification',
                    'workRequest.unit',
                    'workRequest.applicationRequest' => fn ($q) => $q->where('user_id', Auth::id()),
                    'application' => fn ($q) => $q->where('user_id', Auth::id())
                ])
                    ->withSum([
                        'application as over_all_cost' => fn ($q) => $q->where('user_id', Auth::id())
                            ->whereHas('projectWorkType', fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id')))

                    ], 'over_all_total')
                    ->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id')),
            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->whereHas('projectWorkType', fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id')))->where('user_id', Auth::id())], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->whereHas('projectWorkType', fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id')))->where('user_id', Auth::id())], 'over_all_total')
                ->whereId($request->id)->first();

            $project->application_object = null;
            if ($project->projectWorkType[0]->application->isNotEmpty()) {
                $project->application_object = $project->projectWorkType[0]->application[0];
            }

            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getRequest(ProjectIndividualRequestGet $request)
    {
        try {

            $workRequest = ProjectWorkRequest::whereId($request->id)
                ->with([
                    'project',
                    'projectWorkType.workType',
                    'item', 'itemCategory',
                    'itemDetail',
                    'itemBrandSpecification',
                    'unit',
                    'images',
                    'applicationRequest' => fn ($q) => $q->where('user_id', Auth::id())->with('application'),
                ])
                ->first();

            $workRequest->application_object = null;
            if ($workRequest->applicationRequest->isNotEmpty()) {
                $workRequest->application_object = $workRequest->applicationRequest[0]->application;
            }

            return $this->apiSuccess($workRequest, "Request Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function saveRequest(GetRequestToSave $request)
    {
        try {
            // Find the ProjectWorkRequest instance by ID
            $workRequest = ProjectWorkRequest::with(['project', 'projectWorkType'])->find($request->id);

            // Create or update ProjectWorkTypeApplication record
            $projectWorkTypeApplication = $workRequest->projectWorkType->application()->updateOrCreate([
                'project_type' => $workRequest->projectWorkType->project_type,
                'project_id' => $workRequest->projectWorkType->project_id,
                'user_id' => Auth::id(),
                'role_id' => Auth::user()->role_id
            ]);

            // // Update project status
            // $workRequest->projectWorkType->project()->update(['project_status' => (string) ProjectStatusEnum::APPLICATIONS->value]);

            // Create or update ProjectWorkRequestApplication record and set the rate
            $projectWorkTypeApplication->applicationRequest()->updateOrCreate(
                [
                    'project_work_request_id' => $workRequest->id,
                    'user_id' => Auth::id(),
                    'project_type' => $projectWorkTypeApplication->project_type,
                    'project_id' => $projectWorkTypeApplication->project_id,
                ],
                [
                    'rate' => $request->rate,
                    'rate_total' => $request->rate * $workRequest->quantity
                ]
            );

            // Update the sub_total for ProjectWorkTypeApplication
            $projectWorkTypeApplication->update([
                'sub_total' => $projectWorkTypeApplication->applicationRequest->where('user_id', Auth::id())->sum('rate'),
                'over_all_total' => $projectWorkTypeApplication->applicationRequest->where('user_id', Auth::id())->sum('rate_total')
            ]);

            return $this->apiSuccess(compact('workRequest'), "BoQ Rate Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function apply(ApplyIndvidualWork $request)
    {
        try {
            $workTypeApplication = ProjectWorkTypeApplication::withCount([
                'applicationRequest',
            ])->with([
                'projectWorkType' => fn ($q) => $q->withCount('workRequest')
            ])->find($request->project_application_id);

            if ($workTypeApplication->application_request_count != $workTypeApplication->projectWorkType->work_request_count) {
                return $this->apiError('Please Submit all BoQs related with category', 500);
            }
            $updateAppliedAt = $workTypeApplication->update(['applied_at' => Carbon::now()]);

            // Update project status
            $updateProject = $workTypeApplication->project()->update(['project_status' => (string) ProjectStatusEnum::APPLICATIONS->value]);

            //send notification
            $title = "Application Recieved";
            $message = Auth::user()->name . " applied your project " . $workTypeApplication->project->name;
            $usersUuid = [$workTypeApplication->project->user->uuid];

            sendNotification($usersUuid,$title,$message);

            return $this->apiSuccess(compact('workTypeApplication'), "Project Applied Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
