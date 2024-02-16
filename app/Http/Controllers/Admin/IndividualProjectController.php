<?php

namespace App\Http\Controllers\Admin;

use App\Models\PropertyType;
use Illuminate\Http\Request;
use App\Enums\ProjectStatusEnum;
use App\Http\Controllers\Controller;
use App\Models\ProjectIndividualContractor;
use App\Models\WorkType;

class IndividualProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $properties = PropertyType::all();
        $projectStatuses = ProjectStatusEnum::all();

        $individualProjects = ProjectIndividualContractor::whereHas('user')
            ->with(['user', 'propertyType', 'address'])
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
                fn ($q) => $q->whereIn('property_type_id', $request->search_property)
            )
            ->when(
                $request->search_project_status,
                fn ($q) => $q->whereIn('project_status', $request->search_project_status)
            )
            ->latest()
            ->paginate(10)->withQueryString();



        return view('admin.project-individual-index', compact('individualProjects', 'properties', 'projectStatuses'));
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
        $project = ProjectIndividualContractor::with([
            'projectWorkType' => fn ($q) => $q->with([
                'workRequest' => fn ($q) => $q->with('item', 'itemCategory', 'unit', 'itemDetail', 'itemBrandSpecification'),
                'workType',
                'assignedUser',
                'application' => fn ($q) => $q->with(['user']),
            ]),
        ])->find($id);
        // dd($project->toArray());
        return view('admin.project-individual-show', compact('project'));
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
