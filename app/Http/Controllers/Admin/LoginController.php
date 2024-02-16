<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function index()
    {
        return view('admin.login');
    }

    public function store(Request $request)
    {
        if (isset($request->username) && $request->username != "" &&
            isset($request->password) && $request->password != "")
        {
            $username = $request->username;
            $password = $request->password;

            $admin = Admin::where("name", $username)->first();

            if (! $admin) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Incorrect username'
                ];
            }

            if (! Hash::check($password, $admin->password)) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Incorrect password'
                ];
            }

            if (auth()->guard('admin')->attempt(['name' => $username, 'password' => $password]))
            {
                // return $user = auth()->guard('admin')->user();
                return [
                    'error' => false,
                    'response' => 'y',
                    'message' => 'Login successful'
                ];
            }

        }
        else {
            return [
                'error' => true,
                'response' => 'n',
                'message' => 'All fields required'
            ];
        }
    }

    public function destroy()
    {
        auth()->guard('admin')->logout();

        return redirect()->route('admin.login');
    }
}
