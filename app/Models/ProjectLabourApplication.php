<?php

namespace App\Models;

use App\Enums\ApplicationStatusEnum;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProjectLabourApplication extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'project_labour_contractor_id', 'user_id','role_id', 'project_id', 'application_status','meet_at','assigned_at'
    ];

    protected $appends = [
         'application_status_text'
    ];

    protected function getApplicationStatusTextAttribute(): string
    {
        return ApplicationStatusEnum::from($this->application_status)->label();
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function project()
    {
        return $this->belongsTo(ProjectLabourContractor::class,'project_labour_contractor_id');
    }
}
