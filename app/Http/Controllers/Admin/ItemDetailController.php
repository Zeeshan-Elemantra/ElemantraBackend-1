<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\ItemDetails;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ItemCategory;
use App\Models\WorkType;
use Illuminate\Support\Facades\Validator;

class ItemDetailController extends Controller
{
    public function index()
    {
        $item_details = ItemDetails::whereHas('workType')
            ->whereHas('item')
            ->whereHas('itemCategory')
            ->with(['workType', 'item', 'itemCategory'])->latest()->get();
        $items = Item::whereHas('workType')->where('status', 1)->latest()->get();
        $workTypes = WorkType::all();
        return view('admin.item_details', compact('item_details', 'items', 'workTypes'));
    }

    public function get_item_categories(Request $request)
    {
        $item_id = $request->input('item_id');
        $item_categories = ItemCategory::where('item_id', $item_id)->get();

        return response()->json($item_categories);
    }

    public function store(Request $request)
    {
        $work_type_id = $request->work_type_id ?? NULL;
        $item_id = $request->item_id ?? NULL;
        $item_category_id = $request->item_category_id ?? NULL;
        $name = $request->name ?? NULL;

        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'work_type_id' => 'required',
                'item_id' => 'required',
                'item_category_id' => 'required',
            ],
        );

        if ($validator->passes()) {
            $store = ItemDetails::create([
                'work_type_id' => $work_type_id,
                'item_id' => $item_id,
                'item_category_id' => $item_category_id,
                'name' => $name,
            ]);

            if (!$store) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Failed Adding Item Details'
                ];
            }

            return [
                'error' => false,
                'response' => 'y',
                'message' => 'Item Details Added Successfully',
            ];
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }

    public function edit($id)
    {
        $itemDetail = ItemDetails::find($id);
        $workTypes = WorkType::latest()->get();
        $items = Item::whereHas('workType', fn ($q) => $q->where('id', $itemDetail->workType->id))->latest()->get();
        $itemCategories = ItemCategory::whereHas('item', fn ($q) => $q->where('id', $itemDetail->item->id))->get();
        // dd($itemCateories->toArray(),$workTypes->toArray(),$items->toArray());
        return view('admin.item_details-edit', compact('workTypes', 'itemDetail', 'items', 'itemCategories'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'work_type_id' => 'required',
            'item_id' => 'required',
            'item_category_id' => 'required',
        ]);

        $itemDetail = ItemDetails::whereId($id)->update([
            'work_type_id' => $request->work_type_id,
            'item_id' => $request->item_id,
            'item_category_id' => $request->item_category_id,
            'name' => $request->name,
        ]);

        return to_route('admin.item_details')->with('success', 'Item Detail updated successfully');
    }

    public function destroy($id)
    {
        try {
            $itemDetail = ItemDetails::destroy($id);
            return $this->ajaxSuccess(null, 'Deleted successfully', 500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully', null, 500);
        }
    }

    public function itemDetailsOfCategory(Request $request)
    {
        $item_category_id = $request->item_category_id ?? NULL;

        $validator = Validator::make(
            $request->all(),
            [
                'item_category_id' => 'required',
            ],
        );

        if ($validator->passes()) {
            $itemDetails = ItemDetails::where('item_category_id', $item_category_id)->get();
            return response()->json($itemDetails);
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }
}
