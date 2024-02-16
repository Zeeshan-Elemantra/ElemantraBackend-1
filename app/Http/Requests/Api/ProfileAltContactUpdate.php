<?php

namespace App\Http\Requests\Api;

use Illuminate\Validation\Rule;
use App\Traits\apiErrorResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class ProfileAltContactUpdate extends FormRequest
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
            'alt_phone' => [
                'required', 'numeric', 'digits:10',
                function ($attribute, $value, $fail) {
                    if ($value == Auth::user()->phone) {
                        $fail('The alternate contact number must be different from the primary contact number.');
                    }
                },
            ]
        ];
    }
}
