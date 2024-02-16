<?php

namespace App\Http\Requests\Api;

use Illuminate\Support\Str;
use App\Models\PropertyType;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectLabourUpdate extends FormRequest
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
            'id' => ['required', 'exists:project_labour_contractors,id'],
            'working_days'=>['required','numeric','gt:0'],
            'rate'=>['required','numeric','gt:0'],
            'start_date'=>['required','date','date_format:Y-m-d'],
            'handover_date'=>['required','date','date_format:Y-m-d'],
            'description'=>['required','string']
        ];
        if (request()->has('property_type_id') && PropertyType::whereId(request()->property_type_id)->exists() && Str::lower(PropertyType::find(request()->property_type_id)->name) === 'other') {
            $rule['property_other'] = ['required', 'string'];
        }

        return $rule;
    }
}
