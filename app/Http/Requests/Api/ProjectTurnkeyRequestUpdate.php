<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ProjectTurnkeyRequestUpdate extends FormRequest
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
            'id'=>['required','exists:project_work_requests,id'],
            // 'project_id'=>['required','exists:project_turnkey_contractors,id'],
            // 'work_type_id'=>['required','exists:work_types,id'],
            'area_of_work_id'=>['sometimes','exists:area_of_works,id'],
            'item_id'=>['required','exists:items,id'],
            'item_category_id'=>['required','exists:item_categories,id'],
            'item_detail_id'=>['nullable','exists:item_details,id'],
            'other_item_detail'=>['nullable','string'],
            'item_brand_specification_id'=>['nullable','exists:item_brand_specifications,id'],
            'other_item_brand_specification'=>['nullable'],
            'item_description'=>['nullable','string'],
            'unit_id'=>['sometimes','exists:units,id'],
            'area_size'=>['required','numeric'],
            'quantity'=>['required','numeric'],
            'floor_plan_file'=>['sometimes','mimes:pdf'],
            'sample_image.*'=>['sometimes','mimes:png,jpeg,jpg'],
        ];
        return $rule;
    }
}
