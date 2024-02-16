<?php

namespace App\Traits;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

trait ajaxErrorResponse {
    use ajaxResponser;
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException($this->ajaxError('validation_error',$validator->getMessageBag() ,null));
    }
}
