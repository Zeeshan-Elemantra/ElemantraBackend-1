<?php

namespace App\Models;

use App\Enums\ProjectStatusEnum;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProjectTurnkeyContractor extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'name', 'user_id', 'project_type_id', 'property_type_id', 'budget_range_id', 'start_date', 'handover_date', 'description', 'project_status',
        'budget_min', 'budget_max','live_at','assigned_user_id','assigned_at','property_other'
    ];
    protected $appends = ['project_status_text','type'];

    protected function type(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => 'turnkey',
        );
    }

    public function getProjectStatusTextAttribute()
    {
        return ProjectStatusEnum::from($this->project_status)->label();
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function assignedUser()
    {
        return $this->belongsTo(User::class,'assigned_user_id');
    }

    public function address() : MorphOne
    {
        return $this->morphOne(ProjectAddress::class,'project');
    }

    public function propertyType()
    {
        return $this->belongsTo(PropertyType::class);
    }
    public function budgetRange()
    {
        return $this->belongsTo(BudgetRange::class,'budget_range_id')->withTrashed();
    }

    public function projectWorkType() : MorphMany
    {
        return $this->morphMany(ProjectWorkType::class,'project');
    }

    public function workRequest() : MorphMany
    {
        return $this->morphMany(ProjectWorkRequest::class,'project');
    }

    public function application() : MorphMany
    {
        return $this->morphMany(ProjectWorkTypeApplication::class,'project');
    }

    public function applicationRequest() : MorphMany
    {
        return $this->morphMany(ProjectWorkRequestApplication::class,'project');
    }
}
