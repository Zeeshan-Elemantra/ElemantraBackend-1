<?php

namespace App\Models;

use App\Enums\ApplicationStatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProjectWorkTypeApplication extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'project_work_type_id',
        'project_type',
        'project_id',
        'user_id', 'role_id',
        'sub_total',
        'over_all_total',
        'application_status',
        'meet_at',
        'applied_at',
        'assigned_user_id',
        'assigned_at'
    ];
    protected $appends = [
        'application_status_text'

    ];

    protected function getApplicationStatusTextAttribute(): string
    {
        return ApplicationStatusEnum::from($this->application_status)->label();
    }

    public function project()
    {
        return $this->morphTo();
    }

    public function projectWorkType()
    {
        return $this->belongsTo(ProjectWorkType::class, 'project_work_type_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function applicationRequest()
    {
        return $this->hasMany(ProjectWorkRequestApplication::class);
    }

    // public function getApplicationStatusAttribute()
    // {
    //     return "0";
    // }

    // public function workRequest()
    // {
    //     return $this->hasManyThrough();
    // }
}
