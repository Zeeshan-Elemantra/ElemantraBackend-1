<?php

namespace App\Http\Requests\Api;

use App\Traits\apiErrorResponse;
use Illuminate\Foundation\Http\FormRequest;

class ReviewAdd extends FormRequest
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
            'user_id' => ['required', 'exists:users,id'],
            'reviews.*'=>['required','array'],
            'reviews.*.review_category_id'=>['required','exists:review_categories,id'],
            'reviews.*.rating'=>['sometimes','numeric','lte:5'],
            'description'=>['sometimes','string','nullable']
        ];
        return $rule;
    }
}
