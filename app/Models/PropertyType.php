<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyType extends Model
{
    use HasFactory,SoftDeletes;

    public function userProperty(){
        return $this->hasMany(UserPropertyType::class);
    }

    public function project(){
        return $this->hasMany(Project::class);
    }
}
