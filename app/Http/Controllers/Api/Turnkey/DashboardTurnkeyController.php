<?php

namespace App\Http\Controllers\Api\Turnkey;

use App\Models\User;
use App\Enums\UserRoleEnum;
use Illuminate\Http\Request;
use App\Enums\ProjectStatusEnum;
use App\Enums\ApplicationStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectIndividualContractor;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectWorkTypeApplication;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class DashboardTurnkeyController extends Controller
{
    //
    public function homeHireWork(Request $request)
    {
        try {
            $user = User::find(Auth::id());

            //individual projects
            $individualProjectCount = ProjectIndividualContractor::where('user_id', Auth::id())->count();
            $individualProjectAssignedCount = ProjectIndividualContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', Auth::id())->count();
            $individualProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
                    ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
            )
                ->whereNotNull('applied_at')
                ->count();

            $individualProjectAcceptedCount = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                ->count();


            //labour project
            $labourProjectCount = ProjectLabourContractor::where('user_id', Auth::id())->count();
            $labourProjectAssignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', Auth::id())->count();
            $labourProjectApplicationCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->count();
            $labourProjectAcceptedCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', Auth::id())
                ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                ->count();

            $user->counts = collect([
                'projects' => collect([$individualProjectCount, $labourProjectCount])->sum(),
                'recieved_application' => collect([$individualProjectApplicationCount, $labourProjectApplicationCount])->sum(),
                'accepted' => collect([$individualProjectAcceptedCount, $labourProjectAcceptedCount])->sum(),
                'assigned' => collect([$individualProjectAssignedCount, $labourProjectAssignedCount])->sum(),

                // 'projects' => collect([$individualProjectCount])->sum(),
                // 'recieved_application' => collect([$individualProjectApplicationCount])->sum(),
                // 'accepted' => collect([$individualProjectAcceptedCount])->sum(),
                // 'assigned' => collect([$individualProjectAssignedCount])->sum(),

            ]);
            $is_notified = isNotificationTrue($request->last_check);
            $uuidUpdate = uuidUpdate($request->uuid);
            $forceUpdate = config('global.force_update');
            return $this->apiSuccess(compact('user', 'is_notified','forceUpdate'), "Projects Types Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function homeFindWork(Request $request)
    {
        try {

            $turkeyProjects = ProjectTurnkeyContractor::whereHas('application', fn ($q) => $q->where('user_id', Auth::id())->whereNotNull('applied_at'))->count();
            $acceptedCount = ProjectTurnkeyContractor::whereHas(
                'application',
                fn ($q) => $q->where('user_id', Auth::id())
                    ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
            )
                ->where(fn ($q) => $q->whereNull('assigned_user_id')->orWhere('assigned_user_id', Auth::id()))
                ->count();
            $assignedCount = ProjectTurnkeyContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                ->whereNotNull('assigned_user_id')
                ->where('assigned_user_id', Auth::id())
                ->count();

            $user = User::find(Auth::id());
            $user->counts = collect([
                'applied' => $turkeyProjects,
                'accepted' => $acceptedCount,
                'assigned' => $assignedCount,
            ]);
            $is_notified = isNotificationTrue($request->last_check);
            $uuidUpdate = uuidUpdate($request->uuid);
            $forceUpdate = config('global.force_update');
            return $this->apiSuccess(compact('user', 'is_notified','forceUpdate'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
