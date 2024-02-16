<?php

namespace App\Http\Controllers\Api;

use App\Enums\HelpSupportEnum;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ReviewAdd;
use App\Models\HelpSupport;
use Illuminate\Support\Facades\Auth;

class HelpSupportController extends Controller
{
    public function add(Request $request)
    {
        try {
            if (HelpSupport::where('user_id', Auth::id())->whereIn('support_status', [(string)HelpSupportEnum::REQUESTED->value])->doesntExist()) {
                $helpSupport = HelpSupport::create([
                    'user_id' => Auth::id(),
                    'app_interface'=>Auth::user()->current_work,
                    'feedback'=>$request->feedback
                ]);
                return $this->apiSuccess(null, "Your feedback has been shared with the team. You will hear back soon");
            }
            return $this->apiError('Your already one request is present in pending state please wait our team will contact within 24 hr', 500);
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
