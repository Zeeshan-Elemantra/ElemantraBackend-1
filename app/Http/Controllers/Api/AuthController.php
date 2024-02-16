<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\Api\Login;
use App\Http\Requests\Api\Register;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ChangePassword;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function register(Register $request)
    {
        try {

            $userData = $request->safe()->only('role_id', 'name', 'email', 'phone', 'alt_phone', 'password', 'oauth_login');
            if($request->has('oauth_login') && ($request->oauth_login==true || $request->oauth_login=='true' || $request->oauth_login=='1')){
                $userData['oauth_login'] = true;
                $userData['email_verified_at'] = Carbon::now();
            }
            if ($request->has('password')) {
                $userData['password'] = Hash::make($userData['password']);
            }
            $user = User::create($userData);
            $user = User::with('role')->whereId($user->id)->first();
            $token = $user->createToken('auth-token')->plainTextToken;
            $token = substr($token, strpos($token, "|") + 1);
            $user->token = $token;
            return $this->apiSuccess($user, "Congratulations! 🎉 You have successfully signed up!");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function login(Login $request)
    {
        try {
            $userData = $request->safe()->only('phone', 'password');
            $userData['oauth_login'] = 0;

            if ($request->has('oauth_login') && $request->oauth_login == true) {

                $user = User::with('role')->where('email', $request->email)->where('oauth_login', 1)->whereNotNull('email_verified_at')->first();

                if ($user) {
                    // If user with provided email and oauth_login = 1 is found, attempt login
                    if (Auth::loginUsingId($user->id)) {
                        $token = $user->createToken('auth-token')->plainTextToken;
                        $token = substr($token, strpos($token, "|") + 1);
                        $user->token = $token;
                        return $this->apiSuccess($user, "Congratulations! 🎉 You have successfully signed in!");
                    }
                }

                return $this->apiError("Please Enter Valid Password", null, 500);
            }

            if (Auth::attempt($userData)) {
                $user = User::with('role:id,name,role')->whereId(Auth::id())->first();
                $token = $user->createToken('auth-token')->plainTextToken;
                $token = substr($token, strpos($token, "|") + 1);
                $user->token = $token;
                return $this->apiSuccess($user, "Congratulations! 🎉 You have successfully signed in!");
            } else {
                return $this->apiError("Please Enter Valid Password", null, 500);
            }
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function changePassword(ChangePassword $request)
    {
        try {
            $requestedData = $request->safe()->only('phone', 'password');
            $user = User::where('phone', $requestedData['phone'])->first();
            $user->password = Hash::make($request->password);
            $user->save();
            return $this->apiSuccess(null, "Congratulations! 🎉 You have changed password successfully!, Try To login");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
