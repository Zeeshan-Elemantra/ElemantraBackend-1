<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\UserWorkType;
use Illuminate\Http\Request;
use App\Http\Requests\Api\WorkAdd;
use App\Http\Controllers\Controller;
use App\Models\WorkType;
use Illuminate\Support\Facades\Auth;

class WorkController extends Controller
{
    public function add(WorkAdd $request)
    {
        try {
            $requestedWorkType = $request->work_types;
            $user = User::find(Auth::id());
            if ($user->role_id === 3) {
                $updateWork = UserWorkType::updateOrCreate(['user_id' => Auth::id()], ['work_type_id' => $requestedWorkType[0]]);
            } else {
                foreach ($requestedWorkType as $key => $id) {
                    $updateWork = UserWorkType::updateOrCreate(['user_id' => Auth::id(), 'work_type_id' => $id], ['work_type_id' => $id]);
                }
            }
            return $this->apiSuccess($user->workType(), "Work Type Added Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function get()
    {
        try {
            $workTypes = WorkType::all();
            return $this->apiSuccess(compact('workTypes'), "Work Type Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
