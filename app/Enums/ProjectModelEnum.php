<?php

namespace App\Enums;

enum ProjectModelEnum:string{
    case TURNKEY_CONTRACTOR = 'App\Models\ProjectTurnkeyContractor';
    case INDIVIDUAL_CONTRACTOR = 'App\Models\ProjectIndividualContractor';
    case SKILLED_LABOUR = 'App\Models\ProjectLabourContractor';
}
