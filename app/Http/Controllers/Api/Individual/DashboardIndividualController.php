<?php

namespace App\Http\Controllers\Api\Individual;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ProjectStatusEnum;
use App\Enums\ApplicationStatusEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;
use App\Models\ProjectLabourApplication;

class DashboardIndividualController extends Controller
{
    public function homeHireWork(Request $request)
    {
        try {
            $user = User::with(['userWorkType'])->find(Auth::id());
            $projectsCount = ProjectLabourContractor::where('user_id', Auth::id())->count();
            $recievedApplicationsCount = ProjectLabourApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
            )->whereIn(
                'application_status',
                [(string)ApplicationStatusEnum::PENDING->value, (string)ApplicationStatusEnum::MEET->value]
            )->count();
            $acceptedCount = ProjectLabourApplication::whereHas(
                'project',
                fn ($q) => $q->where('user_id', Auth::id())
            )->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])->count();

            $assignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                ->whereNotNull('assigned_user_id')
                ->where('user_id', Auth::id())->count();

            $user->counts = collect([
                'projects' => $projectsCount, //$labourProjects->count(),
                'recieved_application' => $recievedApplicationsCount,
                'accepted' => $acceptedCount,
                'assigned' => $assignedCount,
            ]);
            $is_notified = isNotificationTrue($request->last_check);
            $uuidUpdate = uuidUpdate($request->uuid);
            $forceUpdate = config('global.force_update');
            return $this->apiSuccess(compact('user','is_notified','forceUpdate'), "Projects Types Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function homeFindWork(Request $request)
    {
        try {
            $individualProjects = ProjectWorkTypeApplication::where('user_id', Auth::id())->count();
            $acceptedCount = ProjectWorkTypeApplication::where('user_id', Auth::id())
                ->whereHas(
                    'projectWorkType',
                    fn ($q) => $q->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id'))
                        ->where(fn ($q) => $q->whereNull('assigned_user_id')
                            ->orWhere('assigned_user_id', Auth::id()))
                        ->whereHas('application', fn ($q) => $q->whereNotNull('applied_at'))
                )
                ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                ->count();
            $assignedCount = ProjectWorkTypeApplication::where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                ->whereNotNull('user_id')
                ->where('user_id', Auth::id())->count();

            $user = User::with(['userWorkType'])->find(Auth::id());
            $user->counts = collect([
                'applied' => $individualProjects,
                'accepted' => $acceptedCount,
                'assigned' => $assignedCount,
            ]);
            $is_notified = isNotificationTrue($request->last_check);
            $uuidUpdate = uuidUpdate($request->uuid);
            $forceUpdate = config('global.force_update');
            return $this->apiSuccess(compact('user','is_notified','forceUpdate'), "Projects Types Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
