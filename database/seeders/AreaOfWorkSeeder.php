<?php

namespace Database\Seeders;

use App\Models\AreaOfWork;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class AreaOfWorkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = ['name'=>"all area"];
        AreaOfWork::create($data);
    }
}
