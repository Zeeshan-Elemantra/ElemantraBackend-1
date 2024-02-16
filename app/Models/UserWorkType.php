<?php

namespace App\Models;

use App\Models\WorkType;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserWorkType extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'user_id','work_type_id'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function workType(){
        return $this->belongsTo(WorkType::class)->withTrashed();
    }

}
