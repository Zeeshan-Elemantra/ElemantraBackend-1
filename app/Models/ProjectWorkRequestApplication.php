<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProjectWorkRequestApplication extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'project_work_type_application_id',
        'project_work_request_id',
        'user_id',
        'project_type',
        'project_id',
        'rate',
        'rate_total'
    ];

    public function workRequest(){
        return $this->belongsTo(ProjectWorkRequest::class,'project_work_request_id');
    }

    public function application(){
        return $this->belongsTo(ProjectWorkTypeApplication::class,'project_work_type_application_id');
    }

}
