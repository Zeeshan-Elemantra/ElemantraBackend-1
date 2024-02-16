<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\ItemDetails;
use App\Models\ItemCategory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ItemBrandSpecification;
use Illuminate\Support\Facades\Validator;
use App\Models\Unit;
use App\Models\WorkType;

class ItemBrandSpecificationController extends Controller
{
    public function index()
    {
        $brand_specification = ItemBrandSpecification::whereHas('item')->whereHas('workType')->whereHas('itemDetail')->whereHas('itemCategory')
            ->with(['item', 'itemCategory', 'itemDetail', 'unit'])->latest()->get();
        $items = Item::where('status', 1)->latest()->get();
        $item_categories = ItemCategory::where('status', 1)->latest()->get();
        $item_details = ItemDetails::latest()->get();
        $units = Unit::where('status', 1)->latest()->get();
        $workTypes = WorkType::all();
        return view('admin.brand_specification', compact('brand_specification', 'workTypes', 'items', 'item_categories', 'item_details', 'units'));
    }

    public function store(Request $request)
    {
        $work_type_id = $request->work_type_id ?? NULL;
        $item_id = $request->item_id ?? NULL;
        $item_category_id = $request->item_category_id ?? NULL;
        $item_detail_id = $request->item_detail_id ?? NULL;
        $name = $request->name ?? NULL;
        $description = $request->description ?? NULL;
        $unit_id = $request->unit_id ?? NULL;
        $rate = $request->rate ?? NULL;

        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'work_type_id' => 'required',
                'item_id' => 'required',
                'item_category_id' => 'required',
                'description' => 'required',
                'unit_id' => 'required',
                'rate' => 'required',
            ],
        );

        if ($validator->passes()) {
            $store = ItemBrandSpecification::create([
                'work_type_id' => $work_type_id,
                'item_id' => $item_id,
                'item_category_id' => $item_category_id,
                'item_detail_id' => $item_detail_id,
                'name' => $name,
                'description' => $description,
                'unit_id' => $unit_id,
                'rate' => $rate,
            ]);

            if (!$store) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Failed Adding Brand Specification'
                ];
            }

            return [
                'error' => false,
                'response' => 'y',
                'message' => 'Brand Specification Added Successfully',
            ];
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }

    public function edit($id)
    {
        $brandSpecification = ItemBrandSpecification::find($id);
        $items = Item::whereHas('workType', fn ($q) => $q->where('id', $brandSpecification->workType->id))->get();
        $itemCategories = ItemCategory::whereHas('item', fn ($q) => $q->where('id', $brandSpecification->item->id))->get();
        $itemDetails = ItemDetails::whereHas('itemCategory', fn ($q) => $q->where('id', $brandSpecification->itemCategory->id))->get();
        $units = Unit::where('status', 1)->latest()->get();
        $workTypes = WorkType::all();
        return view('admin.brand_specification-edit', compact('brandSpecification', 'items', 'itemCategories', 'itemDetails', 'units', 'workTypes'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'work_type_id' => 'required',
            'item_id' => 'required',
            'item_category_id' => 'required',
            'description' => 'required',
            'unit_id' => 'required',
            'rate' => 'required',
        ]);

        $brandSpecification = ItemBrandSpecification::whereId($id)->update([
            'work_type_id' => $request->work_type_id,
            'item_id' => $request->item_id,
            'item_category_id' => $request->item_category_id,
            'item_detail_id' => $request->item_detail_id,
            'name' => $request->name,
            'description' => $request->description,
            'unit_id' => $request->unit_id,
            'rate' => $request->rate,
        ]);

        return to_route('admin.brand_specification')->with('success', 'Specification updated successfully');
    }

    public function destroy($id)
    {
        try {
            $brand = ItemBrandSpecification::destroy($id);
            return $this->ajaxSuccess(null, 'Deleted successfully', 500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully', null, 500);
        }
    }
}
