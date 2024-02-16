<?php

namespace App\Traits;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

trait apiErrorResponse {
    use ApiResponser;
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException($this->apiError($validator->getMessageBag()->first(), null));
    }
}
