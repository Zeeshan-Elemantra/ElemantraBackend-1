<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HelpSupport extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'user_id',
        'app_interface',
        'feedback',
        'remark',
        'support_status',
        'requested_at',
        'resolved_at'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
