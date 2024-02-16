<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                "name" => "Sqft",
                "unit" => "sqft"
            ],
            [
                "name" => "Rft",
                "unit" => "rft",
            ],
            [
                "name" => "Nos",
                "unit" => "nos",
            ],
            [
                "name" => "Per Point",
                "unit" => "per point",
            ]
        ];

        DB::table('units')->insert($data);
    }
}
