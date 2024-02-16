<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Unit extends Model
{
    use HasFactory,SoftDeletes;

    public function itemCategory(){
        return $this->hasMany(ItemCategory::class);
    }

    public function request(){
        return $this->hasMany(BoqRequest::class);
    }
}
