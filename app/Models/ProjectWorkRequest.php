<?php

namespace App\Models;

use App\Models\ProjectWorkRequestImage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProjectWorkRequest extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'unique_request_id',
        'project_work_type_id',
        'project_id',
        'project_type',
        'project_type_id',
        'area_of_work_id',
        'item_id',
        'item_category_id',
        'item_detail_id',
        'other_item_detail',
        'item_brand_specification_id',
        'other_item_brand_specification',
        'item_description',
        'unit_id',
        'area_size',
        'quantity',
        'floor_plan_file'
    ];

    protected function uniqueRequestId(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?  '#' . $value : $value,
        );
    }

    protected function floorPlanFile(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?  asset(Storage::url($value)) : $value,
        );
    }

    public function images()
    {
        return $this->hasMany(ProjectWorkRequestImage::class);
    }


    public function project()
    {
        return $this->morphTo();
    }

    public function projectType()
    {
        return $this->belongsTo(ProjectType::class);
    }

    public function areaOfWork()
    {
        return $this->belongsTo(AreaOfWork::class);
    }

    public function item()
    {
        return $this->belongsTo(Item::class)->withTrashed();
    }

    public function itemCategory()
    {
        return $this->belongsTo(ItemCategory::class)->withTrashed();
    }

    public function itemDetail()
    {
        return $this->belongsTo(ItemDetails::class)->withTrashed();
    }

    public function itemBrandSpecification()
    {
        return $this->belongsTo(ItemBrandSpecification::class)->withTrashed();
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class)->withTrashed();
    }

    public function projectWorkType()
    {
        return $this->belongsTo(ProjectWorkType::class);
    }

    public function application()
    {
        return $this->belongsTo(ProjectWorkTypeApplication::class, 'project_work_type_id', 'project_work_type_id');
    }


    public function applicationRequest()
    {
        return $this->hasMany(ProjectWorkRequestApplication::class);
    }

}
