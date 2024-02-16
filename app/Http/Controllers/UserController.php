<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use App\Models\UserKyc;
use App\Enums\UserRoleEnum;
use Illuminate\Http\Request;
use App\Enums\ProjectModelEnum;
use App\Enums\ProjectStatusEnum;
use Illuminate\Support\Facades\DB;
use App\Enums\ApplicationStatusEnum;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectWorkTypeApplication;
use App\Models\ProjectIndividualContractor;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        try {
            $roles = Role::all();
            $users = User::with(['role', 'userWorkType.workType'])
                ->when(
                    $request->search_role,
                    fn ($q) => $q->where('role_id', $request->search_role)
                )
                ->when(
                    $request->search,
                    fn ($q) => $q->where(
                        fn ($q) =>
                        $q->where('name', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('phone', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('alt_phone', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('email', 'LIKE', '%' . $request->search . '%')
                    )
                )
                ->latest()
                ->paginate(10)
                ->withQueryString();

            $users->getCollection()->transform(function ($user) {
                $created_projects_count = collect();
                $applied_projects_count = collect();
                if (($user->role_id == UserRoleEnum::DESIGNER->value)) {
                    //labour projects
                    $labourProjectCount = ProjectLabourContractor::where('user_id', $user->id)->count();
                    $labourProjectApplicationCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)
                        ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->count();
                    $labourProjectAcceptedCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)
                        ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                        ->count();
                    $labourProjectAssignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', $user->id)->count();

                    //Individual Projcts
                    $individualProjectCount = ProjectIndividualContractor::where('user_id', $user->id)->count();
                    $individualProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->where('project_type', ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value)
                        ->whereNotNull('applied_at')
                        ->count();
                    $individualProjectAcceptedCount = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                        ->where('project_type', ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value)
                        ->count();
                    $individualProjectAssignedCount = ProjectIndividualContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', $user->id)->count();

                    //Labour Project Count
                    $turnkeyProjectCount =  ProjectTurnkeyContractor::where('user_id', $user->id)->count();
                    $turnkeyProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                        ->distinct('user_id')
                        ->whereNotNull('applied_at')
                        ->count();

                    $turnkeyProjectAcceptedCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                        ->where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
                        ->distinct('user_id')
                        ->whereNotNull('applied_at')
                        ->count();
                    $turnkeyProjectAssignedCount = ProjectTurnkeyContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', $user->id)->count();


                    $created_projects_count = collect([
                        'projects' => collect([$labourProjectCount, $individualProjectCount, $turnkeyProjectCount])->sum(),
                        'recieved_application' => collect([$labourProjectApplicationCount, $individualProjectApplicationCount, $turnkeyProjectApplicationCount])->sum(),
                        'accepted' => collect([$labourProjectAcceptedCount, $individualProjectAcceptedCount, $turnkeyProjectAcceptedCount])->sum(),
                        'assigned' => collect([$labourProjectAssignedCount, $individualProjectAssignedCount, $turnkeyProjectAssignedCount])->sum(),
                    ]);
                } elseif ($user->role_id == UserRoleEnum::TURNKEY_CONTRACTOR->value) {
                    //individual projects
                    $individualProjectCount = ProjectIndividualContractor::where('user_id', $user->id)->count();
                    $individualProjectAssignedCount = ProjectIndividualContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', $user->id)->count();
                    $individualProjectApplicationCount = ProjectWorkTypeApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                            ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value])
                    )
                        ->whereNotNull('applied_at')
                        ->count();

                    $individualProjectAcceptedCount = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                        ->count();


                    //labour project
                    $labourProjectCount = ProjectLabourContractor::where('user_id', $user->id)->count();
                    $labourProjectAssignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)->where('user_id', $user->id)->count();
                    $labourProjectApplicationCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)
                        ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->count();
                    $labourProjectAcceptedCount = ProjectLabourApplication::whereHas('project', fn ($q) => $q->where('user_id', $user->id)
                        ->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])
                        ->count();

                    $created_projects_count = collect([
                        'projects' => collect([$individualProjectCount, $labourProjectCount])->sum(),
                        'recieved_application' => collect([$individualProjectApplicationCount, $labourProjectApplicationCount])->sum(),
                        'accepted' => collect([$individualProjectAcceptedCount, $labourProjectAcceptedCount])->sum(),
                        'assigned' => collect([$individualProjectAssignedCount, $labourProjectAssignedCount])->sum(),
                    ]);

                    //applied count
                    $turkeyProjects = ProjectTurnkeyContractor::whereHas('application', fn ($q) => $q->where('user_id', $user->id)->whereNotNull('applied_at'))->count();
                    $acceptedCount = ProjectTurnkeyContractor::whereHas('application', fn ($q) => $q->where('user_id', $user->id)->where('application_status', (string)ApplicationStatusEnum::MEET->value))
                        ->count();
                    $assignedCount = ProjectTurnkeyContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                        ->whereNotNull('assigned_user_id')
                        ->where('assigned_user_id', $user->id)
                        ->count();

                    $applied_projects_count = collect([
                        'applied' => $turkeyProjects,
                        'accepted' => $acceptedCount,
                        'assigned' => $assignedCount,
                    ]);
                } elseif ($user->role_id == UserRoleEnum::INDIVIDUAL_CONTRACTOR->value) {

                    $projectsCount = ProjectLabourContractor::where('user_id', $user->id)->count();
                    $recievedApplicationsCount = ProjectLabourApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                    )->whereIn(
                        'application_status',
                        [(string)ApplicationStatusEnum::PENDING->value, (string)ApplicationStatusEnum::MEET->value]
                    )->count();
                    $acceptedCount = ProjectLabourApplication::whereHas(
                        'project',
                        fn ($q) => $q->where('user_id', $user->id)
                    )->whereIn('application_status', [(string)ApplicationStatusEnum::MEET->value])->count();

                    $assignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                        ->whereNotNull('assigned_user_id')
                        ->where('user_id', $user->id)->count();

                    $created_projects_count = collect([
                        'projects' => $projectsCount, //$labourProjects->count(),
                        'recieved_application' => $recievedApplicationsCount,
                        'accepted' => $acceptedCount,
                        'assigned' => $assignedCount,
                    ]);

                    //applied count
                    $individualProjects = ProjectWorkTypeApplication::where('user_id', $user->id)->count();
                    $acceptedCount = ProjectWorkTypeApplication::where('user_id', $user->id)
                        ->whereHas(
                            'projectWorkType',
                            fn ($q) => $q->whereIn('work_type_id', User::find($user->id)->userWorkType->pluck('work_type_id'))
                                ->where(fn ($q) => $q->whereNull('assigned_user_id')
                                    ->orWhere('assigned_user_id', $user->id))
                                ->whereHas('application', fn ($q) => $q->whereNotNull('applied_at'))
                        )
                        ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                        ->count();
                    $assignedCount = ProjectWorkTypeApplication::where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                        ->whereNotNull('user_id')
                        ->where('user_id', $user->id)->count();

                    $applied_projects_count = collect([
                        'applied' => $individualProjects,
                        'accepted' => $acceptedCount,
                        'assigned' => $assignedCount,
                    ]);
                } elseif ($user->role_id == UserRoleEnum::LABOUR->value) {

                    $labourProjects = ProjectLabourApplication::where('user_id', $user->id)->count();
                    $acceptedCount = ProjectLabourApplication::where('user_id', $user->id)
                        ->where('application_status', (string)ApplicationStatusEnum::MEET->value)
                        ->whereHas('project', fn ($q) => $q->whereNotIn('project_status', [(string)ProjectStatusEnum::ASSIGNED->value]))
                        ->count();
                    $assignedCount = ProjectLabourContractor::where('project_status', (string)ProjectStatusEnum::ASSIGNED->value)
                        ->whereNotNull('assigned_user_id')
                        ->where('assigned_user_id', $user->id)->count();

                    $applied_projects_count = collect([
                        'applied' => $labourProjects,
                        'accepted' => $acceptedCount,
                        'assigned' => $assignedCount,
                    ]);
                }
                $user->applied_projects_count = $applied_projects_count;
                $user->created_projects_count = $created_projects_count;

                return $user;
            });
            // dd($users->toArray());
            return view('admin.user-index', compact('users', 'roles'));
        } catch (\Exception $ex) {
            return $this->ajaxError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::with([
            'kyc',
            'userPropertyType.propertyType',
            'userWorkType.workType',
            'company', 'sampleProjects.images'
        ])->find($id);
        // dd($user->toArray());

        return view('admin.user-view', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function userKyc(Request $request, $user_id)
    {
        $user = User::with('kyc')->whereId($user_id)->first();
        // dd($user->toArray());
        return view('admin.user-kyc-view', compact('user'));
    }
}
