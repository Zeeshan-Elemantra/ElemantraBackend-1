<?php

namespace App\Http\Controllers\Api;

use App\Models\BudgetRange;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Unit;

class BudgetRangeController extends Controller
{
    public function get(Request $request){
        try {
            $budgetRange = BudgetRange::all();
            return $this->apiSuccess(compact('budgetRange'), "Budget fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getUnits(Request $request){
        try {
            $units = Unit::all();
            return $this->apiSuccess(compact('units'), "Units fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

}
