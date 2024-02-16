<?php

namespace App\Enums;

enum MediaPathEnum:string{
    case WORK_REQUEST_IMAGE = 'public/work_request_images/';
    case WORK_RECOMMENDATION = 'public/work_recommendation/';
    case FLOOR_PLAN_PDF = 'public/floor_plan_file/';
    case PROJECT_SAMPLE = 'public/project_sample/';
    case USER_PROFILE = 'public/profile/';
    case USER_KYC = 'public/user_kyc/';
}
