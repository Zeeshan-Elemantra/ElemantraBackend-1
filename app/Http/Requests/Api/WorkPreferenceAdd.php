<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class WorkPreferenceAdd extends FormRequest
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
        if ($this->has('property_types')) {
            $this->merge([
                'property_types' => json_decode($this->input('property_types'), true),
            ]);
        }

        // if ($this->has('work_types')) {
        //     $this->merge([
        //         'work_types' => json_decode($this->input('work_types'), true),
        //     ]);
        // }
    }
    public function rules(): array
    {
        $rule = [
            'property_types' => ['sometimes','array','min:1'],
            'property_types.*' => ['sometimes','exists:property_types,id'],
            'work_types' => ['required','exists:work_types,id'],
            // 'work_types.*' => ['required','exists:work_types,id'],
        ];

        return $rule;
    }

    public function messages(): array
    {
        return [
            // 'work_types.*.required' => 'Atleast One Work type required',
            'property_types.*.required' => 'Atleast One Property type required',
        ];
    }
}
