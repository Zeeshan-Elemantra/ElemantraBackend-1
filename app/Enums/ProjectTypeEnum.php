<?php

namespace App\Enums;

use App\Models\ProjectType;

enum ProjectTypeEnum:int{
    case TURNKEY_CONTRACTOR = 1;
    case INDIVIDUAL_CONTRACTOR = 2;
    case SKILLED_LABOUR = 3;

    public function label() {
        return match($this) {
            self::TURNKEY_CONTRACTOR => ProjectType::find(self::TURNKEY_CONTRACTOR)->type,
            self::INDIVIDUAL_CONTRACTOR =>ProjectType::find(self::INDIVIDUAL_CONTRACTOR)->type,
            self::SKILLED_LABOUR => ProjectType::find(self::SKILLED_LABOUR)->type
        };
    }
}
