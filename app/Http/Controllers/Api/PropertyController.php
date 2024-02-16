<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\PropertyAdd;
use App\Models\PropertyType;
use App\Models\UserPropertyType;

class PropertyController extends Controller
{
    public function add(PropertyAdd $request){
        try {
            $requestedPropertyType = $request->property_types;
            $user = User::with('userPropertyType')->whereId(Auth::id())->first();
            foreach ($requestedPropertyType as $key => $id) {
                $updateProperty = UserPropertyType::updateOrCreate(['user_id'=>Auth::id(),'property_type_id'=>$id],['property_type_id'=>$id]);
            }
            return $this->apiSuccess($user->propertType, "Property Type Added Successfully!");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function userProperty(){
        try {
            // dd(Auth::id());
            $propertyTypes = UserPropertyType::with('propertyType')->where('user_id',Auth::id())
            ->get();
            return $this->apiSuccess(compact('propertyTypes'), "Property Type Fetched Successfully!");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getAll(){
        try {
            $propertyTypes = PropertyType::all();
            return $this->apiSuccess(compact('propertyTypes'), "Property Type Fetched Successfully!");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

}
