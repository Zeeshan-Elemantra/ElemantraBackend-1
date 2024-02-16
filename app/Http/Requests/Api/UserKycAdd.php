<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Http\FormRequest;

class UserKycAdd extends FormRequest
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
            'pan'=>['required','array'],
            'pan.number'=>['required','string'],
            'pan.image'=>['required'],
            'aadhaar'=>['required','array'],
            'aadhaar.number'=>['required'],
            'aadhaar.front'=>['required'],
            'aadhaar.back'=>['required']
        ];
    }
}
