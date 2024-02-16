<?php

namespace App\Http\Requests\Api;

use App\Enums\ProjectTypeEnum;
use Illuminate\Foundation\Http\FormRequest;
use App\Traits\apiErrorResponse;


class ApplicationAssignAdd extends FormRequest
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
            'project_type_id'=>['required','exists:project_types,id'],
            'id'=>['required']
        ];
        if($this->project_type_id==ProjectTypeEnum::SKILLED_LABOUR->value){
            $rule['id']=['required','exists:project_labour_applications,id'];
        }else{
            $rule['id']=['required','exists:project_work_type_applications,id'];
        }

        return $rule;
    }

    public function messages(): array
    {
        return [
            'id.required' => 'Application id required'
        ];
    }
}
