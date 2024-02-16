<?php

namespace Database\Factories;

use App\Models\Role;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Get a random role ID from the 'roles' table
        $roleId = Role::inRandomOrder()->first()->id;

        $phone = $this->faker->unique()->numerify('##########');
        $altPhone = $this->faker->unique()->numerify('##########');

        return [
            'name' => $this->faker->name,
            'phone' => $phone,
            'alt_phone' => $altPhone,
            'email' => $this->faker->unique()->safeEmail,
            'email_verified_at' => now(),
            'password' => bcrypt('password'), // Default password is 'password'
            'remember_token' => Str::random(10),
            'role_id' => $roleId, // Assign an existing role ID
            'oauth_login' => $this->faker->boolean(50), // 50% chance of being 1
            'status' => $this->faker->boolean(90), // 90% chance of being 1
        ];

    }

    /**
     * Indicate that the model's email address should be unverified.
     */
    public function unverified(): static
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
