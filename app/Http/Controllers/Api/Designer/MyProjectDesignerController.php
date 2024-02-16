<?php

namespace App\Http\Controllers\Api\Designer;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectIndividualContractor;

class MyProjectDesignerController extends Controller
{
    public function myProjectsHireWork()
    {
        try {
            $turnkeyProjects = ProjectTurnkeyContractor::with([
                'propertyType',
                'address',
                'budgetRange',
                'projectWorkType.workType'
            ])->where('user_id', Auth::id())->latest()->get();

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

            $projects = $turnkeyProjects
                ->concat($individualProjects)
                ->concat($labourProjects)
                ->sortByDesc('created_at')
                ->values(); //$turnkeyMergeIndi->merge($labourProjects)->sortByDesc('created_at')->values();
            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
