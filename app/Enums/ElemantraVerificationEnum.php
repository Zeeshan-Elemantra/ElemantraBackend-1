<?php

namespace App\Enums;

enum ElemantraVerificationEnum:int{

    case NOT_APPLIED = 0 ;
    case PENDING = 1;
    case VERIFIED = 2 ;
    public function label() {
        return match($this) {
            self::NOT_APPLIED => 'Not Applied',
            self::PENDING => 'Pending',
            self::VERIFIED => 'Verified',
        };
    }

    public function color() {
        return match($this) {
            self::NOT_APPLIED => 'primary',
            self::PENDING => 'secondary',
            self::VERIFIED => 'success',
        };
    }
}
