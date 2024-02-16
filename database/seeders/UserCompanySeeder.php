<?php

namespace Database\Seeders;

use App\Models\UserCompany;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UserCompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        UserCompany::factory()->count(10)->create();
    }
}
