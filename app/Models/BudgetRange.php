<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BudgetRange extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = [
        'name','min','max'
    ];

    public function projectTurnkey(){
        return $this->hasMany(ProjectTurnkeyContractor::class);
    }
    public function projectIndividual(){
        return $this->hasMany(ProjectIndividualContractor::class);
    }
}
