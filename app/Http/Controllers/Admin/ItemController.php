<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\WorkType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class ItemController extends Controller
{
    public function index()
    {
        $items = Item::with('work_type')->latest()->get();
        $work_types = WorkType::where('status', 1)->latest()->get();

        return view('admin.work_items', compact('items', 'work_types'));
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
        }
        else {
            return response()->json(['error' => $validator->errors()]);
        }
    }
}
