<?php

namespace App\Http\Controllers\Api\Turnkey;

use App\Enums\ApplicationStatusEnum;
use App\Models\Project;
use App\Models\BudgetRange;
use App\Models\ProjectType;
use Illuminate\Support\Str;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Models\ProjectAddress;

use Illuminate\Support\Carbon;
use App\Enums\ProjectModelEnum;
use App\Models\ProjectWorkType;
use App\Enums\ProjectStatusEnum;
use App\Models\ProjectWorkRequest;
use App\Http\Controllers\Controller;
use App\Models\ProjectSkilledLabour;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectWorkRequestImage;
use Illuminate\Support\Facades\Storage;
use App\Models\ProjectTurnkeyContractor;
use App\Http\Requests\Api\CostSummeryGet;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ProjectTurnkeyAdd;
use App\Http\Requests\Api\ProjectTurnkeyGet;
use App\Http\Requests\Api\GetOverAllCostUser;
use App\Models\ProjectWorkRequestApplication;
use App\Http\Requests\Api\ProjectTurnkeyUpdate;
use App\Http\Requests\Api\ProjectTurnkeyRequestAdd;
use App\Http\Requests\Api\ProjectTurnkeyRequestGet;
use App\Http\Requests\Api\ProjectTurnkeyRequestUpdate;
use App\Http\Requests\Api\ProjectTurnkeyRequestImageGet;
use SebastianBergmann\CodeCoverage\Report\Xml\Project as XmlProject;

