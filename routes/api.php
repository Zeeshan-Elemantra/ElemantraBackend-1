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
use App\Http\Controllers\Api\UserKycController;
use App\Http\Controllers\Api\ProjectApplication;
use App\Http\Controllers\Api\PropertyController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\GoogleMapController;
use App\Http\Controllers\Api\AreaOfWorkController;
use App\Http\Controllers\Api\BudgetRangeController;
use App\Http\Controllers\Api\HelpSupportController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\ProjectSampleController;
use App\Http\Controllers\Api\Labour\LabourFindController;
use App\Http\Controllers\Api\Turnkey\TurnkeyFindController;
use App\Http\Controllers\Api\Labour\ProjectLabourController;
use App\Http\Controllers\Api\Labour\DashboardLabourController;
use App\Http\Controllers\Api\Turnkey\ProjectTurnkeyController;
use App\Http\Controllers\Api\Turnkey\ProjectTurnkeyApplication;
use App\Http\Controllers\Api\Turnkey\DashboardTurnkeyController;
use App\Http\Controllers\Api\Turnkey\MyProjectTurnkeyController;
use App\Http\Controllers\Api\Individual\IndividualFindController;
use App\Http\Controllers\Api\Designer\DashboardDesignerController;
use App\Http\Controllers\Api\Designer\MyProjectDesignerController;
use App\Http\Controllers\Api\Turnkey\TurnkeyContractorApplication;
use App\Http\Controllers\Api\Designer\DesignerContractorApplication;
use App\Http\Controllers\Api\Individual\ProjectIndividualController;
use App\Http\Controllers\Api\Individual\DashboardIndividualController;
use App\Http\Controllers\Api\Individual\MyProjectIndividualController;
use App\Http\Controllers\Api\Individual\IndividualContractorApplication;
use Illuminate\Http\Request;

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
Route::get('unauthorized', function () {
    return response()->json(['success' => false, 'message' => 'Unauthorized access']);
})->name('unauthorized');

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::group(['prefix' => 'profile', 'as' => 'profile.'], function () {
        Route::get('/', [ProfileContoller::class, 'profile'])->name('profile');
        Route::post('update/alt_phone', [ProfileContoller::class, 'updateAltPhone'])->name('alt_phone.update');
        Route::post('update/phone', [ProfileContoller::class, 'updatePhone'])->name('phone.update');
        Route::post('update/email', [ProfileContoller::class, 'updateEmail'])->name('email.update');
        Route::post('image-update', [ProfileContoller::class, 'imageUpdate'])->name('image.update');
        Route::post('current-work/update', [ProfileContoller::class, 'updateCurrentWork'])->name('current-work.update');
        Route::post('update/uuid', [ProfileContoller::class, 'updatePlayerId'])->name('uuid.update');
        Route::post('delete', [ProfileContoller::class, 'deleteAccount'])->name('delete');

        Route::group(['prefix' => 'kyc', 'as' => 'kyc.'], function () {
            Route::post('add', [UserKycController::class, 'add'])->name('add');
        });
    });

    //property types
    Route::post('property-all-get', [PropertyController::class, 'getAll'])->name('property-all-get');
    Route::post('property-add', [PropertyController::class, 'add'])->name('property-add');
    Route::post('property-user-get', [PropertyController::class, 'userProperty'])->name('property-user-get');

    //work type
    Route::get('work-types', [WorkController::class, 'get'])->name('work-types');
    Route::post('work-add', [WorkController::class, 'add'])->name('work-add');

    //work preference
    Route::get('work-preference', [WorkPreference::class, 'getWorkPreference'])->name('work-preference');
    Route::post('work-preference-add', [WorkPreference::class, 'add'])->name('work-preference-add');
    Route::post('work-preference-update', [WorkPreference::class, 'update'])->name('work-preference-update');

    //company
    Route::post('company-add', [CompanyController::class, 'add'])->name('company-add');
    Route::post('company-update', [CompanyController::class, 'update'])->name('company-update');

    Route::post('get-work-details', [ItemController::class, 'getWorkDetails'])->name('get-work-details');

    //project get request items
    Route::group(['prefix' => 'items', 'as' => 'items.'], function () {
        Route::post('get', [ItemController::class, 'get'])->name('get');
        Route::post('category-get', [ItemController::class, 'getItemCategory'])->name('category.get');
        Route::post('details-get', [ItemController::class, 'getItemDetails'])->name('details.get');
        Route::post('brand-specification-get', [ItemController::class, 'getItemBrandSpecifications'])->name('brand-specification.get');
    });

    //home dashobard
    Route::group(['prefix' => 'project', 'as' => 'project.'], function () {

        Route::get('types', [ProjectController::class, 'getProjectTypes'])->name('types');

        //designer contractor
        Route::group(['prefix' => 'designer', 'as' => 'designer.'], function () {

            //dashboard
            Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
                Route::post('home-hw', [DashboardDesignerController::class, 'homeHireWork'])->name('home-hw');
                // Route::post('home-fw', [DashboardTurnkeyController::class, 'homeFindWork'])->name('home-fw');
            });

            //my home routes
            Route::group(['prefix' => 'my', 'as' => 'my.'], function () {
                Route::post('projects-hw', [MyProjectDesignerController::class, 'myProjectsHireWork'])->name('projects-hw');

                Route::group(['prefix' => 'applications', 'as' => 'applications.'], function () {
                    Route::get('/', [DesignerContractorApplication::class, 'myApplications'])->name('applications');
                    Route::post('get', [DesignerContractorApplication::class, 'getApplication'])->name('applications.get');
                    Route::post('over-all-cost', [DesignerContractorApplication::class, 'overAllCost'])->name('over-all-cost');
                    Route::post('cost-summery', [DesignerContractorApplication::class, 'costSummery'])->name('cost-summery');
                    Route::post('request-meet', [DesignerContractorApplication::class, 'requestMeet'])->name('request-meet');
                    Route::post('profile', [DesignerContractorApplication::class, 'profile'])->name('profile');
                    Route::post('assign', [DesignerContractorApplication::class, 'assign'])->name('assign');
                });
            });

            //find work
            // Route::group(['prefix' => 'find', 'as' => 'find.'], function () {
            //     Route::post('search', [TurnkeyFindController::class, 'searchProjects'])->name('search');
            //     Route::post('get', [TurnkeyFindController::class, 'getProject'])->name('get');
            //     Route::post('request-save', [TurnkeyFindController::class, 'saveRequest'])->name('request-save');
            //     Route::post('apply', [TurnkeyFindController::class, 'apply'])->name('apply');
            // });
        });

        //project turnkey contractor
        Route::group(['prefix' => 'turnkey', 'as' => 'turnkey.'], function () {
            //project
            Route::post('add', [ProjectTurnkeyController::class, 'addProject'])->name('add');
            Route::post('update', [ProjectTurnkeyController::class, 'updateProject'])->name('update');
            Route::post('get', [ProjectTurnkeyController::class, 'getProject'])->name('get');
            Route::post('delete', [ProjectTurnkeyController::class, 'deleteProject'])->name('delete');
            Route::get('all-get', [ProjectTurnkeyController::class, 'getAllProjects'])->name('all-get');
            Route::post('submit', [ProjectTurnkeyController::class, 'submitProject'])->name('submit'); //live project

            Route::post('over-all-cost', [ProjectTurnkeyController::class, 'overAllCost'])->name('over-all-cost');
            Route::post('cost-summery', [ProjectTurnkeyController::class, 'costSummery'])->name('cost-summery');

            //project boq request
            Route::post('request-add', [ProjectTurnkeyController::class, 'addRequest'])->name('request-add');
            Route::post('request-update', [ProjectTurnkeyController::class, 'updateRequest'])->name('request-update');
            Route::post('request-delete', [ProjectTurnkeyController::class, 'deleteRequest'])->name('request-delete');
            Route::post('request-image-delete', [ProjectTurnkeyController::class, 'deleteRequestImage'])->name('request-image-delete');
            Route::post('request-get', [ProjectTurnkeyController::class, 'getRequest'])->name('request-get');


            //my other routes role based
            // Route::post('my-projects', [ProjectTurnkeyController::class, 'myProjects'])->name('my-projects');
            // Route::get('my-applications', [ProjectTurnkeyApplication::class, 'myApplications'])->name('my-applications');
            // Route::post('application-get', [ProjectTurnkeyApplication::class, 'getApplication'])->name('application.get');

            //dashboard
            Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
                Route::post('home-hw', [DashboardTurnkeyController::class, 'homeHireWork'])->name('home-hw');
                Route::post('home-fw', [DashboardTurnkeyController::class, 'homeFindWork'])->name('home-fw');
            });

            //my home routes
            Route::group(['prefix' => 'my', 'as' => 'my.'], function () {
                Route::post('projects-hw', [MyProjectTurnkeyController::class, 'myProjectsHireWork'])->name('projects-hw');
                Route::post('projects-fw', [MyProjectTurnkeyController::class, 'myProjectsFindWork'])->name('projects-fw');

                Route::group(['prefix' => 'applications', 'as' => 'applications.'], function () {
                    Route::get('/', [TurnkeyContractorApplication::class, 'myApplications'])->name('applications');
                    Route::post('get', [TurnkeyContractorApplication::class, 'getApplication'])->name('applications.get');
                    Route::post('profile', [TurnkeyContractorApplication::class, 'profile'])->name('profile');
                    Route::post('request-meet', [TurnkeyContractorApplication::class, 'requestMeet'])->name('request-meet');
                    Route::post('assign', [TurnkeyContractorApplication::class, 'assign'])->name('assign');
                    Route::post('cost-summery', [TurnkeyContractorApplication::class, 'costSummery'])->name('cost-summery');
                });
            });

            //find work
            Route::group(['prefix' => 'find', 'as' => 'find.'], function () {
                Route::post('search', [TurnkeyFindController::class, 'searchProjects'])->name('search');
                Route::post('get', [TurnkeyFindController::class, 'getProject'])->name('get');
                Route::post('request-get', [TurnkeyFindController::class, 'getRequest'])->name('request-get');
                Route::post('over-all-cost', [TurnkeyFindController::class, 'getCostDiffer'])->name('over-all-cost');
                Route::post('cost-summery', [TurnkeyFindController::class, 'costSummery'])->name('cost-summery');
                Route::post('request-save', [TurnkeyFindController::class, 'saveRequest'])->name('request-save');
                Route::post('apply', [TurnkeyFindController::class, 'apply'])->name('apply');
            });
        });

        //project individual contractor
        Route::group(['prefix' => 'individual', 'as' => 'individual.'], function () {
            //project
            Route::post('add', [ProjectIndividualController::class, 'addProject'])->name('add');
            Route::post('update', [ProjectIndividualController::class, 'updateProject'])->name('update');
            Route::post('get', [ProjectIndividualController::class, 'getProject'])->name('get');
            Route::get('all-get', [ProjectIndividualController::class, 'getAllProjects'])->name('all-get');
            Route::post('delete', [ProjectIndividualController::class, 'deleteProject'])->name('delete');

            //live project
            Route::post('submit', [ProjectIndividualController::class, 'submitProject'])->name('submit');

            //project boq requests
            Route::post('request-add', [ProjectIndividualController::class, 'addRequest'])->name('request-add');
            Route::post('request-update', [ProjectIndividualController::class, 'updateRequest'])->name('request-update');
            Route::post('request-get', [ProjectIndividualController::class, 'getRequest'])->name('request-get');
            Route::post('request-delete', [ProjectIndividualController::class, 'deleteRequest'])->name('request-delete');
            Route::post('request-image-delete', [ProjectIndividualController::class, 'deleteRequestImage'])->name('request-image-delete');


            //my other routes role based

            // Route::post('my-projects', [ProjectIndividualController::class, 'myProjects'])->name('my-projects');
            // Route::get('my-applications', [ProjectIndividualApplication::class, 'myApplications'])->name('my-applications');
            // Route::post('application-get', [ProjectIndividualApplication::class, 'getApplication'])->name('applications.get');

            Route::group(['prefix' => 'find', 'as' => 'find.'], function () {
                Route::post('search', [IndividualFindController::class, 'searchProjects'])->name('search');
                Route::post('get', [IndividualFindController::class, 'getProject'])->name('get');
                Route::post('request-get', [IndividualFindController::class, 'getRequest'])->name('request-get');
                Route::post('request-save', [IndividualFindController::class, 'saveRequest'])->name('request-save');
                Route::post('apply', [IndividualFindController::class, 'apply'])->name('apply');
            });

            //dashboard
            Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
                Route::post('home-hw', [DashboardIndividualController::class, 'homeHireWork'])->name('home-hw');
                Route::post('home-fw', [DashboardIndividualController::class, 'homeFindWork'])->name('home-fw');
            });

            Route::group(['prefix' => 'my', 'as' => 'my.'], function () {
                Route::post('projects-hw', [MyProjectIndividualController::class, 'myProjectsHireWork'])->name('projects-hw');
                Route::post('projects-fw', [MyProjectIndividualController::class, 'myProjectsFindWork'])->name('projects-fw');

                Route::group(['prefix' => 'applications', 'as' => 'applications.'], function () {
                    Route::get('/', [IndividualContractorApplication::class, 'myApplications'])->name('applications');
                    Route::post('get', [IndividualContractorApplication::class, 'getApplication'])->name('applications.get');
                    Route::post('profile', [IndividualContractorApplication::class, 'profile'])->name('profile');
                    Route::post('request-meet', [IndividualContractorApplication::class, 'requestMeet'])->name('request-meet');
                    Route::post('assign', [IndividualContractorApplication::class, 'assign'])->name('assign');
                });
            });
        });

        //project SKilled Labour contractor
        Route::group(['prefix' => 'labour', 'as' => 'labour.'], function () {
            Route::post('add', [ProjectLabourController::class, 'addProject'])->name('add');
            Route::post('get', [ProjectLabourController::class, 'getProject'])->name('get');
            Route::post('update', [ProjectLabourController::class, 'updateProject'])->name('update');
            Route::post('delete', [ProjectLabourController::class, 'deleteProject'])->name('delete');

            Route::group(['prefix' => 'find', 'as' => 'find.'], function () {
                Route::post('search', [LabourFindController::class, 'searchProjects'])->name('search');
                Route::post('get', [LabourFindController::class, 'getProject'])->name('get');
                Route::post('apply', [LabourFindController::class, 'apply'])->name('apply');
            });

            Route::group(['prefix' => 'my', 'as' => 'my.'], function () {
                Route::post('projects', [ProjectLabourController::class, 'myProjects'])->name('projects');
            });

            Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
                Route::post('home', [DashboardLabourController::class, 'home'])->name('home');
            });
        });

        //project sample
        Route::group(['prefix' => 'sample', 'as' => 'sample.'], function () {
            Route::post('add', [ProjectSampleController::class, 'add'])->name('add');
            Route::post('get', [ProjectSampleController::class, 'getProject'])->name('get');
            Route::post('update', [ProjectSampleController::class, 'update'])->name('update');
            Route::post('delete', [ProjectSampleController::class, 'delete'])->name('delete');
            Route::get('all-get', [ProjectSampleController::class, 'getAllProjects'])->name('all.get');
            Route::post('delete-image', [ProjectSampleController::class, 'deleteImage'])->name('delete.image');
        });

        // Route::group(['prefix' => 'applications', 'as' => 'applications.'], function () {
        //     // Route::get('received', [ProjectApplication::class, 'receivedApplications'])->name('received');
        //     // Route::post('project', [ProjectApplication::class, 'getProjectApplications'])->name('project');

        //     Route::post('cost-summery', [ProjectApplication::class, 'costSummery'])->name('cost-summery');
        //     Route::post('profile', [ProjectApplication::class, 'profile'])->name('profile');
        //     Route::post('request-meet', [ProjectApplication::class, 'requestMeet'])->name('request-meet');
        //     Route::post('assign', [ProjectApplication::class, 'assign'])->name('assign');
        // });
    });

    //Review
    Route::group(['prefix' => 'review', 'as' => 'review.'], function () {
        Route::get('categories', [ReviewController::class, 'reviewCategories'])->name('categories');
        Route::post('add', [ReviewController::class, 'reviewAdd'])->name('add');
        Route::post('get', [ReviewController::class, 'reviewGet'])->name('get');
    });

    //Help Support
    Route::group(['prefix' => 'help_support', 'as' => 'help_support.'], function () {
        Route::post('add', [HelpSupportController::class, 'add'])->name('add');
    });

    //notification
    Route::group(['prefix' => 'notification', 'as' => 'notification.'], function () {
        Route::post('get', [NotificationController::class, 'getNotifications'])->name('get');
    });

    //other
    Route::get('budget-range', [BudgetRangeController::class, 'get'])->name('budget-range');
    Route::get('units', [BudgetRangeController::class, 'getUnits'])->name('unit');
    Route::get('area-of-works', [AreaOfWorkController::class, 'get'])->name('area-of-works');
});

Route::get('google_map_key', [GoogleMapController::class, 'getKey'])->name('google_map_key');

Route::get('deep_linking', function (Request $request) {
    $url = 'https://play.google.com/store/apps/details?id=com.app.elemantra';
    return redirect($url);
    // $playmarket = $request->playmarket;
    // if ($playmarket == 'true') {
    // } else {
    //     return redirect('https://play.google.com/store/apps');
    // }
    // return redirect('https://play.google.com/store/apps/details?id=com.app.elemantra');
});
