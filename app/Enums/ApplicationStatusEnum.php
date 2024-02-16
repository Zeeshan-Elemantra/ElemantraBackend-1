<?php

namespace App\Enums;

enum ApplicationStatusEnum:int{

    case PENDING = 0 ;
    case MEET = 1 ;
    case ASSIGNED = 2 ;

    public function label() {
        return match($this) {
            self::PENDING => 'Pending',
            self::MEET => 'Meet',
            self::ASSIGNED => 'Assigned'
        };
    }

    public function color() {
        return match($this) {
            self::PENDING => 'primary',
            self::MEET => 'secondary',
            self::ASSIGNED => 'success',
            default => 'secondary'
        };
    }
}
