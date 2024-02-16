<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProjectAddress extends Model
{
    use HasFactory;
    protected $fillable = [
        'project_type','project_type_id', 'project_id', 'address', 'room_no', 'bldg_no', 'city', 'latitude', 'longitude',
        'pincode'
    ];

    public function project()
    {
        return $this->morphTo();
    }
}
