<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ProjectTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                "name"=>"Individual Contractor",
                "type"=>"individual_contractor",
            ],
            [
                "name"=>"Skilled Labour",
                "type"=>"skilled_labour",
            ]
        ];

       DB::table('project_types')->insert($data);
    }
}
