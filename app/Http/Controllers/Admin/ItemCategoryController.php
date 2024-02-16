<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\ItemCategory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WorkType;
use Illuminate\Support\Facades\Validator;

class ItemCategoryController extends Controller
{
    public function index()
    {
        $workTypes = WorkType::withWhereHas('items')->latest()->get();
        $item_categories = ItemCategory::whereHas('item')->whereHas('workType')
            ->with(['item', 'workType'])
            ->latest()->get();

        return view('admin.item_categories', compact('item_categories', 'workTypes'));
    }

    public function store(Request $request)
    {
        $work_item = $request->work_item ?? NULL;
        $name = $request->name ?? NULL;

        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'work_item' => 'required',
            ],
        );
        $item = Item::find($work_item);
        if ($validator->passes()) {
            $store = ItemCategory::create([
                'work_type_id' => $item->workType->id,
                'item_id' => $work_item,
                'name' => $name,
            ]);

            if (!$store) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Failed Adding Item Category'
                ];
            }

            return [
                'error' => false,
                'response' => 'y',
                'message' => 'Item Category Added Successfully',
            ];
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }





    public function edit($id)
    {
        $workTypes = WorkType::withWhereHas('items')->latest()->get();
        $itemCategory = ItemCategory::find($id);
        $items = Item::where('work_type_id', $itemCategory->workType->id)->get();
        return view('admin.item_categories-edit', compact('itemCategory', 'workTypes', 'items'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'work_type' => 'required',
            'work_item' => 'required',
            'name' => 'required',
        ]);

        $category = ItemCategory::whereId($id)->update([
            'work_type_id' => $request->work_type,
            'item_id' => $request->work_item,
            'name' => $request->name,
        ]);

        return to_route('admin.item_categories')->with('success', 'Category updated successfully');
    }
    public function destroy($id)
    {
        try {
            $item  = ItemCategory::destroy($id);
            return $this->ajaxSuccess(null, 'Deleted successfully', 500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully', null, 500);
        }
    }
}
