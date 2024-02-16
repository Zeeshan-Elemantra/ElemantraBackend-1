<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ReviewRating extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'review_user_id','user_id','review_by_user','review_category_id','rating'
    ];

    public function review()
    {
        return $this->belongsTo(ReviewUser::class);
    }

    public function reviewCategory()
    {
        return $this->belongsTo(ReviewCategory::class);
    }
}
