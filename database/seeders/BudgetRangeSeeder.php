<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class BudgetRangeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                "name" => "Above 1000-10000",
                "min" => 1000,
                "max" => 10000,
            ],
            [
                "name" => "Above 10000-20000",
                "min" => 10000,
                "max" => 20000,
            ],
            [
                "name" => "Above 20000-30000",
                "min" => 20000,
                "max" => 30000,
            ]
        ];
        DB::table('budget_ranges')->insert($data);
    }
}
