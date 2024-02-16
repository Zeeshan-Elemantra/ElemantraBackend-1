<?php

namespace App\Http\Controllers\Admin;

use App\Models\WorkType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\WorkTypeStore;
use Illuminate\Support\Facades\Validator;

class WorkTypeController extends Controller
{
    public function index()
    {
        $work_types = WorkType::latest()->get();

        return view('admin.work_types', compact('work_types'));
    }

    public function store(request $request)
    {

        $validator = $request->validate([
            'name' => 'required|string',
        ]);
        $workType = WorkType::create([
            'name' => $request->name,
        ]);
        return redirect()->back()->with('success', $workType->name . ' Created successfully');
    }

    public function edit(string $id)
    {
        $workType = WorkType::find($id);
        return view('admin.work_types-edit',compact('workType'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $workTypeUpdate= WorkType::whereId($id)->update([
            'name'=>$request->name
        ]);
        return to_route('admin.work_types.index')->with('success','Work Type updated succesfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            //code...
            $workType = WorkType::destroy($id);
            return $this->ajaxSuccess(null,'Deleted successfully',500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully',null,500);
        }

    }
}
