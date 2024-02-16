<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserCompany extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'user_id','name', 'address', 'gst', 'about','work_recommendation'
    ];
    protected function workRecommendation(): Attribute
    {
        return Attribute::make(
            // get: fn ($value) => $value ? asset($value) : $value,
            get: fn ($value) => $value ?  asset(Storage::url($value)) : $value,
        );
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
