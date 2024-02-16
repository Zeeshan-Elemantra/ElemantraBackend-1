<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class WorkType extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'name'
    ];

    public function workProperty(){
        return $this->hasMany(WorkPropertyType::class);
    }

    public function userWorkType(){
        return $this->hasMany(UserWorkType::class);
    }

    public function items(){
        return $this->hasMany(Item::class);
    }

    public function projectWorkType(){
        return $this->hasMany(ProjectWorkType::class);
    }

}
