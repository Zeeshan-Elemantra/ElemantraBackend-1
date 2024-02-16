<?php

namespace App\Http\Controllers\Admin;

use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Controller;
use App\Models\ProjectTurnkeyContractor;
use App\Models\PropertyType;
use Illuminate\Http\Request;
use PhpParser\Builder\Property;

class TurnkeyProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        $turnkeyProjects = ProjectTurnkeyContractor::whereHas('user')->with(['user', 'propertyType', 'address'])
            ->when($request->search, function ($q) use ($request) {
                $q->where(function ($q) use ($request) {
                    $q->where('name', 'LIKE', '%' . $request->search . '%')
                        ->orWhereHas('address', function ($q) use ($request) {
                            $q->where('address', 'LIKE', '%' . $request->search . '%')
                                ->orWhere('city', 'LIKE', '%' . $request->search . '%')
                                ->orWhere('pincode', 'LIKE', '%' . $request->search . '%');
                        })
                        ->orWhereHas('user', function ($q) use ($request) {
                            $q->where('name', 'LIKE', '%' . $request->search . '%')
                                ->orWhere('phone', 'LIKE', '%' . $request->search . '%');
                        });
                });
            })
            ->when(
                $request->search_property,
                fn ($q) => $q->whereIn('property_type_id',$request->search_property)
            )
            ->when(
                $request->search_project_status,
                fn ($q) => $q->whereIn('project_status',$request->search_project_status)
            )
            ->latest()
            ->paginate(10)->withQueryString();
            $properties = PropertyType::all();
            $projectStatuses = ProjectStatusEnum::all();
        return view('admin.project-turnkey-index', compact('turnkeyProjects','properties','projectStatuses'));
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
        $project = ProjectTurnkeyContractor::with([
            'projectWorkType' => fn ($q) => $q->with([
                'workRequest' => fn ($q) => $q->with('item', 'itemCategory', 'unit', 'itemDetail', 'itemBrandSpecification'),
                'workType'
            ]),
            'assignedUser' => fn ($q) => $q->with(['userWorkType'])->getOverAllRate(),
        ])->find($id);
        // dd($project->toArray());
        return view('admin.project-turnkey-show', compact('project'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
