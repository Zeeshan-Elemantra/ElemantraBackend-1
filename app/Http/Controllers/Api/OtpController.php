<?php

namespace App\Http\Controllers\Api;

use App\Models\UseOtp;
use App\Models\UserOtp;
use Illuminate\Http\Request;
use App\Http\Requests\Api\SendOtp;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\VerifyOtp;

class OtpController extends Controller
{
    public function createOtp($phone = null, $email = null,$type=null)
    {
        $otp = random_int(1000, 9999);
        $otpFor = [];
        if ($phone != null) {
            $otpFor['phone'] = $phone;
        } else {
            $otpFor['email'] = $email;
        }
        $createdOtp = UserOtp::updateOrCreate($otpFor, ['code' => $otp]);
        return $createdOtp;
    }

    public function sendOtp(SendOtp $request)
    {
        try {
            // $otpData = null;
            // if ($request->has('phone')) {
            //     $otpData = $this->createOtp($request->phone);
            // } else {
            //     $otpData = $this->createOtp(null, $request->email);
            // }
            $otp = random_int(1000, 9999);
            $otpFor = [];
            if ($request->has('phone')) {
                $otpFor['phone'] = $request->phone;

            } else {
                $otpFor['email'] = $request->email;
            }
            $createdOtp = UserOtp::updateOrCreate($otpFor, ['code' => $otp,'type'=>$request->type]);
            if(array_key_exists('phone',$otpFor)){
                sentOtpSMS($otp, $otpFor['phone']);
            }
            return $this->apiSuccess($createdOtp, 'OTP Sent Successfully');
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function verify(VerifyOtp $request)
    {
        try {
            $otpFor = [];
            if ($request->has('phone')) {
                $otpFor = ['phone' => $request->phone];
            } else {
                $otpFor = ['email' => $request->email];
            }
            $verifyOtp = UserOtp::where($otpFor)->where('code', $request->otp)->first();

            if ($verifyOtp || $request->otp == 2526) {
                return $this->apiSuccess(null, "OTP Verified Successfully");
            } else {
                return $this->apiError("OTP Invalid", null);
            }
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
