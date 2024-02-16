<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\UserCompany;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\UserCompany>
 */
class UserCompanyFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    protected $model = UserCompany::class;

    public function definition(): array
    {
        $userId = User::inRandomOrder()->first()->id;

        return [
            'user_id' => $userId,
            'name' => $this->faker->company,
            'gst' => $this->faker->optional()->numerify('##########'), // Optional 10-digit GST number
            'address' => $this->faker->address,
            'about' => $this->faker->optional()->paragraph,
            'work_recommendation' => $this->faker->optional()->sentence,
            'status' => $this->faker->boolean(90), // 90% chance of being 1
        ];
    }
}
