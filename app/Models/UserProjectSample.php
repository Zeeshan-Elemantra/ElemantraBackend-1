<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserProjectSample extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'user_id','name'
    ];

    public function images(){
        return $this->hasMany(UserProjectSampleImage::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

}
