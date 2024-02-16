<?php

namespace Database\Seeders;

use App\Models\WorkType;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class WorkTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $workTypes = ['POP and False ceiling', 'Civil Work', 'Carpentry', 'Carpentry-Refurbishment', 'Fabrication-Metal work MS', 'Fabrication-Metal work SS', 'Electric', 'Painting', 'Plumbing'];
        foreach ($workTypes as $key => $type) {
            WorkType::create(['name'=>$type]);
        }
    }
}
