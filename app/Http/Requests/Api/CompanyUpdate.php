<?php

namespace App\Http\Requests\Api;

use Illuminate\Validation\Rule;
use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class CompanyUpdate extends FormRequest
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
        return [
            'id' => ['required', 'exists:user_companies,id'],
            'name' => ['required', ' string'],
            'address' => ['required', ' string'],
            'gst' => ['sometimes', 'string'],
            // 'gst' => ['sometimes', 'string',  Rule::unique('user_companies', 'gst')
            //     // ->where('user_id', Auth::id())
            //     ->ignore(Auth::id(), 'user_id')],
            'about' => ['sometimes', ' string'],
        ];
    }
}
