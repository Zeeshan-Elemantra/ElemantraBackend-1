<?php

namespace App\Models;

use App\Enums\ApplicationStatusEnum;
use App\Enums\WorkTypeStatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProjectWorkType extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'project_type','project_id','project_type_id','work_type_id'
    ];
    protected $appends = [
        'category_status',
        'category_status_text',
    ];

    public function workType()
    {
        return $this->belongsTo(WorkType::class)->withTrashed();
    }

    public function project()
    {
        return $this->morphTo();
    }

    public function application()
    {
        return $this->hasMany(ProjectWorkTypeApplication::class);
    }

    public function workRequest()
    {
        return $this->hasMany(ProjectWorkRequest::class);
    }

    public function assignedUser()
    {
        return $this->belongsTo(User::class,'assigned_user_id');
    }

    public function getCategoryStatusAttribute()
    {
        $status = WorkTypeStatusEnum::PENDING->value;
        if(ProjectWorkTypeApplication::where('project_work_type_id',$this->id)->exists()){
            $status = WorkTypeStatusEnum::APPLICATION->value;
        }
        if(ProjectWorkTypeApplication::where('project_work_type_id',$this->id)->where('application_status',(string)ApplicationStatusEnum::MEET->value)->exists() && $this->assigned_user_id == null){
            $status = WorkTypeStatusEnum::MEET->value;
        }

        if($this->assigned_user_id !=null){
            $status = WorkTypeStatusEnum::ASSIGNED->value;
        }
        return $status;
    }

    public function getCategoryStatusTextAttribute()
    {
        return WorkTypeStatusEnum::from($this->category_status)->label();
    }

}
