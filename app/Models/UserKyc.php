<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserKyc extends Model
{
    use HasFactory;

    protected $fillable = [
        'name','image','number'
    ];

    protected function image(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?  asset(Storage::url($value)) : $value,
        );
    }
}
