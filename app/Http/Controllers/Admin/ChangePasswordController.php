<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class ChangePasswordController extends Controller
{
    public function index()
    {
        return view('admin.change-password');
    }

    public function update(Request $request)
    {
        if (
            isset($request->old_password) && $request->old_password != "" &&
            isset($request->new_password) && $request->new_password != "" &&
            isset($request->confirm_password) && $request->confirm_password != ""
        ) {
            $id = 1;
            $old_password = $request->old_password;
            $new_password = $request->new_password;
            $confirm_password = $request->confirm_password;

            $admin = Admin::find($id);

            if (!Hash::check($old_password, $admin->password)) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Current password is wrong'
                ];
            }

            if ($new_password != $confirm_password) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Confirm password does not match with password'
                ];
            }

            $admin->update(['password' => Hash::make($new_password)]);

            return [
                'error' => false,
                'response' => 'y',
                'message' => 'Password changed successfully'
            ];
        } else {
            return [
                'error' => true,
                'response' => 'n',
                'message' => 'All fields required'
            ];
        }
    }
}
