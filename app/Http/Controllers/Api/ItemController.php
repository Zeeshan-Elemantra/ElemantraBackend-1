<?php

namespace App\Http\Controllers\Api;

use App\Enums\ProjectModelEnum;
use App\Models\Item;
use App\Models\WorkType;
use App\Models\ItemDetails;
use App\Models\ItemCategory;
use Illuminate\Http\Request;
use App\Enums\ProjectTypeEnum;
use App\Http\Requests\Api\ItemsGet;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\ItemBrandSpecification;
use App\Http\Requests\Api\WorkDetailsGet;
use App\Http\Requests\Api\ItemsDetailsGet;
use App\Http\Requests\Api\ItemsCategoryGet;
use App\Http\Requests\Api\ItemsDescription;
use App\Http\Requests\Api\ItemsBrandSpecificationsGet;

class ItemController extends Controller
{
    public function get(ItemsGet $request)
    {
        try {
            $items = Item::where('work_type_id', $request->id)->get();
            return $this->apiSuccess(compact('items'), "Items Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getItemCategory(ItemsCategoryGet $request)
    {
        try {
            $itemCategory = ItemCategory::where('item_id', $request->id)->get();
            return $this->apiSuccess(compact('itemCategory'), "Items Category Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getItemDetails(ItemsDetailsGet $request)
    {
        try {
            $itemDetails = ItemDetails::where(['item_id', $request->id_id], ['item_category_id', $request->id_category_id])->get();
            return $this->apiSuccess(compact('itemDetails'), "Items Details Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getItemBrandSpecifications(ItemsBrandSpecificationsGet $request)
    {
        try {
            $itemBrandSpecification = ItemBrandSpecification::where(
                ['item_id', $request->id_id],
                ['item_category_id', $request->id_category_id],
                ['item_detail_id', $request->id_detail_id]
            )->get();
            return $this->apiSuccess(compact('itemBrandSpecification'), "Items Brand Specification Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function getWorkDetails(WorkDetailsGet $request)
    {
        try {
            $workDetails = WorkType::with('items.itemCategory.itemDetails.brandSpecification.unit')->get();
            // return $this->apiSuccess(compact('workDetails'), "Items Brand Specification Fetched successfully");
            if ($request->has('id') && $request->has('project_type_id')) {

                $projectType = $request->project_type_id;
                $projectModel = null;

                if ($projectType == ProjectTypeEnum::TURNKEY_CONTRACTOR->value) {
                    $projectModel = ProjectModelEnum::TURNKEY_CONTRACTOR->value;
                } elseif ($projectType == ProjectTypeEnum::INDIVIDUAL_CONTRACTOR->value) {
                    $projectModel = ProjectModelEnum::INDIVIDUAL_CONTRACTOR->value;
                }

                $workDetails = WorkType::whereDoesntHave(
                    'projectWorkType',
                    fn ($q) => $q->where('project_id', $request->id)
                        ->where('project_type', $projectModel)
                        ->when($request->project_work_type_id, fn ($q) => $q->whereNot('id', $request->project_work_type_id))
                )
                    ->with('items.itemCategory.itemDetails.brandSpecification.unit')
                    ->get();
            }

            return $this->apiSuccess(compact('workDetails'), "Items Brand Specification Fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
