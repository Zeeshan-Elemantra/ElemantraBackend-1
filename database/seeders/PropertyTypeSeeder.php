<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class PropertyTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            [
                'name' => 'Residential',
                'status' => 1,
            ],
            [
                'name' => 'Commercial',
                'status' => 1,
            ],
            [
                'name' => 'Other',
                'status' => 1,
            ],
            // Add more roles as needed
        ];

        // Insert the data into the 'roles' table
        DB::table('property_types')->insert($roles);
    }
}
