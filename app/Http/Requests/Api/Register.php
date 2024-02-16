<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class Register extends FormRequest
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
                'role_id' => 'required | exists:roles,id',
                'email' => 'sometimes | email |unique:users,email',
                'name' => 'sometimes | string',
                'oauth_login'=>'required'
            ];
        }else{
            $rule = [
                'role_id' => 'required | exists:roles,id',
                'name' => 'required | string',
                'phone' => 'required | numeric | digits:10 | unique:users,phone',
                'alt_phone' => 'sometimes | numeric | digits:10',
                'email' => 'sometimes | email |unique:users,email',
                'password' => 'required'
            ];
        }
        return $rule;
    }
    public function messages(): array
    {
        return [
            'role.required' => 'Select User Type',
            'role.exists' => 'Selected user type is Invalid',
            'name.required' => 'Please enter full name',
            'phone.required' => 'Please enter phone number',
            'phone.unique' => 'Entered phone number is already exist',
            'alt_phone.required' => 'Please enter phone number',
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
