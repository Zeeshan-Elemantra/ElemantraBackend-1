<?php

namespace App\Enums;

enum InterfaceTypeEnum:int{

    case ALL = 0 ;
    case HIREWORK = 1 ;
    case FINDWORK = 2 ;

    public function label() {
        return match($this) {
            self::ALL => 'All',
            self::HIREWORK => 'Hire Work',
            self::FINDWORK => 'Find Work',
        };
    }

    public function userColumn() {
        return match($this) {
            self::ALL => 'All',
            self::HIREWORK => 'hireWork',
            self::FINDWORK => 'findWork',
        };
    }

    public static function fromUserColumn(string $userColumn): ?InterfaceTypeEnum
    {
        foreach (self::cases() as $enumValue) {
            if ($enumValue->userColumn() === $userColumn) {
                return $enumValue;
            }
        }
        return null;
    }
}
