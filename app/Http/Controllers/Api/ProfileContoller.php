<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Api\UpdatePlayerId;
use App\Http\Requests\Api\ProfileEmailUpdate;
use App\Http\Requests\Api\ProfileImageUpdate;
use App\Http\Requests\Api\ProfilePhoneUpdate;
use App\Http\Requests\Api\ProfileAltContactUpdate;
use App\Http\Requests\Api\ProfleCurrentWorkUpdate;

class ProfileContoller extends Controller
{
    public function profile(Request $request)
    {
        try {
            $user = User::getOverAllRate()->with('userWorkType.workType','company','userPropertyType.propertyType')->find(Auth::id());
            return $this->apiSuccess(compact('user'), "User Details fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function imageUpdate(ProfileImageUpdate $request)
    {
        try {
            $user = User::find(Auth::id());
            $fileName = Auth::id() . '_profile';
            $path = storeBase64Image($request->image, $fileName, MediaPathEnum::USER_PROFILE->value);
            $user->profile = $path;
            $user->save();
            return $this->apiSuccess(compact('user'), "User Profile updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updateAltPhone(ProfileAltContactUpdate $request)
    {
        try {
            $user = User::find(Auth::id());
            $user->alt_phone = $request->alt_phone;
            $user->save();
            return $this->apiSuccess(compact('user'), "User Profile updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updatePhone(ProfilePhoneUpdate $request)
    {
        try {
            $user = User::find(Auth::id());
            $user->phone = $request->phone;
            $user->save();
            return $this->apiSuccess(compact('user'), "User Profile updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updateEmail(ProfileEmailUpdate $request)
    {
        try {
            $user = User::find(Auth::id());
            if($user->email_verified_at!=null || $user->oauth_login==true){
                return $this->apiError('This email cant be changed due to google signup', 500);
            }
            $user->email = $request->email;
            $user->save();
            return $this->apiSuccess(compact('user'), "User Profile updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function updateCurrentWork(ProfleCurrentWorkUpdate $request)
    {
        try {
            $user = User::find(Auth::id());
            $user->current_work = $request->current_work;
            $user->save();
            return $this->apiSuccess(compact('user'), "Interface Switched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updatePlayerId(UpdatePlayerId $request)
    {
        try {
            $user = User::find(Auth::id());
            $user->uuid = $request->uuid;
            $user->save();
            return $this->apiSuccess(compact('user'), "User Player Id updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteAccount(){
        try {
            return $this->apiSuccess(null, "Your account will deleted within 24hrs");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


}
