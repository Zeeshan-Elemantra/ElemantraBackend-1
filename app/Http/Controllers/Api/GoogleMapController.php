<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GoogleMapController extends Controller
{
    //
    public function getKey()
    {
        try {
            $google_map_key = config('global.google_map.key');

            return response()->json(['google_map_key'=>$google_map_key]);

            // return $this->apiSuccess(compact('google_map_key'), "Google map key fetched");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
