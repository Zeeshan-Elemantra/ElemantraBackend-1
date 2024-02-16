<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VerificationRemark extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'onboard_step_id',
        'user_id',
        'spoken_name',
        'meeting_minute',
        'remark',
    ];

    public function onboardStep(){
        return $this->belongsTo(OnboardStep::class);
    }

    public function user(){
        return $this->belongsTo(user::class);
    }
}
