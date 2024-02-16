<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class ProjectSampleAdd extends FormRequest
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
            'name' => 'required | string',
            'images' => 'required',
            // 'images.*' => 'required | mimes:jpg,png,jpeg',
            // 'images.*' => 'required'

        ];
    }
    public function messages(): array
    {
        return [
            'name.required' => 'Project name required',
        ];
    }

    // public function failedValidation(Validator $validator)
    // {
    //     throw new HttpResponseException($this->apiError('Validation Error', $validator->errors()));
    // }
}
