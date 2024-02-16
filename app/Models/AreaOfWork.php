<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AreaOfWork extends Model
{
    use HasFactory,SoftDeletes;

    public function request(){
        return $this->hasMany(AreaOfWork::class);
    }
}
