<?php

namespace App\Http\Controllers\Api;

use App\Enums\ElemantraVerificationEnum;
use App\Models\User;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\UserKycAdd;
use App\Models\OnboardStep;
use Carbon\Carbon;

class UserKycController extends Controller
{
    public function add(UserKycAdd $request)
    {
        try {

            $user = User::find(Auth::id());
            if ($request->has('pan')) {
                $fileName = Auth::id() . '_pan';
                $path = storeBase64Image($request->pan['image'], $fileName, MediaPathEnum::USER_KYC->value);
                $panUpdate = $user->kyc()->updateOrCreate([
                    'name' => 'pan',
                    'image' => $path,
                    'number'=>$request->pan['number']
                ]);
            }

            if ($request->has('aadhaar')) {
                $aadhaar = collect($request->aadhaar);
                foreach ($aadhaar->except('number') as $key => $image) {
                    $fileName = Auth::id() . '_aadhaar_' . $key;
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::USER_KYC->value);
                    $panUpdate = $user->kyc()->updateOrCreate([
                        'name' => 'aadhaar_' . $key,
                        'image' => $path,
                        'number'=>$aadhaar['number']
                    ]);
                }
            }
            if ($user->elemantra_verification != (string)ElemantraVerificationEnum::PENDING->value) {
                $user->elemantra_verification = (string)ElemantraVerificationEnum::PENDING->value;
                $user->verification_requested_at = Carbon::now();
                $user->verification_step = OnboardStep::first()->id;
                $user->save();
            }
            return $this->apiSuccess($user->kyc, "KYC Details Added Successfully!");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
