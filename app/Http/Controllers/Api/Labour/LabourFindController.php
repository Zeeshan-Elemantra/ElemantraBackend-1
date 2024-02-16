<?php

namespace App\Http\Controllers\Api\Labour;

use Illuminate\Http\Request;
use App\Enums\ProjectStatusEnum;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Http\Requests\Api\ProjectLabourGet;

class LabourFindController extends Controller
{
    //
    public function searchProjects(Request $request)
    {
        try {

            $projects = ProjectLabourContractor::with(['address', 'workType'])
                ->when($request->search, function ($q) use ($request) {
                    $q->where(function ($q) use ($request) {
                        $q->where('name', 'LIKE', '%' . $request->search . '%')
                            ->orWhereHas('address', function ($q) use ($request) {
                                $q->where('address', 'LIKE', '%' . $request->search . '%')
                                    ->orWhere('city', 'LIKE', '%' . $request->search . '%')
                                    ->orWhere('pincode', 'LIKE', '%' . $request->search . '%');
                            });
                    });
                })
                // ->doesntHave('application',fn($q)=>$q->where('user_id',Auth::id()))
                ->whereIn('work_type_id', Auth::user()->userWorkType->pluck('work_type_id'))
                ->whereIn('project_status', [ProjectStatusEnum::LIVE->value, ProjectStatusEnum::APPLICATIONS->value])
                ->latest()
                ->get();
            return $this->apiSuccess(compact('projects'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectLabourGet $request)
    {
        try {
            $project = ProjectLabourContractor::with([
                'address',
                'workType',
                'user', 'application' => fn ($q) => $q->where('user_id', Auth::id())
            ])
                ->whereId($request->id)->first();
            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function apply(ProjectLabourGet $request)
    {
        try {

            $project = ProjectLabourContractor::find($request->id);
            $projectApplication = $project->application()->updateOrCreate([
                'user_id' => Auth::id(),
                'role_id' => Auth::user()->role_id
            ]);
            $project->project_status = (string)ProjectStatusEnum::APPLICATIONS->value;
            $project->save();

            //send notification
            $title = "Application Recieved";
            $message = Auth::user()->name." applied your project ".$project->name;
            $usersUuid = [$project->user->uuid];

            sendNotification($usersUuid,$title,$message);

            return $this->apiSuccess(compact('projectApplication'), "Project Applied Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
