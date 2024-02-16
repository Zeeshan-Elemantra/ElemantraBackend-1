<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WorkType;
use Illuminate\Support\Facades\Validator;

class WorkItemController extends Controller
{
    public function index()
    {
        $work_items = Item::withWhereHas('workType')->latest()->get();
        $work_types = WorkType::where('status', 1)->latest()->get();

        return view('admin.work_items', compact('work_items', 'work_types'));
    }

    public function store(Request $request)
    {
        $work_type_id = $request->work_type_id ?? NULL;
        $name = $request->name ?? NULL;

        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'work_type_id' => 'required',
            ],
        );

        if ($validator->passes()) {
            $store = Item::create([
                'work_type_id' => $work_type_id,
                'name' => $name,
            ]);

            if (!$store) {
                return [
                    'error' => true,
                    'response' => 'n',
                    'message' => 'Failed Adding Work Item'
                ];
            }

            return [
                'error' => false,
                'response' => 'y',
                'message' => 'Work Item Added Successfully',
            ];
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }


    public function edit($id)
    {
        $item = Item::find($id);
        $workTypes = WorkType::latest()->get();
        return view('admin.work_items-edit', compact('workTypes', 'item'));
    }


    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'work_type_id' => 'required',
            'name' => 'required',
        ]);

        $item = Item::whereId($id)->update([
            'work_type_id' => $request->work_type_id,
            'name' => $request->name
        ]);
        return to_route('admin.work_items')->with('success', 'Item updated successfully');
    }

    public function destroy($id)
    {
        try {
            $item  = Item::destroy($id);
            return $this->ajaxSuccess(null, 'Deleted successfully', 500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully', null, 500);
        }
    }


    public function itemsOfCategory(Request $request)
    {
        $work_type_id = $request->work_type_id ?? NULL;
        $validator = Validator::make(
            $request->all(),
            [
                'work_type_id' => 'required',
            ],
        );

        if ($validator->passes()) {
            $items = Item::where('work_type_id', $work_type_id)->get();
            return response()->json($items);
        } else {
            return response()->json(['error' => $validator->errors()]);
        }
    }
}
