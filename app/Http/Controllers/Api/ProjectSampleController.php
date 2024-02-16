<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use App\Models\UserProjectSample;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\UserProjectSampleImage;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Api\ProjectSampleAdd;
use App\Http\Requests\Api\ProjectSampleGet;
use App\Http\Requests\Api\ProjectSampleImageGet;
use App\Http\Requests\Api\ProjectSampleUpdate;

class ProjectSampleController extends Controller
{
    public function add(ProjectSampleAdd $request)
    {
        try {

            $requestedData = $request->safe()->only('name');
            $requestedData['user_id'] = Auth::id();
            $projectSample = UserProjectSample::create($requestedData);

            if ($request->has('images')) {
                foreach (json_decode($request->images) as $key => $image) {
                    $fileName = Auth::id() . '_' . uniqid();
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::PROJECT_SAMPLE->value);
                    $saveImage = UserProjectSampleImage::create(['user_project_sample_id' => $projectSample->id, 'image' => $path]);

                    // // Get filename with the extension
                    // $filenameWithExt = $image->getClientOriginalName();
                    // //Get just filename
                    // $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                    // // Get just ext
                    // $extension = $image->getClientOriginalExtension();
                    // // Filename to store
                    // $fileNameToStore = Auth::id() . '_' . $request->name . '.' . $extension;
                    // // Upload Image
                    // $path = $image->storeAs('public/project_sample', $fileNameToStore);

                    // $saveImage = UserProjectSampleImage::create(['user_project_sample_id' => $projectSample->id, 'image' => $path]);
                }
            }

            $project = UserProjectSample::whereId($projectSample->id)->with('images')->first();
            return $this->apiSuccess(compact('project'), "Project Sample added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getAllProjects()
    {
        try {
            $projects = UserProjectSample::with('images')->where('user_id', Auth::id())->get();
            return $this->apiSuccess(compact('projects'), "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getProject(ProjectSampleGet $request)
    {
        try {
            $project = UserProjectSample::whereId($request->id)->with('images')->first();
            return $this->apiSuccess(compact('project'), "Project Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function update(ProjectSampleUpdate $request)
    {
        try {

            $projectSample = UserProjectSample::find($request->id);
            $projectSample->name = $request->name;
            $projectSample->save();

            if ($request->has('images')) {
                foreach (json_decode($request->images) as $key => $image) {
                    $fileName = Auth::id() . '_' . uniqid();
                    $path = storeBase64Image($image, $fileName, MediaPathEnum::PROJECT_SAMPLE->value);
                    $saveImage = UserProjectSampleImage::create(['user_project_sample_id' => $projectSample->id, 'image' => $path]);
                }
            }

            $project = UserProjectSample::whereId($projectSample->id)->with('images')->first();
            return $this->apiSuccess(compact('project'), "Project Sample added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function deleteImage(ProjectSampleImageGet $request)
    {
        try {
            $delete = UserProjectSampleImage::destroy($request->id);
            return $this->apiSuccess(compact('delete'), "Image Deleted successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function delete(ProjectSampleGet $request)
    {
        try {
            $delete = UserProjectSample::destroy($request->id);
            return $this->apiSuccess(compact('delete'), "Project Deleted successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
