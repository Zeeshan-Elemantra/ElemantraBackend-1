<?php

namespace App\Rules;

use Closure;
use App\Models\Project;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Validation\ValidationRule;

class UserHasProject implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        // Get the logged-in user's ID
        $loggedInUserId = Auth::id();

        // Check if the logged-in user has the project with the given ID
        $project = Project::where('user_id', $loggedInUserId)
            ->where('id', $value)
            ->exists();
        if (!$project) {
            $fail('The :attribute must be between 1980 to ' . date('Y') . '.');
        }
    }

    // public function message()
    // {
    //     return 'The selected project does not belong to the logged-in user.';
    // }
}
