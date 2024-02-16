<?php

namespace App\Http\Controllers\Api\Turnkey;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ProjectTurnkeyAdd;
use Illuminate\Support\Facades\DB;

class MyProjectTurnkeyController extends Controller
{
    public function myProjectsHireWork()
    {
        try {
            $individualProjects = ProjectIndividualContractor::with([
                'propertyType',
                'address',
                'budgetRange',
                'projectWorkType.workType'
            ])->where('user_id', Auth::id())->latest()->get();

            $labourProjects = ProjectLabourContractor::with([
                'address',
                'workType'
            ])
                ->where('user_id', Auth::id())
                ->latest()->get();

            $projects = $individualProjects->concat($labourProjects)->sortByDesc('created_at')->values();

            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
    public function myProjectsFindWork()
    {
        try {
            $projects = ProjectTurnkeyContractor::withWhereHas('application', fn ($q) => $q->where('user_id', Auth::id())->whereNotNull('applied_at'))
                ->withCount([
                    'workRequest',
                    'applicationRequest' => fn ($q) => $q->where('user_id', Auth::id())
                ])->with([
                    'address',
                    'propertyType',
                    'projectWorkType',
                    'projectWorkType.workType',
                    // 'application'=>fn($q)=>$q->where('user_id',Auth::id())
                ])
                ->where(fn($q)=>$q->whereNull('assigned_user_id')->orWhere('assigned_user_id',Auth::id()))
                ->get()
                ->map(function ($project) {
                    $project->application_status = $project->application[0]->application_status;
                    $project->application_status_text = $project->application[0]->application_status_text;
                    return $project;
                })
                ->filter();
            // ->filter(function ($project) {
            //     return $project->work_request_count === $project->application_request_count;
            // });
            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
