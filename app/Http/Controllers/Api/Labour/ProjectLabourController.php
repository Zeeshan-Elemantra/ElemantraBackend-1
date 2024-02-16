<?php

namespace App\Http\Controllers\Api\Labour;

use App\Models\BudgetRange;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectTurnkeyContractor;
use App\Http\Requests\Api\ProjectLabourAdd;
use App\Http\Requests\Api\ProjectLabourGet;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ProjectLabourUpdate;
use App\Http\Requests\Api\ProjectIndividualUpdate;
use App\Models\ProjectLabourApplication;
use Carbon\Carbon;

class ProjectLabourController extends Controller
{
    //
    public function addProject(ProjectLabourAdd $request)
    {
        try {
            $projectData = $request->safe()
                ->only(
                    'name',
                    'work_type_id',
                    'description',
                    'working_days',
                    'rate',
                    'start_date',
                    'handover_date',
                );
            $projectData['total_rate'] = $request->working_days * $request->rate;
            $projectData['user_id'] = Auth::id();
            $projectData['project_type_id'] = ProjectTypeEnum::SKILLED_LABOUR->value;
            $projectData['live_at'] = Carbon::now();
            $project = ProjectLabourContractor::create($projectData);

            //address
            $addressData = $request->project_address;
            $addressData['project_type_id'] = ProjectTypeEnum::SKILLED_LABOUR->value;
            $projectAddress = $project->address()->create($addressData);

            return $this->apiSuccess(null, "Project Created Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectLabourGet $request)
    {
        try {
            $project = ProjectLabourContractor::with([
                'address', 'workType',
                'assignedUser' => fn ($q) => $q->withAvg('reviewRatings', 'rating')
            ])->whereId($request->id)->first();
            return $this->apiSuccess($project, "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updateProject(ProjectLabourUpdate $request)
    {
        try {
            $projectData = $request->safe()
                ->only(
                    'description',
                    'working_days',
                    'start_date',
                    'handover_date',
                    'rate',
                );
            $projectData['total_rate'] = $request->working_days * $request->rate;
            $project = ProjectLabourContractor::whereId($request->id)->update($projectData);
            return $this->apiSuccess(compact('project'), "Project Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function myProjects()
    {
        try {
            $projects = ProjectLabourApplication::withWhereHas(
                'project',
                fn ($q) => $q->whereIn(
                    'work_type_id',
                    Auth::user()->userWorkType->pluck('work_type_id')
                )
                    ->where(fn ($q) => $q->whereNull('assigned_user_id')
                        ->orWhere('assigned_user_id', Auth::id()))

            )
                ->with([
                    'project.address',
                    'project.workType'
                ])

                ->where('user_id', Auth::id())->latest()->get();
            return $this->apiSuccess(compact('projects'), "Project Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteProject(ProjectLabourGet $request)
    {
        try {
            $projects = ProjectLabourContractor::destroy($request->id);
            return $this->apiSuccess(compact('projects'), "Project Deleted Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
