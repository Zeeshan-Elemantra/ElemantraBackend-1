<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItemBrandSpecification extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'work_type_id',
        'item_id',
        'item_category_id',
        'item_detail_id',
        'name',
        'description',
        'unit_id',
        'rate'
    ];

    public function workType()
    {
        return $this->belongsTo(WorkType::class);
    }

    public function item()
    {
        return $this->belongsTo(Item::class);
    }
    public function itemDetail()
    {
        return $this->belongsTo(ItemDetails::class, 'item_detail_id');
    }

    public function itemCategory()
    {
        return $this->belongsTo(ItemCategory::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function projectWorkRequest()
    {
        return $this->hasMany(ProjectWorkRequest::class);
    }
}
