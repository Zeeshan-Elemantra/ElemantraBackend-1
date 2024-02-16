<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'work_type_id','name'
    ];

    // public function request(){
    //     return $this->hasMany(BoqRequest::class);
    // }

    public function category(){
        return $this->hasMany(ItemCategory::class);
    }

    public function workType(){
        return $this->belongsTo(WorkType::class);
    }

    public function itemCategory(){
        return $this->hasMany(ItemCategory::class);
    }
}
