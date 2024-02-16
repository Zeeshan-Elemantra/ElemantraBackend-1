<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\AreaOfWork;
use Illuminate\Http\Request;

class AreaOfWorkController extends Controller
{
    public function get(){
        try {
            $areaOfWorks = AreaOfWork::all();
            return $this->apiSuccess(compact('areaOfWorks'), "Fetched successfullly");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
