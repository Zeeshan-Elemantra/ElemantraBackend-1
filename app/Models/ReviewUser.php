<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ReviewUser extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'user_id','review_by_user','review_by_name','description'
    ];

    public function rating()
    {
        return $this->hasMany(ReviewRating::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function reviewByUser()
    {
        return $this->belongsTo(User::class,'review_by_user');
    }
}
