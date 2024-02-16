<?php

namespace App\Http\Controllers\Admin;

use App\Models\HelpSupport;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;

class HelpSupportController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $helpSupports = HelpSupport::withWhereHas('user.role')->latest()->get();
        // dd($helpSupports->toArray());
        return view('admin.help-support-index',compact('helpSupports'));
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
    public function store(Request $request)
    {
        //
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
        $helpSupport = HelpSupport::with(['user'])->find($id);
        return view('admin.help-support-edit',compact('helpSupport'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $helpSupport = HelpSupport::find($id);
            $helpSupport->support_status = $request->support_status;
            $helpSupport->remark = $request->remark;
            $helpSupport->resolved_at = Carbon::now();
            $helpSupport->save();
            return to_route('admin.help-support.index')->with('success','Lead upated succesfully');
        } catch (\Exception $ex) {
            return redirect()->back()->with('error','Something Went Wrong');
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
