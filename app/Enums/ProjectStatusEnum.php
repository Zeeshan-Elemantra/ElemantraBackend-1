<?php

namespace App\Enums;

enum ProjectStatusEnum: int
{
    case PENDING = 0;
    case LIVE = 1;
    case APPLICATIONS = 2;
    case ASSIGNED = 3;

    public function label()
    {
        return match ($this) {
            self::PENDING => 'Pending',
            self::LIVE => 'Live',
            self::APPLICATIONS => 'Applications',
            self::ASSIGNED => 'Assigned',
            default => 'Unknown Status'
        };
    }

    public function color()
    {
        return match ($this) {
            self::PENDING => 'primary',
            self::LIVE => 'secondary',
            self::APPLICATIONS => 'info',
            self::ASSIGNED => 'success',
            default => 'secondary'
        };
    }

    public static function names(): array
    {
        return array_column(self::cases(), 'name');
    }

    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }

    public static function all(): array
    {
        return array_combine(self::values(), self::names());
    }
}
