<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProjectWorkRequestImage extends Model
{
    use HasFactory;
    protected $fillable = [
        'image'
    ];

    protected function image(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?  asset(Storage::url($value)) : $value,
        );
    }

    public function workRequest(){
        return $this->belongsTo(ProjectWorkRequest::class);
    }
}
