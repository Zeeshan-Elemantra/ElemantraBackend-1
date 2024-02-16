<?php

namespace App\Enums;

use App\Models\Role;

enum UserRoleEnum:int{
    case TURNKEY_CONTRACTOR = 1;
    case INDIVIDUAL_CONTRACTOR = 2;
    case LABOUR = 3;
    case DESIGNER = 4;

    public function label() {
        return match($this) {
            self::TURNKEY_CONTRACTOR => Role::find(self::TURNKEY_CONTRACTOR)->role,
            self::INDIVIDUAL_CONTRACTOR =>Role::find(self::INDIVIDUAL_CONTRACTOR)->role,
            self::LABOUR => Role::find(self::LABOUR)->role,
            self::DESIGNER => Role::find(self::DESIGNER)->role
        };
    }

    public function color() {
        return match($this) {
            self::TURNKEY_CONTRACTOR => 'primary',
            self::INDIVIDUAL_CONTRACTOR =>'secondary',
            self::LABOUR => 'info',
            self::DESIGNER => 'success'
        };
    }
}
