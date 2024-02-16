<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\ElemantraVerificationEnum;
use App\Models\Role;
use App\Models\UserKyc;
use App\Models\ReviewUser;
use App\Enums\UserRoleEnum;
use App\Models\UserCompany;
use App\Models\ReviewRating;
use App\Models\UserWorkType;
use App\Models\ReviewCategory;
use App\Models\UserPropertyType;
use App\Models\UserProjectSample;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Storage;
use Database\Seeders\UserWorkTypeSeeder;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'phone',
        'alt_phone',
        'email',
        'role_id',
        'password',
        'profile',
        'current_work',
        'oauth_login',
        'email_verified_at',
        'elemantra_verification',
        'verification_step',
        'verification_requested_at',
        'verified_at',
        'uuid',
        'status'
    ];
    protected $appends  = [
        'role_string',
        'verification_process_percent',
        'verification_step_name',
    ];
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected function getRoleStringAttribute()
    {
        return UserRoleEnum::from($this->role_id)->label();
    }


    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    protected function getVerificationProcessPercentAttribute()
    {
        $value = 0;
        if ($this->elemantra_verification == (string)ElemantraVerificationEnum::PENDING->value) {
            $currentStep = $this->verification_step - 1;
            $totalSteps = OnboardStep::count();
            return ($currentStep / $totalSteps) * 100;
        }
        if ($this->elemantra_verification == (string)ElemantraVerificationEnum::VERIFIED->value) {
            return 100;
        }
        return $value;
    }

    protected function getVerificationStepNameAttribute()
    {
        $value = null;
        if ($this->elemantra_verification == (string)ElemantraVerificationEnum::PENDING->value) {
            $currentStep = $this->verification_step;
            $value = OnboardStep::whereId($currentStep)->first()->title;
        }
        return $value;
    }


    protected function profile(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?  asset(Storage::url($value)) : asset('admin/assets/images/avtar/profile.png'),
        );
    }

    public function kyc()
    {
        return $this->hasMany(UserKyc::class);
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function userPropertyType()
    {
        return $this->hasMany(UserPropertyType::class);
    }

    public function userWorkType()
    {
        return $this->hasMany(UserWorkType::class)->withTrashed();
    }

    public function company()
    {
        return $this->hasOne(UserCompany::class);
    }

    public function sampleProjects()
    {
        return $this->hasMany(UserProjectSample::class);
    }

    public function review()
    {
        return $this->hasMany(ReviewUser::class);
    }

    public function reviewRatings()
    {
        return $this->hasManyThrough(
            ReviewRating::class, // The target model you want to access
            ReviewUser::class,   // The intermediate model
            'user_id',           // The foreign key on the intermediate model (ReviewUser)
            'review_user_id',    // The foreign key on the target model (ReviewRating)
            'id',                // The local key on the current model (User)
            'id'                 // The local key on the intermediate model (ReviewUser)
        )->with('reviewCategory'); // Load the related review category for each rating
    }
    public function reviewCategories()
    {
        return $this->hasManyThrough(
            ReviewCategory::class,
            ReviewRating::class,
            'user_id', // Foreign key on the reviews table
            'id',      // Local key on the review categories table
            'id',      // Local key on the users table
            'review_category_id' // Foreign key on the reviews table
        );
    }

    public function reviewCategory()
    {
        return $this->hasManyThrough(
            ReviewRating::class, // The target model you want to access
            ReviewCategory::class,   // The intermediate model
            'user_id',           // The foreign key on the intermediate model (ReviewUser)
            'review_category_id',    // The foreign key on the target model (ReviewRating)
            'id',                // The local key on the current model (User)
            'id'                 // The local key on the intermediate model (ReviewUser)
        )->with('reviewCategory'); // Load the related review category for each rating
    }

    //scope of reviews get
    public function scopeGetOverAllRate($query)
    {
        return $query->withCount(
            'review'
        )->withAvg('reviewRatings', 'rating');
    }

    public function verificationRemarks()
    {
        return $this->hasMany(VerificationRemark::class);
    }
}
