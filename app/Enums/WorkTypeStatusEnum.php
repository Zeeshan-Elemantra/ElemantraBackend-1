<?php

namespace App\Enums;

enum WorkTypeStatusEnum:int{

    case PENDING = 0 ;
    case APPLICATION = 1 ;
    case MEET = 2 ;
    case ASSIGNED = 3 ;

    public function label() {
        return match($this) {
            self::PENDING => 'Pending',
            self::APPLICATION => 'Application',
            self::MEET => 'Meet',
            self::ASSIGNED => 'Assigned'
        };
    }

    public function color() {
        return match($this) {
            self::PENDING => 'primary',
            self::APPLICATION => 'secondary',
            self::MEET => 'warning',
            self::ASSIGNED => 'success'
        };
    }
}
