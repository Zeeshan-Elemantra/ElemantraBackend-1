<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ChangePassword extends FormRequest
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
        return [
            'phone' => 'required | numeric | digits:10',
            'password' => 'required | min:6',
            'confirm_password' => 'required | same:password',
        ];
    }
    public function messages(): array
    {
        return [
            'phone.required' => 'Contact name required',
            'password.required' => 'Password required',
            // 'confirm_password.same' => 'Password required invalid',
        ];
    }
}
