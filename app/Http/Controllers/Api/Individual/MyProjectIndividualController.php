<?php

namespace App\Http\Controllers\Api\Individual;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectWorkType;
use App\Models\ProjectWorkTypeApplication;

class MyProjectIndividualController extends Controller
{
    public function myProjectsHireWork()
    {
        try {
            $projects = ProjectLabourContractor::with('workType', 'address')->where('user_id', Auth::id())->latest()->get();
            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
    public function myProjectsFindWork()
    {
        try {
            $projects = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->whereIn(
                'property_type_id',
                Auth::user()->userPropertyType->pluck('property_type_id')
            ))
                ->with([
                    'project' => fn ($q) => $q->with('address', 'propertyType', 'budgetRange'),
                    'projectWorkType.workType'
                ])
                ->whereHas(
                    'projectWorkType',
                    fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id'))
                        ->where(fn ($q) => $q->whereNull('assigned_user_id')
                            ->orWhere('assigned_user_id', Auth::id()))
                            ->whereHas('application',fn($q)=>$q->whereNotNull('applied_at'))
                )

                ->where('user_id', Auth::id())->latest()->get();
            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
