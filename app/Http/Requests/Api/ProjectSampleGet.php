<?php

namespace App\Http\Requests\Api;

use App\Rules\UserHasProject;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectSampleGet extends FormRequest
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
            'id' => ['required', 'exists:user_project_samples,id'],
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
