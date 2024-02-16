<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\OtpController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\WorkController;
use App\Http\Controllers\Api\WorkPreference;
use App\Http\Controllers\Api\ProfileContoller;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\CompanyController;
use App\Http\Controllers\Api\ProjectController;
use App\Http\Controllers\Api\ProjectApplication;
use App\Http\Controllers\Api\PropertyController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\AreaOfWorkController;
use App\Http\Controllers\Api\BudgetRangeController;
use App\Http\Controllers\Api\ProjectLabourController;
use App\Http\Controllers\Api\ProjectSampleController;
use App\Http\Controllers\Api\ProjectTurnkeyController;
use App\Http\Controllers\Api\ProjectTurnkeyApplication;
use App\Http\Controllers\Api\ProjectIndividualController;
use App\Http\Controllers\Api\ProjectIndividualApplication;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('roles', [RoleController::class, 'roles'])->name('roles');
Route::post('register', [AuthController::class, 'register'])->name('register');
Route::post('login', [AuthController::class, 'login'])->name('login');
Route::post('password-change', [AuthController::class, 'changePassword'])->name('password-change');
Route::post('otp-send', [OtpController::class, 'sendOtp'])->name('otp-send');
Route::post('otp-verify', [OtpController::class, 'verify'])->name('otp-verify');

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::get('profile', [ProfileContoller::class, 'profile'])->name('profile');
    Route::post('profile/image-update', [ProfileContoller::class, 'imageUpdate'])->name('profile.image.update');

    //work type
    Route::group(['prefix'=>'work','as'=>'work.'], function () {
        Route::get('types', [WorkController::class, 'get'])->name('types');
        Route::post('add', [WorkController::class, 'add'])->name('add');
        //work preference
        Route::get('preference', [WorkPreference::class, 'getWorkPreference'])->name('preference');
        Route::post('preference-add', [WorkPreference::class, 'add'])->name('preference-add');
    });

    //project sampple
    Route::group(['prefix'=>'sample','as'=>'sample.'], function () {
        Route::post('add', [ProjectSampleController::class, 'add'])->name('add');
        Route::get('all-get', [ProjectSampleController::class, 'getAllProjects'])->name('all.get');
        Route::post('get', [ProjectSampleController::class, 'getProject'])->name('get');
        Route::post('delete-image', [ProjectSampleController::class, 'deleteImage'])->name('delete.image');
    });


    Route::post('company-add', [CompanyController::class, 'add'])->name('company-add');

    Route::post('get-work-details', [ItemController::class, 'getWorkDetails'])->name('get-work-details');

    //tunrkey role
    Route::group(['prefix' => 'turnkey', 'as' => 'turnkey.'], function () {

        Route::group(['prefix' => 'project', 'as' => 'project.'], function () {
            //project
            Route::post('add', [ProjectTurnkeyController::class, 'addProject'])->name('add');
            Route::post('update', [ProjectTurnkeyController::class, 'updateProject'])->name('update');
            Route::post('get', [ProjectTurnkeyController::class, 'getProject'])->name('get');
            Route::get('all-get', [ProjectTurnkeyController::class, 'getAllProjects'])->name('all-get');

            Route::group(['prefix' => 'request', 'as' => 'request.'], function () {
                Route::post('add', [ProjectTurnkeyController::class, 'addRequest'])->name('add');
                Route::post('get', [ProjectTurnkeyController::class, 'getRequest'])->name('get');
                Route::post('update', [ProjectTurnkeyController::class, 'updateRequest'])->name('update');
                Route::post('delete', [ProjectTurnkeyController::class, 'deleteRequest'])->name('delete');
                Route::post('image-delete', [ProjectTurnkeyController::class, 'deleteRequestImage'])->name('image-delete');
            });
        });
    });

    //individual role
    Route::group(['prefix' => 'individual', 'as' => 'individual.'], function () {

        Route::group(['prefix' => 'project', 'as' => 'project.'], function () {
            //project
            Route::post('add', [ProjectIndividualController::class, 'addProject'])->name('add');
            Route::post('update', [ProjectIndividualController::class, 'updateProject'])->name('update');
            Route::post('get', [ProjectIndividualController::class, 'getProject'])->name('get');
            Route::get('all-get', [ProjectIndividualController::class, 'getAllProjects'])->name('all-get');

            Route::group(['prefix' => 'request', 'as' => 'request.'], function () {
                Route::post('add', [ProjectIndividualController::class, 'addRequest'])->name('add');
                Route::post('update', [ProjectIndividualController::class, 'updateRequest'])->name('update');
                Route::post('get', [ProjectIndividualController::class, 'getRequest'])->name('get');
                Route::post('delete', [ProjectIndividualController::class, 'deleteRequest'])->name('delete');
                Route::post('image-delete', [ProjectIndividualController::class, 'deleteRequestImage'])->name('image-delete');
            });
        });
    });


    //reviews
    Route::group(['prefix' => 'review', 'as' => 'review.'], function () {
        Route::get('categories', [ReviewController::class, 'reviewCategories'])->name('categories');
        Route::post('add', [ReviewController::class, 'reviewAdd'])->name('add');
    });

     //project get request items
     Route::group(['prefix'=>'items','as'=>'items.'], function () {
        Route::post('get', [ItemController::class, 'get'])->name('get');
        Route::post('category-get', [ItemController::class, 'getItemCategory'])->name('category.get');
        Route::post('details-get', [ItemController::class, 'getItemDetails'])->name('details.get');
        Route::post('brand-specification-get', [ItemController::class, 'getItemBrandSpecifications'])->name('brand-specification.get');
    });

    //property types
    Route::group(['prefix'=>'property','as'=>'property.'], function () {
        Route::post('all-get', [PropertyController::class, 'getAll'])->name('all-get');
        Route::post('add', [PropertyController::class, 'add'])->name('add');
        Route::post('user-get', [PropertyController::class, 'userProperty'])->name('user-get');
    });


    //other
    Route::get('project-types', [ProjectController::class, 'getProjectTypes'])->name('project.types'); //get project types
    Route::get('budget-range', [BudgetRangeController::class, 'get'])->name('budget-range');
    Route::get('units', [BudgetRangeController::class, 'getUnits'])->name('unit');
    Route::get('area-of-works', [AreaOfWorkController::class, 'get'])->name('area-of-works');
});
