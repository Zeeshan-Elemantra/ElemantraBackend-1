<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ReviewCategory extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'name','type','created_at','updated_at'
    ];

    public function rating()
    {
        return $this->hasMany(ReviewRating::class);
    }

}
