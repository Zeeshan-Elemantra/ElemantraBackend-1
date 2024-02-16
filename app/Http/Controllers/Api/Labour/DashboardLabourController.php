<?php

namespace App\Http\Controllers\Api\Labour;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\ApplicationStatusEnum;
use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Controller;
use App\Models\ProjectLabourApplication;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class DashboardLabourController extends Controller
{
    public function home(Request $request)
    {
        try {
            $labourProjects = ProjectLabourApplication::where('user_id', Auth::id())->count();
            $acceptedCount = ProjectLabourApplication::where('user_id', Auth::id())
                ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                    ->whereHas('project',fn($q)=>$q->whereNotIn('project_status',[(string)ProjectStatusEnum::ASSIGNED->value]))
                ->count();
            $assignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                ->whereNotNull('assigned_user_id')
                ->where('assigned_user_id', Auth::id())->count();

            $user = User::with(['userWorkType'])->find(Auth::id());

            $user->counts = collect([
                'applied' => $labourProjects,
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