class ProjectTurnkeyController extends Controller
{
    //project related
    public function addProject(ProjectTurnkeyAdd $request)
    {

        try {
            $projectData = $request->safe()
                ->only(
                    'name',
                    'description',
                    'property_type_id',
                    'property_other',
                    'budget_range_id',
                    'start_date',
                    'handover_date',
                );
            $budget = BudgetRange::find($request->budget_range_id);
            $projectData['budget_min'] = $budget->min;
            $projectData['budget_max'] = $budget->max;
            $projectData['user_id'] = Auth::id();
            $projectData['project_type_id'] = ProjectTypeEnum::TURNKEY_CONTRACTOR->value;

            $project = ProjectTurnkeyContractor::create($projectData);
            //address
            $addressData = $request->project_address;
            $addressData['project_type_id'] = ProjectTypeEnum::TURNKEY_CONTRACTOR->value;
            $projectAddress = $project->address()->create($addressData);

            return $this->apiSuccess(null, "Project Created Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updateProject(ProjectTurnkeyUpdate $request)
    {
        try {
            $projectData = $request->safe()
                ->only(
                    // 'project_type_id',
                    'name',
                    'description',
                    'property_type_id',
                    'property_other',
                    'budget_range_id',
                    'start_date',
                    'handover_date',
                );
            $budget = BudgetRange::find($request->budget_range_id);
            $projectData['budget_min'] = $budget->min;
            $projectData['budget_max'] = $budget->max;
            $projectData['user_id'] = Auth::id();
            $project = ProjectTurnkeyContractor::whereId($request->id)->update($projectData);
            //address
            $addressData = $request->project_address;
            $addressData['project_type_id'] = ProjectTypeEnum::TURNKEY_CONTRACTOR;
            $projectAddress = ProjectTurnkeyContractor::find($request->id)->address()->update($addressData);

            return $this->apiSuccess(compact('project'), "Project Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectTurnkeyGet $request)
    {
        try {
            $projects = ProjectTurnkeyContractor::with([
                'propertyType', 'address', 'budgetRange',
                'application',
                'assignedUser' => fn ($q) => $q->withAvg('reviewRatings', 'rating'),
                'projectWorkType' => fn ($q) => $q->with([
                    'workType',
                    'workRequest' => fn ($q) => $q->with('itemCategory')->latest()
                ])
                    ->orderByDesc('updated_at')
            ])
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)], 'over_all_total')
                ->whereId($request->id)->first();
            return $this->apiSuccess($projects, "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteProject(ProjectTurnkeyGet $request)
    {
        try {
            $projects = ProjectTurnkeyContractor::destroy($request->id);
            return $this->apiSuccess(compact('projects'), "Project Deleted Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getAllProjects()
    {
        try {
            $projects = ProjectTurnkeyContractor::where('user_id', Auth::id())->with('projectWorkType', 'workRequest', 'address')->get();
            return $this->apiSuccess($projects, "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function myProjects()
    {
        try {
            $turnkeyProjects = ProjectTurnkeyContractor::with('propertyType', 'address', 'budgetRange', 'projectWorkType')->where('user_id', Auth::id())->latest()->get();
            $individualProjects = ProjectIndividualContractor::with('propertyType', 'address', 'budgetRange', 'projectWorkType')->where('user_id', Auth::id())->latest()->get();
            $labourProjects = ProjectLabourContractor::with('address', 'workType')->where('user_id', Auth::id())->latest()->get();

            $projects = $turnkeyProjects->merge($individualProjects)->merge($labourProjects)->sortByDesc('created_at')->values();

            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function submitProject(ProjectTurnkeyGet $request)
    {
        //live the project
        try {
            $project = ProjectTurnkeyContractor::find($request->id);
            $update = $project->update([
                'project_status' => (string)ProjectStatusEnum::LIVE->value,
                'live_at' => Carbon::now()
            ]);
            return $this->apiSuccess(compact('project'), "Project Live successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    //Project request related
    public function addRequest(ProjectTurnkeyRequestAdd $request)
    {
        try {
            //create or get boq
            $project = ProjectTurnkeyContractor::whereId($request->project_id)->first();

            $projectWorkType = $project->projectWorkType()->updateOrCreate([
                'project_type_id' => ProjectTypeEnum::TURNKEY_CONTRACTOR->value,
                'work_type_id' => $request->work_type_id
            ]);

            $projectWorkRequestData = $request->safe()
                ->only(
                    'area_of_work_id',
                    'item_id',
                    'item_category_id',
                    'item_detail_id',
                    'other_item_detail',
                    'item_brand_specification_id',
                    'other_item_brand_specification',
                    'item_description',
                    'unit_id',
                    'area_size',
                    'quantity'
                );
            $projectWorkRequestData['unique_request_id'] = Carbon::now()->timestamp;
            $projectWorkRequestData['project_id'] = $project->id;
            $projectWorkRequestData['project_type'] = ProjectModelEnum::TURNKEY_CONTRACTOR->value;
            $projectWorkRequestData['project_type_id'] = ProjectTypeEnum::TURNKEY_CONTRACTOR->value;

            $workRequest = $projectWorkType->workRequest()->create($projectWorkRequestData);
            $workRequest->save();

            if ($request->hasFile('floor_plan_file')) {
                $fileName = $projectWorkRequestData['unique_request_id'];
                $path = storeFilePdf($request->file('floor_plan_file'), $fileName, MediaPathEnum::FLOOR_PLAN_PDF->value);
                $workRequest->floor_plan_file = $path;
            }
            $workRequest->save();

            if ($request->has('sample_image')) {
                foreach (json_decode($request->sample_image) as $key => $image) {
                    $fileName = $projectWorkRequestData['unique_request_id'] . '_' . uniqid();
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::WORK_REQUEST_IMAGE->value);
                    $workRequest->images()->create(['image' => $path]);
                }
            }
            return $this->apiSuccess($workRequest, "BoQ Request added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    // public function updateRequest(ProjectTurnkeyRequestUpdate $request)
    // {
    //     try {
    //         //update or get boq
    //         $projectRequest = ProjectWorkRequest::find($request->id);

    //         $projectWorkRequestData = $request->safe()
    //             ->only(
    //                 'area_of_work_id',
    //                 'item_id',
    //                 'item_category_id',
    //                 'item_detail_id',
    //                 'item_brand_specification_id',
    //                 'item_description',
    //                 'unit_id',
    //                 'area_size',
    //                 'quantity'
    //             );

    //         // $projectWorkRequestData['unique_request_id'] = Carbon::now()->timestamp;
    //         $update = $projectRequest->update($projectWorkRequestData);

    //         if ($request->hasFile('floor_plan_file')) {
    //             $fileName = $projectRequest->unique_request_id;
    //             $path = storeFilePdf($request->file('floor_plan_file'), $fileName, MediaPathEnum::FLOOR_PLAN_PDF->value);
    //             $projectRequest->floor_plan_file = $path;
    //         }
    //         $projectRequest->save();

    //         if ($request->has('sample_image')) {

    //             foreach (json_decode($request->sample_image) as $key => $image) {
    //                 $fileName = Str::replaceFirst('#', '', $projectRequest->unique_request_id) . '_' . uniqid();
    //                 $path = storeBase64Image($image, $fileName, MediaPathEnum::WORK_REQUEST_IMAGE->value);
    //                 $projectRequest->images()->create(['image' => $path]);
    //             }
    //         }
    //         return $this->apiSuccess($projectRequest, "BoQ Request added successfully");
    //     } catch (\Exception $ex) {
    //         return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
    //     }
    // }

    public function updateRequest(ProjectTurnkeyRequestUpdate $request)
    {
        try {
            //update or get boq
            $projectRequest = ProjectWorkRequest::find($request->id);

            $projectWorkRequestData = $request->safe()
                ->only(
                    'area_of_work_id',
                    'item_id',
                    'item_category_id',
                    'item_detail_id',
                    'other_item_detail',
                    'item_brand_specification_id',
                    'other_item_brand_specification',
                    'item_description',
                    'unit_id',
                    'area_size',
                    'quantity'
                );



            if ($request->hasFile('floor_plan_file')) {
                $fileName = Str::replaceFirst('#', '', $projectRequest->unique_request_id);
                $path = storeFilePdf($request->file('floor_plan_file'), $fileName, MediaPathEnum::FLOOR_PLAN_PDF->value);
                $projectRequest->floor_plan_file = $path;
            }

            if ($request->has('sample_image') && !empty($request->sample_image)) {
                foreach (json_decode($request->sample_image) as $key => $image) {
                    $fileName = Str::replaceFirst('#', '', $projectRequest->unique_request_id) . '_' . uniqid();
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::WORK_REQUEST_IMAGE->value);
                    $projectRequest->images()->create(['image' => $path]);
                }
            }

            $projectRequest->save();


            if ($request->quantity != $projectRequest->quantity) {

                if ($projectRequest->applicationRequest->isNotEmpty()) {
                    $projectRequest->applicationRequest->each(function ($requestApplication, $key) use ($request) {
                        //boq request update
                        $requestApplication->rate_total = $request->quantity * $requestApplication->rate;
                        $requestApplication->save();

                        //application update

                        $subTotal = $requestApplication->application->applicationRequest->sum('rate');
                        $overAllTotal = $requestApplication->application->applicationRequest->sum('rate_total');

                        $application = $requestApplication->application();
                        $application->update([
                            'sub_total' => $subTotal,
                            'over_all_total' => $overAllTotal
                        ]);
                    });
                }
            }
            $update = $projectRequest->update($projectWorkRequestData);
            return $this->apiSuccess($projectRequest, "BoQ Request Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function getRequest(ProjectTurnkeyRequestGet $request)
    {
        try {
            $workRequest = ProjectWorkRequest::whereId($request->id)
                ->with(['projectWorkType.workType', 'item', 'itemCategory', 'itemDetail', 'itemBrandSpecification', 'unit', 'images'])
                ->first();
            return $this->apiSuccess($workRequest, "Request Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }


    public function deleteRequest(ProjectTurnkeyRequestGet $request)
    {
        try {
            $projectRequest = ProjectWorkRequest::with(['projectWorkType' => fn ($q) => $q->withCount('workRequest')])->whereId($request->id)->first();
            $deleteRequest = ProjectWorkRequest::whereId($request->id)->delete();
            if ($projectRequest->projectWorkType->work_request_count == 1) {
                $deleteProjectWorkType = ProjectWorkType::destroy($projectRequest->projectWorkType->id);
            }
            return $this->apiSuccess(compact('deleteRequest'), "BoQ Request Deleted successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteRequestImage(ProjectTurnkeyRequestImageGet $request)
    {
        try {
            $image = ProjectWorkRequestImage::find($request->id);
            if (Storage::exists($image->getRawOriginal('image'))) {
                Storage::delete($image->getRawOriginal('image'));
                /*
                    Delete Multiple files this way
                    Storage::delete(['upload/test.png', 'upload/test2.png']);
                */
            }
            $deleteImage = $image->delete();
            return $this->apiSuccess(compact('deleteImage'), "Request Image Deleted successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function overAllCost(GetOverAllCostUser $request)
    {
        try {
            $userId = $request->user_id;
            $project = ProjectTurnkeyContractor::with([
                'projectWorkType' => fn ($q) => $q->with([
                    'workType',
                ])
                    ->withWhereHas('application', fn ($q) => $q->where('user_id', $userId))
                    ->withSum([
                        'application as over_all_cost' => fn ($q) => $q->where('user_id', $userId)
                    ], 'over_all_total')

            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->where('user_id', $userId)], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('user_id', $userId)], 'over_all_total')
                ->whereId($request->id)
                ->first();

            return $this->apiSuccess(compact('project'), "Project Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function costSummery(CostSummeryGet $request)
    {
        try {
            $summery = ProjectWorkRequestApplication::with([
                'workRequest' => fn ($q) => $q->with('item', 'itemCategory', 'unit', 'itemDetail', 'itemBrandSpecification')
            ])
                ->where('project_work_type_application_id', $request->id)
                ->get();
            return $this->apiSuccess(compact('summery'), "Summery Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
