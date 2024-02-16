<?php

namespace App\Http\Controllers\Api\Turnkey;

use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Http\Controllers\Controller;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ApplicationsProjectGet;

class ProjectTurnkeyApplication extends Controller
{
    public function myApplications()
    {
        try {
            $projects = ProjectIndividualContractor::whereHas('application')->withCount('application')->get();
            return $this->apiSuccess(compact('projects'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getApplication(ApplicationsProjectGet $request)
    {
        try {
            $project = null;

            $project = ProjectTurnkeyContractor::with([
                'projectWorkType' => fn ($q) => $q->with(['application.user', 'application.applicationRequest', 'workType'])
            ])
                ->whereId($request->project_id)->first();
            return $this->apiSuccess(compact('project'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
