<?php

namespace App\Enums;

enum HelpSupportEnum:int{

    case REQUESTED = 0 ;
    case SOLVED = 1 ;

    public function label() {
        return match($this) {
            self::REQUESTED => 'Requested',
            self::SOLVED => 'Solved',
        };
    }

    public function color() {
        return match($this) {
            self::REQUESTED => 'primary',
            self::SOLVED => 'success',
        };
    }
}
