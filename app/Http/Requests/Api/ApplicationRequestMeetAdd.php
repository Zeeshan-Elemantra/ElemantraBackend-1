<?php

namespace App\Http\Requests\Api;

use App\Enums\ProjectTypeEnum;
use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ApplicationRequestMeetAdd extends FormRequest
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
            'id'=>['required','exists:project_labour_applications,id']
        ];
        return $rule;
    }
    public function messages(): array
    {
        return [
            'id.required'=>'Application id required'
        ];
    }
}
