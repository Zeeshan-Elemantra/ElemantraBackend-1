<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            [
                'name' => 'Turnkey Contractor',
                'role' => 'turnkey_contractor',
                'status' => 1,
            ],
            [
                'name' => 'Individual Contractor',
                'role' => 'individual_contractor',
                'status' => 1,
            ],
            [
                'name' => 'Labour',
                'role' => 'labour',
                'status' => 1,
            ],
            // Add more roles as needed
        ];

        // Insert the data into the 'roles' table
        DB::table('roles')->insert($roles);
    }
}
