<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPropertyType extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'user_id','property_type_id'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function propertyType(){
        return $this->belongsTo(PropertyType::class);
    }
}
