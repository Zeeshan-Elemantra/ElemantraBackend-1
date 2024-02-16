<?php

namespace App\Http\Requests\Api;

use App\Rules\UserHasProject;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectIndividualGet extends FormRequest
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
            'id' => ['required', 'exists:project_individual_contractors,id'],
        ];
        return $rule;
    }

    public function messages(): array
    {
        $message = [
            'id.required' => 'Project id required',
        ];
        return $message;
    }
}
