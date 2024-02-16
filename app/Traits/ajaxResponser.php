<?php

namespace App\Traits;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Cache;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Pagination\LengthAwarePaginator;

trait ajaxResponser{

    protected function ajaxSuccess($data, $message = null, $code = 200)
	{
		return response()->json([
			'success'=> True,
			'message' => $message,
			'data' => $data
		]); //code removed , $code
	}

	protected function ajaxError($message = null,$data=null, $code=400)
	{
		return response()->json([
			'success'=>False,
			'message' => $message,
			'data' => $data
		]); //code removed
	}

}
