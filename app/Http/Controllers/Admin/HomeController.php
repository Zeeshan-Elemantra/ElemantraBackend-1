<?php

namespace App\Http\Controllers\Admin;

use App\Enums\ElemantraVerificationEnum;
use App\Enums\ProjectModelEnum;
use App\Models\User;
use App\Enums\UserRoleEnum;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use App\Models\ProjectIndividualContractor;
use App\Models\ProjectLabourApplication;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectTurnkeyContractor;
use App\Models\ProjectWorkTypeApplication;

class HomeController extends Controller
{
    public function __invoke(Request $request)
    {

        $currentDate = Carbon::now();

        /* ---Users count start here */
        $usersCount = [
            'all' => User::count(),
            'designer' => User::where('role_id', UserRoleEnum::DESIGNER->value)->count(),
            'turnkey' => User::where('role_id', UserRoleEnum::TURNKEY_CONTRACTOR->value)->count(),
            'individual' => User::where('role_id', UserRoleEnum::INDIVIDUAL_CONTRACTOR->value)->count(),
            'labour' => User::where('role_id', UserRoleEnum::LABOUR->value)->count(),
        ];

        $currentMonthUsersCount = [
            'all' => User::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count(),
            'designer' => User::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->where('role_id', UserRoleEnum::DESIGNER->value)->count(),
            'turnkey' => User::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->where('role_id', UserRoleEnum::TURNKEY_CONTRACTOR->value)->count(),
            'individual' => User::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->where('role_id', UserRoleEnum::INDIVIDUAL_CONTRACTOR->value)->count(),
            'labour' => User::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->where('role_id', UserRoleEnum::LABOUR->value)->count(),
        ];

        $elemantraApplication = User::whereIn('elemantra_verification', [(string)ElemantraVerificationEnum::PENDING->value, (string)ElemantraVerificationEnum::VERIFIED->value])->count();
        $elemantraVerified = User::where('elemantra_verification', (string)ElemantraVerificationEnum::VERIFIED->value)->count();
        $elemantraUsers = [
            'all' => $elemantraApplication + $elemantraVerified,
            'application' => $elemantraApplication,
            'verified' => $elemantraVerified
        ];
        /* ---Users count end here */

        /* projects count start here */
        $projectsCount = [
            'all' => ProjectTurnkeyContractor::count() + ProjectIndividualContractor::count() + ProjectLabourContractor::count(),
            'turnkey' => ProjectTurnkeyContractor::count(),
            'individual' => ProjectIndividualContractor::count(),
            'labour' => ProjectLabourContractor::count()
        ];

        $currentMonthProjectsCount = [
            'all' => ProjectTurnkeyContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count() + ProjectIndividualContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count() + ProjectLabourContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count(),
            'turnkey' => ProjectTurnkeyContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count(),
            'individual' => ProjectIndividualContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count(),
            'labour' => ProjectLabourContractor::whereMonth('created_at', $currentDate->month)->whereYear('created_at', $currentDate->year)->count()
        ];

        $applicationCountLabour = ProjectLabourApplication::whereMonth('created_at', $currentDate->month)
            ->whereYear('created_at', $currentDate->year)->count();
        $applicationCountIndividual = ProjectWorkTypeApplication::whereHas('project', fn ($q) => $q->where('project_type', ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value))
            ->whereMonth('created_at', $currentDate->month)
            ->whereYear('created_at', $currentDate->year)
            ->whereNotNull('applied_at')
            ->count();
        $applicationCountTurnkey = ProjectWorkTypeApplication::where('project_type', ProjectModelEnum::TURNKEY_CONTRACTOR->value)
            ->whereMonth('created_at', $currentDate->month)
            ->whereYear('created_at', $currentDate->year)
            ->distinct('user_id')
            ->whereNotNull('applied_at')
            ->count();

        $applicationsMonthCount = [
            'all' => $applicationCountLabour + $applicationCountIndividual + $applicationCountTurnkey,
            'labour' => $applicationCountLabour,
            'individual' => $applicationCountIndividual,
            'turnkey' => $applicationCountTurnkey,
        ];
        /* projects count end here */

        return view('admin.home', compact('usersCount', 'currentMonthUsersCount', 'elemantraUsers', 'projectsCount', 'currentMonthProjectsCount', 'applicationsMonthCount'));
    }
}
