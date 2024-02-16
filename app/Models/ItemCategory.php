<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItemCategory extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'work_type_id','item_id','name'
    ];

    public function unit(){
        return $this->belongsTo(Unit::class);
    }

    public function request(){
        return $this->hasMany(BoqRequest::class);
    }

    public function workType(){
        return $this->belongsTo(WorkType::class);
    }

    public function itemDetails(){
        return $this->hasMany(ItemDetails::class);
    }

    public function item(){
        return $this->belongsTo(Item::class);
    }

}
