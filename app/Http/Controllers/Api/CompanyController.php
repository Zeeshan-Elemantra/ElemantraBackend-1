<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\UserCompany;
use App\Enums\MediaPathEnum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\CompanyAdd;
use App\Http\Requests\Api\CompanyUpdate;

class CompanyController extends Controller
{
    public function add(CompanyAdd $request)
    {

        try {
            $requestedData = $request->safe()->only('name', 'address', 'gst', 'about');

            $requestedData['user_id'] = Auth::id();
            $company = UserCompany::create($requestedData);

            if ($request->hasFile('work_recommendation')) {
                $fileName = Auth::id() . '_' . $request->name;
                $path = storeFilePdf($request->file('work_recommendation'),$fileName,MediaPathEnum::WORK_RECOMMENDATION->value);
                $company->work_recommendation = $path;
            }
            $company->save();
            return $this->apiSuccess($company, "Company added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function update(CompanyUpdate $request)
    {
        try {
            $requestedData = $request->safe()->only('name', 'address', 'gst', 'about');
            $company = UserCompany::find($request->id);//->update($requestedData);
            $company->name = $request->name;
            $company->address = $request->address;
            $company->gst = $request->gst;
            $company->about = $request->about;

            // if ($request->hasFile('work_recommendation')) {
            //     $fileName = Auth::id() . '_' . $request->name;
            //     $path = storeFilePdf($request->file('work_recommendation'),$fileName,MediaPathEnum::WORK_RECOMMENDATION->value);

            //     $company->work_recommendation = $path;
            //     $company->save();
            // }

            if ($request->hasFile('work_recommendation')) {
                $fileName = $fileName = Auth::id() . '_' . $request->name;
                $path = storeFilePdf($request->file('work_recommendation'), $fileName, MediaPathEnum::WORK_RECOMMENDATION->value);
                $company->work_recommendation = $path;
            }
            $company->save();
            return $this->apiSuccess($company, "Company Updated successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

}
