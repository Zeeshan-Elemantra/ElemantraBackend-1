<?php

namespace App\Http\Requests\Api;

use App\Rules\UserHasProject;
use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Http\FormRequest;

class ProjectLabourGet extends FormRequest
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
    protected function prepareForValidation()
    {
        // Decode JSON data for property_types and work_types if they are present in the request
        if ($this->has('filter_assigned')) {
            $this->merge([
                'filter_assigned' => $this->input('filter_assigned') == 'true' ? true : false,
            ]);
        }

        if ($this->has('filter_meet_request')) {
            $this->merge([
                'filter_meet_request' => $this->input('filter_meet_request') == 'true' ? true : false,
            ]);
        }

        if ($this->has('filter_high_rated')) {
            $this->merge([
                'filter_high_rated' => $this->input('filter_high_rated') == 'true' ? true : false,
            ]);
        }
        if ($this->has('filter_elemantra_verified')) {
            $this->merge([
                'filter_elemantra_verified' => $this->input('filter_elemantra_verified') == 'true' ? true : false,
            ]);
        }
    }

    public function rules(): array
    {

        $rule = [
            'id' => ['required', 'exists:project_labour_contractors,id'],
            'filter_assigned' => ['sometimes', 'boolean'],
            'filter_meet_request' => ['sometimes', 'boolean'],
            'filter_elemantra_verified' => ['sometimes', 'boolean'],
            'filter_high_rated' => ['sometimes', 'boolean']
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
