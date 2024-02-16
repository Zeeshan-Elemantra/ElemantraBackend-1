<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectLabourAdd extends FormRequest
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
            'name'=>['required','string'],
            'work_type_id'=>['required','exists:work_types,id'],
            'project_address'=>['required','array'],
            'project_address.address'=>['required','string'],
            'project_address.room_no'=>['sometimes','string'],
            'project_address.bldg_no'=>['sometimes','string'],
            'project_address.city'=>['sometimes','string'],
            'project_address.pincode'=>['sometimes'],
            'project_address.latitude'=>['required','string'],
            'project_address.longitude'=>['required','string'],
            'working_days'=>['required','numeric','gt:0'],
            'rate'=>['required','numeric','gt:0'],
            'start_date'=>['required','date','date_format:Y-m-d'],
            'handover_date'=>['required','date','date_format:Y-m-d','after_or_equal:start_date'],
            'description'=>['required','string']
        ];

        return $rule;
    }
}
