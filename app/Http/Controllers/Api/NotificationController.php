<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\InterfaceTypeEnum;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ElemantraNotification;
use App\Http\Requests\Api\NotificationGet;

class NotificationController extends Controller
{
    //

    public function getNotifications()
    {
        try {
            // $interfaceArr = [
            //     'hireWork' => 1,
            //     'findWork' => 2,
            // ];
            // $user = User::find(Auth::id());
            // if (array_search($user->current_work, $interfaceArr)) {
            //     $userInterface = $interfaceArr[$user->current_work];
            // }
            $userInterface = Auth::user()->current_work ?? 'hireWork';
            $notifications = ElemantraNotification::whereIn('interface_type', [
                (string)InterfaceTypeEnum::ALL->value,
                (string)InterfaceTypeEnum::fromUserColumn($userInterface)->value ?? 0
            ])
                ->latest()
                ->get();
            return $this->apiSuccess(compact('notifications'), "Notifications Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
