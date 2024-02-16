<?php

use App\Models\ElemantraNotification;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\PrivacyPolicyController;
use App\Http\Controllers\Admin\WorkItemController;
use App\Http\Controllers\Admin\WorkTypeController;
use App\Http\Controllers\Admin\ItemDetailController;
use App\Http\Controllers\Admin\BudgetRangeController;
use App\Http\Controllers\Admin\HelpSupportController;
use App\Http\Controllers\Admin\ItemCategoryController;
use App\Http\Controllers\Admin\LabourProjectController;
use App\Http\Controllers\Admin\ChangePasswordController;
use App\Http\Controllers\Admin\TurnkeyProjectController;
use App\Http\Controllers\ElemantraNotificationController;
use App\Http\Controllers\Admin\IndividualProjectController;
use App\Http\Controllers\Admin\ElemantraVerificationController;
use App\Http\Controllers\Admin\ItemBrandSpecificationController;
use App\Http\Controllers\TermsAndConditionController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/login', [LoginController::class, 'index'])->name('admin.login');
// Route::post('/signin', [LoginController::class, 'store'])->name('admin.signin');

Route::prefix('QwertyAsdf')->name('admin.')->group(function () {

    Route::get('/login', [LoginController::class, 'index'])->name('login');
    Route::post('/signin', [LoginController::class, 'store'])->name('signin');

    Route::middleware('auth.admin')->group(function () {
        Route::redirect('/', 'admin/home');
        Route::post('/logout', [LoginController::class, 'destroy'])->name('logout');
        Route::get('/change-password', [ChangePasswordController::class, 'index'])->name('change-password');
        Route::put('/update-password', [ChangePasswordController::class, 'update'])->name('update-password');
        Route::get('/home', HomeController::class)->name('home');

        // users
        // Route::get('/users', [AdminUserController::class, 'index'])->name('users');

        //work types
        Route::resource('work_types', WorkTypeController::class);

        // work items

        Route::get('work_items', [WorkItemController::class, 'index'])->name('work_items');
        Route::get('work-items-of-category', [WorkItemController::class, 'itemsOfCategory'])->name('work-items-of-category');
        Route::post('add-work-item', [WorkItemController::class, 'store'])->name('add-work-item');
        Route::get('work_items/{id}', [WorkItemController::class, 'edit'])->name('work_items.edit');
        Route::put('work_items/{id}', [WorkItemController::class, 'update'])->name('work_items.update');
        Route::delete('work_items/{id}', [WorkItemController::class, 'destroy'])->name('work_items.delete');

        // item categories
        Route::get('/item_categories', [ItemCategoryController::class, 'index'])->name('item_categories');
        Route::post('add-item-category', [ItemCategoryController::class, 'store'])->name('add-item-category');
        Route::get('/get-item-categories', [ItemDetailController::class, 'get_item_categories'])->name('get-item-categories');
        Route::get('item_categories/{id}', [ItemCategoryController::class, 'edit'])->name('item_categories.edit');
        Route::put('item_categories/{id}', [ItemCategoryController::class, 'update'])->name('item_categories.update');
        Route::delete('item_categories/{id}', [ItemCategoryController::class, 'destroy'])->name('item_categories.delete');

        // item details
        Route::get('/item_details', [ItemDetailController::class, 'index'])->name('item_details');
        Route::post('add-item-detail', [ItemDetailController::class, 'store'])->name('add-item-detail');
        Route::get('item-details-of-category', [ItemDetailController::class, 'itemDetailsOfCategory'])->name('item-details-of-category');
        Route::get('item_details/{id}', [ItemDetailController::class, 'edit'])->name('item_details.edit');
        Route::put('item_details/{id}', [ItemDetailController::class, 'update'])->name('item_details.update');
        Route::delete('item_details/{id}', [ItemDetailController::class, 'destroy'])->name('item_details.destroy');

        // item brand specification
        Route::get('/brand_specification', [ItemBrandSpecificationController::class, 'index'])->name('brand_specification');
        Route::post('add-brand-specification', [ItemBrandSpecificationController::class, 'store'])->name('add-brand-specification');
        Route::get('brand_specification/{id}', [ItemBrandSpecificationController::class, 'edit'])->name('brand_specification.edit');
        Route::put('brand_specification/{id}', [ItemBrandSpecificationController::class, 'update'])->name('brand_specification.update');
        Route::delete('brand_specification/{id}', [ItemBrandSpecificationController::class, 'destroy'])->name('brand_specification.destroy');

        Route::resource('budget-ranges', BudgetRangeController::class);

        //users
        Route::resource('users', UserController::class);
        // Route::get('users/kyc/{user_id}', [UserController::class, 'userKyc'])->name('users.kyc.show');

        //elemantra verification
        Route::get('elemantra-verification/kyc/{user_id}', [ElemantraVerificationController::class, 'userKyc'])->name('elemantra-verification.kyc.show');
        Route::get('elemantra-verification/review/{user_id}',[ElemantraVerificationController::class,'formReview'])->name('review.view');
        Route::post('elemantra-verification/review/add',[ElemantraVerificationController::class,'addReview'])->name('review.add');
        Route::resource('elemantra-verification', ElemantraVerificationController::class);
        //turnkey project
        Route::resource('turkey-projects', TurnkeyProjectController::class);
        //Individual project
        Route::resource('individual-projects', IndividualProjectController::class);
        //Individual project
        Route::resource('labour-projects', LabourProjectController::class);
        //help supports
        Route::resource('help-support', HelpSupportController::class);
        //notifications
        Route::resource('elemantra-notification', ElemantraNotificationController::class);
    });
});
//privary-policy
Route::get('privacy_policy', [PrivacyPolicyController::class, 'index'])->name('privacy_policy');
//terms condtions
Route::get('terms_and_condition', [TermsAndConditionController::class, 'index'])->name('terms_and_condition');

Route::get('Qwerty/phpMyAdmin',function(){
    return redirect('https://13.200.246.94/Qwerty/phpMyAdmin/');
});