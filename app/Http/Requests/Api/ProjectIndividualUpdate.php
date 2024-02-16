<?php

namespace App\Http\Requests\Api;

use Illuminate\Support\Str;
use App\Models\PropertyType;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectIndividualUpdate extends FormRequest
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
            'name'=>['required','string'],
            // 'project_type_id'=>['required','exists:project_types,id'],
            'property_type_id'=>['required','exists:property_types,id'],
            'project_address'=>['required','array'],
            'project_address.address'=>['required','string'],
            'project_address.room_no'=>['sometimes','string'],
            'project_address.bldg_no'=>['sometimes','string'],
            'project_address.city'=>['sometimes','string'],
            'project_address.pincode'=>['sometimes'],
            'project_address.latitude'=>['required','string'],
            'project_address.longitude'=>['required','string'],
            'budget_range_id'=>['required','exists:budget_ranges,id'],
            'start_date'=>['required','date','date_format:Y-m-d'],
            'handover_date'=>['required','date','date_format:Y-m-d'],
            'description'=>['sometimes']
        ];
        if(request()->has('property_type_id') && PropertyType::whereId(request()->property_type_id)->exists() && Str::lower(PropertyType::find(request()->property_type_id)->name)==='other'){
            $rule['property_other']=['required','string'];
        }

        return $rule;
    }
}
