<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class Login extends FormRequest
{
    use apiErrorResponse;
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        if(request()->has('oauth_login') && request()->oauth_login==true){
            $rule = [
                'email' => 'required | email |exists:users,email',
            ];
        }else{
            $rule = [
                'phone' => 'required | numeric | digits:10 | exists:users,phone',
                'password' => 'required'
            ];
        }
        return $rule;
    }
    public function messages(): array
    {
        return [
            'name.required' => 'Please enter full name',
            'phone.required' => 'Please enter phone number',
            'phone.exists' => 'Entered phone number is invalid',
            'email.exists' => 'This email id is not registered,please registered first!',
            'password.required' => 'Please enter password',
        ];
    }

    // public function failedValidation(Validator $validator)
    // {
    //     // throw new HttpResponseException(response()->json([
    //     //     'success'   => false,
    //     //     'message'   => 'Validation errors',
    //     //     'data'      => $validator->errors()
    //     // ]));
    //     throw new HttpResponseException($this->apiError('Validation Error', $validator->errors()));
    // }
}
