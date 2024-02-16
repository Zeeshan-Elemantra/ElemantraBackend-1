<?php

namespace App\Models;

use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Api\ProjectIndividualApplication;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProjectLabourContractor extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'project_type_id',
        'work_type_id',
        'name',
        'description',
        'working_days',
        'rate',
        'total_rate',
        'start_date',
        'handover_date',
        'status',
        'project_status',
        'live_at',
        'assigned_user_id',
        'assigned_at',
    ];
    protected $appends = ['project_status_text','type'];

    protected function type(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => 'labour',
        );
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function assignedUser()
    {
        return $this->belongsTo(User::class,'assigned_user_id');
    }

    public function getProjectStatusTextAttribute()
    {
        return ProjectStatusEnum::from($this->project_status)->label();
    }

    public function address() : MorphOne
    {
        return $this->morphOne(ProjectAddress::class,'project');
    }

    public function workType()
    {
        return $this->belongsTo(WorkType::class)->withTrashed();
    }



    public function application()
    {
        return $this->hasMany(ProjectLabourApplication::class);
    }

}
