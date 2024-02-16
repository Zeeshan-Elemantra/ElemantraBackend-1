<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\WorkType;
use App\Models\PropertyType;
use App\Models\UserWorkType;
use Illuminate\Http\Request;
use App\Models\UserPropertyType;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\WorkPreferenceAdd;

class WorkPreference extends Controller
{
    public function getWorkPreference(){
        try {
            $propertyTypes = PropertyType::all();
            $workTypes = WorkType::all();
            return $this->apiSuccess(compact('propertyTypes','workTypes'), "Company added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function add(WorkPreferenceAdd $request){
        try {
            $requestedWorkType = $request->work_types;
            $user = User::find(Auth::id());
            // $user->userWorkType()->create([
            //     'work_type_id'=>$request->work_types
            // ]);

            if($user->userWorkType->count()>0){
                $userWorkType = $user->userWorkType[0]->update(['work_type_id'=>$request->work_types]);
            }else{
                $user->userWorkType()->create([
                    'work_type_id'=>$request->work_types
                ]);
            }

            if($request->has('property_types')){
                $requestedPropertyType = $request->property_types;
                foreach ($requestedPropertyType as $key => $id) {
                    $user->userPropertyType()->updateOrCreate(['property_type_id'=>$id]);
                }
            }
            return $this->apiSuccess(compact('user'), "Work Preference added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function update(WorkPreferenceAdd $request){
        try {
            $user = User::find(Auth::id());
            if($user->userWorkType->count()>0){
                $userWorkType = $user->userWorkType[0]->update(['work_type_id'=>$request->work_types]);
            }else{
                $user->userWorkType()->create([
                    'work_type_id'=>$request->work_types
                ]);
            }

            if($request->has('property_types')){
                $requestedPropertyType = $request->property_types;
                $user->userPropertyType()->forceDelete();
                foreach ($requestedPropertyType as $key => $id) {
                    $user->userPropertyType()->updateOrCreate(['property_type_id'=>$id]);
                }
            }

            return $this->apiSuccess(compact('user'), "Work Preference updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

}
