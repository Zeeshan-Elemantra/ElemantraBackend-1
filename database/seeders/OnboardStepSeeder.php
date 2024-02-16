<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class OnboardStepSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $dataArr = [
            [
                'name' => 'step 1',
                'title' => 'Call and Form',
                'description' => 'Put the details of what kind of vendor - Call and Form  - Minutes of the meeting, Person who spoke to vendor details',
            ],
            [
                'name' => 'step 2',
                'title' => 'Site visits',
                'description' => 'Site visits ( old project images and description, new project images and description) - Name of the person who did site visit and minutes of the meeting If yes, proceed to step 3. If no, terminate the onboarding',
            ],
            [
                'name' => 'step 3',
                'title' => 'Meeting',
                'description' => 'Meeting ( Share the details of Elemantra rate card) ,If yes, proceed for further steps(further discussion on rate card). If not, terminate. , Check for all images, project details, documents and checklists are filled',
            ],
            [
                'name' => 'step 4',
                'title' => 'Confirm the vendor',
                'description' => 'confirm the vendor for onboarding process',
            ],
            [
                'name' => 'step 5',
                'title' => 'Offline Kyc',
                'description' => 'MoU(offline), Aadhar card(offline), PAN card(offline), Firm/company letter(offline) - else, auto populate from user login in the front end',
            ],
            [
                'name' => 'step 6',
                'title' => 'Rate Vendor',
                'description' => 'Rating the vendor( Geetika has to share the rating list)',
            ],
            [
                'name' => 'step 7',
                'title' => 'Confirm Details',
                'description' => 'Confirm the details provided by you to onboard the vendor with Elemantra - success screen',
            ]

        ];

        DB::table('onboard_steps')->insert($dataArr);

    }
}
