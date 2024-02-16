<?php

namespace App\Http\Controllers\Api\Designer;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ProjectStatusEnum;
use Illuminate\Support\Facades\DB;
use App\Enums\ApplicationStatusEnum;
use App\Enums\ProjectModelEnum;
use App\Enums\ProjectTypeEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;

class DashboardDesignerController extends Controller
{
    public function homeHireWork(Request $request)
    {
        try {
            $user = User::find(Auth::id());

            //labour projects
            $labourProjectCount = ProjectLabourContractor::where('user_id', Auth::id())->count();
            $labourProjectApplicationCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->count();
            $labourProjectAcceptedCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                ->count();
            $labourProjectAssignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', Auth::id())->count();

            //Individual Projcts
            $individualProjectCount = ProjectIndividualContractor::where('user_id', Auth::id())->count();
            $individualProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
                    ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            )
                ->where('project_type', ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value)
                ->whereNotNull('applied_at')
                ->count();
            $individualProjectAcceptedCount = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                ->where('project_type', ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value)
                ->count();
            $individualProjectAssignedCount = ProjectIndividualContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', Auth::id())->count();

            //Labour Project Count
            $turnkeyProjectCount =  ProjectTurnkeyContractor::where('user_id', Auth::id())->count();
            $turnkeyProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
                    ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            )
                ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                ->distinct('user_id')
                ->whereNotNull('applied_at')
                ->count();

            $turnkeyProjectAcceptedCount = ProjectWorkTypeApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
                    ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            )
                ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                ->distinct('user_id')
                ->whereNotNull('applied_at')
                ->count();
            $turnkeyProjectAssignedCount = ProjectTurnkeyContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', Auth::id())->count();

            $user->counts = collect([
                'projects' => collect([$labourProjectCount, $individualProjectCount, $turnkeyProjectCount])->sum(),
                'recieved_application' => collect([$labourProjectApplicationCount, $individualProjectApplicationCount, $turnkeyProjectApplicationCount])->sum(),
                'accepted' => collect([$labourProjectAcceptedCount, $individualProjectAcceptedCount, $turnkeyProjectAcceptedCount])->sum(),
                'assigned' => collect([$labourProjectAssignedCount, $individualProjectAssignedCount,$turnkeyProjectAssignedCount])->sum(),
            ]);
            $is_notified = isNotificationTrue($request->last_check);
            $uuidUpdate = uuidUpdate($request->uuid);
            //force update
            $forceUpdate = config('global.force_update');
            return $this->apiSuccess(compact('user','is_notified','forceUpdate'), "Projects Types Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
