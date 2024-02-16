<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItemDetails extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'work_type_id',
        'item_id','item_category_id','name'
    ];

    public function workType(){
        return $this->belongsTo(WorkType::class);
    }

    public function itemCategory(){
        return $this->belongsTo(ItemCategory::class);
    }
    public function item(){
        return $this->belongsTo(Item::class);
    }
    public function brandSpecification(){
        return $this->hasMany(ItemBrandSpecification::class,'item_detail_id');
    }
}
