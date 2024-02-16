<?php

namespace App\Http\Controllers\Api;

use App\Models\Project;
use App\Models\ProjectBoq;
use App\Enums\UserRoleEnum;
use App\Models\BudgetRange;
use App\Models\ProjectType;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use Illuminate\Support\Carbon;
use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Controller;
use App\Models\ProjectSkilledLabour;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\ProjectAdd;
use App\Http\Requests\Api\ProjectGet;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\TurnkeyContractorApplicationGet;

class ProjectController extends Controller
{
    public function getProjectTypes()
    {
        try {
            $types = ProjectType::all();
            return $this->apiSuccess(compact('types'), "Projects Types Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getCategories(TurnkeyContractorApplicationGet $request)
    {
        try {

            if ($request->project_type_id == ProjectTypeEnum::TURNKEY_CONTRACTOR->value) {

            }

            if ($request->project_type_id == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {

            }

            return $this->apiSuccess(compact('project'), "Count Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
