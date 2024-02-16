<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\BudgetRangeStore;
use App\Http\Requests\Admin\BudgetRangeUpdate;
use App\Models\BudgetRange;
use Illuminate\Contracts\Session\Session;
use Illuminate\Http\Request;

class BudgetRangeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $bugetRanges = BudgetRange::all();
        return view('admin.budget-range-index', compact('bugetRanges'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(BudgetRangeStore $request)
    {
        try {
            $budget = BudgetRange::create($request->safe()->only('name', 'min', 'max'));
            return $this->ajaxSuccess(compact('budget'), "Project Created Successfully");
        } catch (\Exception $ex) {
            return $this->ajaxError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $budget = BudgetRange::find($id);
        return view('admin.budget-range-edit', compact('budget'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(BudgetRangeUpdate $request, string $id)
    {
        try {
            $budget = BudgetRange::find($id);
            if ($budget) {
                $budget->update($request->safe()->only('name', 'min', 'max'));
                return to_route('admin.budget-ranges.index')->with('success', 'Budget Range Updated Successfully');
            }
            return redirect()->back()->with('error', 'Something Went Wrong');
        } catch (\Exception $ex) {
            return redirect()->back()->with('error', 'Something Went Wrong');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $brand = BudgetRange::destroy($id);
            return $this->ajaxSuccess(null, 'Deleted successfully', 500);
        } catch (\Exception $ex) {
            return $this->ajaxError('Deleted successfully', null, 500);
        }
    }
}
