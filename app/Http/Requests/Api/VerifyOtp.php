<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class VerifyOtp extends FormRequest
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
        $rule = [
            'type' => 'required | in:register,update,resend,forgot_password,change_phone',
            'otp'=>'required | numeric | digits:4'
        ];
        if (request()->has('phone')) {
            $rule['phone'] = 'required | numeric | digits:10|';
        } else {
            $rule['email'] = 'required | email |';
        }
        // if(in_array(request()->type,['register'])){
        //     $rule['phone'] .= 'unique:users,phone';
        // }else{
        //     $rule['phone'] .= 'exists:users,phone';
        // }
        return $rule;
    }
    public function messages(): array
    {
        return [
            'type.required' => 'Please provide type of otp requested',
            'phone.exists' => 'Entered phone is invalid',
            'email.exists' => 'Entered email is invalid',
            'otp.required'=>'Please Enter OTP'
        ];
    }

    // public function failedValidation(Validator $validator)
    // {
    //     throw new HttpResponseException($this->apiError('Validation Error', $validator->errors()));
    // }
}
