<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class LabourApplicationGet extends FormRequest
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
            'id'=>['required','exists:project_labour_applications,id']
        ];
    }
}
