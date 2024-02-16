<?php

namespace App\Http\Controllers\Api\Individual;

use App\Enums\ApplicationStatusEnum;
use App\Models\BudgetRange;
use Illuminate\Support\Str;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;

use Illuminate\Support\Carbon;
use App\Enums\ProjectModelEnum;
use App\Models\ProjectWorkType;
use App\Enums\ProjectStatusEnum;
use App\Models\ProjectWorkRequest;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectLabourContractor;
use App\Models\ProjectWorkRequestImage;
use Illuminate\Support\Facades\Storage;
use App\Models\ProjectIndividualContractor;
use App\Http\Requests\Api\ProjectIndividualAdd;
use App\Http\Requests\Api\ProjectIndividualGet;
use App\Http\Requests\Api\ProjectIndividualUpdate;
use App\Http\Requests\Api\ProjectIndividualRequestAdd;
use App\Http\Requests\Api\ProjectIndividualRequestGet;
use App\Http\Requests\Api\ProjectIndividualRequestUpdate;
use App\Http\Requests\Api\ProjectIndividualRequestImageGet;

class ProjectIndividualController extends Controller
{
    public function addProject(ProjectIndividualAdd $request)
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
            $projectData['project_type_id'] = ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value;
            $project = ProjectIndividualContractor::create($projectData);
            //address
            $addressData = $request->project_address;
            $addressData['project_type_id'] = ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value;
            $projectAddress = $project->address()->create($addressData);

            return $this->apiSuccess(null, "Project Created Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function updateProject(ProjectIndividualUpdate $request)
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
            $project = ProjectIndividualContractor::whereId($request->id)->update($projectData);
            //address
            $addressData = $request->project_address;
            $addressData['project_type_id'] = ProjectTypeEnum::TURNKEY_CONTRACTOR->value;
            $projectAddress = ProjectIndividualContractor::find($request->id)->address()->update($addressData);

            return $this->apiSuccess(compact('project'), "Project Updated Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function addRequest(ProjectIndividualRequestAdd $request)
    {
        try {
            //create or get boq
            $project = ProjectIndividualContractor::whereId($request->project_id)->first();

            $projectWorkType = $project->projectWorkType()->updateOrCreate([
                'project_type_id' => ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value,
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
            $projectWorkRequestData['project_type'] = ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value;
            $projectWorkRequestData['project_type_id'] = ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value;

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

    public function updateRequest(ProjectIndividualRequestUpdate $request)
    {
        try {
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
            $projectRequest->save();

            if ($request->has('sample_image') ) {
                foreach (json_decode($request->sample_image) as $key => $image) {
                    $fileName = Str::replaceFirst('#', '', $projectRequest->unique_request_id) . '_' . uniqid();
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::WORK_REQUEST_IMAGE->value);
                    $projectRequest->images()->create(['image' => $path]);
                }
            }

            if($request->quantity != $projectRequest->quantity){

                if($projectRequest->applicationRequest->isNotEmpty()){
                    $projectRequest->applicationRequest->each(function($requestApplication,$key)use($request){
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

    public function deleteProject(ProjectIndividualGet $request)
    {
        try {
            $project = ProjectIndividualContractor::destroy($request->id);
            return $this->apiSuccess(compact('project'), "Project Deleted Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }



    public function getAllProjects()
    {
        try {
            $projects = ProjectIndividualContractor::where('user_id', Auth::id())->with('projectWorkType', 'workRequest', 'address')->get();
            return $this->apiSuccess($projects, "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
    public function getProject(ProjectIndividualGet $request)
    {
        try {
            $project = ProjectIndividualContractor::with([
                'propertyType', 'address', 'budgetRange',
                'projectWorkType' => fn ($q) => $q->with([
                    'assignedUser' => fn ($q) => $q->withAvg('reviewRatings', 'rating'),
                    'workType',
                    'workRequest' => fn ($q) => $q->with('itemCategory')->latest(),
                    'application' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                ])->withSum([
                    'application as over_all_cost' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)
                ], 'over_all_total')->latest()
            ])
                ->withSum(['application as over_all_rate' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)], 'sub_total')
                ->withSum(['application as over_all_cost' => fn ($q) => $q->where('application_status', (string)ApplicationStatusEnum::ASSIGNED->value)], 'over_all_total')
                ->whereId($request->id)
                ->first();

            return $this->apiSuccess($project, "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getRequest(ProjectIndividualRequestGet $request)
    {
        try {
            $workRequest = ProjectWorkRequest::whereId($request->id)
                ->with('projectWorkType.workType', 'item', 'itemCategory', 'itemDetail', 'itemBrandSpecification', 'unit', 'images')
                ->first();
            return $this->apiSuccess($workRequest, "Request Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteRequest(ProjectIndividualRequestGet $request)
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

    public function myProjects()
    {
        try {
            $projects = ProjectLabourContractor::with('workType', 'address')->where('user_id', Auth::id())->latest()->get();
            return $this->apiSuccess(compact('projects'), "Projects Fetched Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteRequestImage(ProjectIndividualRequestImageGet $request)
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

    public function submitProject(ProjectIndividualGet $request)
    {
        //live the project
        try {
            $project = ProjectIndividualContractor::find($request->id);
            $update = $project->update([
                'project_status' => (string)ProjectStatusEnum::LIVE->value,
                'live_at' => Carbon::now()
            ]);
            return $this->apiSuccess(compact('project'), "Project Live Successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
