<?php

namespace App\Http\Controllers\Api\Turnkey;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Enums\ProjectStatusEnum;
use App\Models\ProjectWorkRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectTurnkeyContractor;
use App\Http\Requests\Api\CostSummeryGet;
use App\Models\ProjectWorkTypeApplication;
use App\Http\Requests\Api\GetRequestToSave;
use App\Http\Requests\Api\ProjectTurnkeyGet;
use App\Http\Requests\Api\ApplyIndvidualWork;
use App\Http\Requests\Api\ApplyTurnkeyWork;
use App\Models\ProjectWorkRequestApplication;
use App\Http\Requests\Api\ProjectTurnkeyRequestGet;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class TurnkeyFindController extends Controller
{
    public function searchProjects(Request $request)
    {
        try {
            $projects = ProjectTurnkeyContractor::with(['address', 'budgetRange', 'propertyType'])
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
                // ->withWhereHas('projectWorkType', fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id')))

                /*
                    There is no work preference or work type for turneky contractor
                */

                ->whereIn('project_status', [(string)ProjectStatusEnum::LIVE->value, (string)ProjectStatusEnum::APPLICATIONS->value])
                ->latest()
                ->get();
            return $this->apiSuccess(compact('projects'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectTurnkeyGet $request)
    {
        try {

            $project = ProjectTurnkeyContractor::with([
                'address',
                'budgetRange',
                'propertyType',
                'user',
                'assignedUser',
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
                    ], 'over_all_total')

            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->where('user_id', Auth::id())], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('user_id', Auth::id())], 'over_all_total')
                ->whereId($request->id)
                ->first();

            if ($project->projectWorkType->isNotEmpty()) {
                // $project->application_object = null;
                $application_object = null;
                $project->projectWorkType->each(function ($workType) use (&$application_object) {
                    if ($workType->application->isNotEmpty()) {
                        $application_object = $workType->application[0];
                    }
                });
                $project->application_object = $application_object;
            }
            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getRequest(ProjectTurnkeyRequestGet $request)
    {
        try {

            $workRequest = ProjectWorkRequest::whereId($request->id)
                ->with([
                    'project',
                    'projectWorkType.workType',
                    'item',
                    'itemCategory',
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

            // Update project status
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

    public function apply(ApplyTurnkeyWork $request)
    {
        try {

            // $workTypeApplication = ProjectWorkTypeApplication::withCount([
            //     'applicationRequest',
            // ])->with([
            //     'projectWorkType' => fn ($q) => $q->withCount('workRequest')
            // ])->find($request->project_application_id);

            // if ($workTypeApplication->application_request_count != $workTypeApplication->projectWorkType->work_request_count) {
            //     return $this->apiError('Please Submit all BoQs related with category', 500);
            // }
            // $workTypeApplication->update(['applied_at' => Carbon::now()]);
            // // Update project status
            // $workTypeApplication->project()->update(['project_status' => (string) ProjectStatusEnum::APPLICATIONS->value]);

            $project = ProjectTurnkeyContractor::whereId($request->id)->withCount([
                'applicationRequest' => fn ($q) => $q->where('user_id', Auth::id()),
                'workRequest'
            ])->withWhereHas('application', fn ($q) => $q->where('user_id', Auth::id()))->first();

            if ($project->application_request_count != $project->work_request_count) {
                return $this->apiError('Please Submit all BoQs related with category', 500);
            }
            //application status upate
            $updateApplication = $project->application()->where('user_id', Auth::id())->update(['applied_at' => Carbon::now()]);

            //update project status
            $projectUpdate = $project->update(['project_status' => (string) ProjectStatusEnum::APPLICATIONS->value]);

            //send notification
            $title = "Application Recieved";
            $message = Auth::user()->name . " applied your project " . $project->name;
            $usersUuid = [$project->user->uuid];

            sendNotification($usersUuid, $title, $message);

            return $this->apiSuccess(compact('updateApplication'), "Project Applied Successfully");
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
