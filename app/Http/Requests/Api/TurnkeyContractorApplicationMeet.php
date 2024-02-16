<?php

namespace App\Http\Requests\Api;

use App\Enums\ProjectTypeEnum;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class TurnkeyContractorApplicationMeet extends FormRequest
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
        $rule = ['project_type_id'=>['required','exists:project_types,id']];
        if($this->project_type_id==ProjectTypeEnum::SKILLED_LABOUR->value){
            $rule = [
                'project_type_id'=>['required','exists:project_types,id'],
                'id'=>['required','exists:project_labour_applications,id'],
            ];
        }

        if($this->project_type_id==ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value){
            $rule = [
                'project_type_id'=>['required','exists:project_types,id'],
                'id'=>['required','exists:project_work_type_applications,id']
            ];
        }
        return $rule;
    }
}
