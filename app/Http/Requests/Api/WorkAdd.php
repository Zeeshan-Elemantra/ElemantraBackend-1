<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class WorkAdd extends FormRequest
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
            'work_types' => 'required | array|min:1',
            'work_types.*' => 'required|exists:work_types,id',
        ];
        if (Auth::user()->role_id === 3) {
            $rule['work_types'] .= ' | max:1';
        }
        return $rule;
    }
    public function messages(): array
    {
        return [
            'work_types.*.required' => 'Atleast One Work type required',
        ];
    }


}
