<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class PropertyAdd extends FormRequest
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
            'property_types' => 'required|array|min:1',
            'property_types.*' => 'required|exists:property_types,id',
        ];
    }
    public function messages(): array
    {
        return [
            'property_types.*.required' => 'Atleast One Property type required',
        ];
    }

    // public function failedValidation(Validator $validator)
    // {
    //     throw new HttpResponseException($this->apiError('Validation Error', $validator->errors()));
    // }
}
