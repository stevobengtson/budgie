<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Account>
 */
class AccountFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => 1,
            'name' => $this->faker->name(),
            'type' => $this->faker->randomElement(['checking', 'savings']),
            'currency' => 'CAD',
            'balance' => $this->faker->randomFloat(2, 0, 10000),
            'interest_rate' => $this->faker->randomFloat(2, 0, 10),
            'opened_at' => $this->faker->dateTimeThisDecade(),
            'closed_at' => null,
        ];
    }
}
