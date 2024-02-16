<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Turnkey Jobs</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Turnkey Jobs</li>
                        <li class="breadcrumb-item active">Details</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->
    <div class="row" id="addContainer" style="display: none;">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header pb-0">
                    <h5>Add Budget</h5>
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" id="name" type="text" name="name">
                            <span class="text-danger error-text name_err"></span>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="min">Min (₹)</label>
                                    <input class="form-control" id="min" type="number" name="min">
                                    <span class="text-danger error-text min_err"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="max">Max (₹)</label>
                                    <input class="form-control" id="max" type="number" name="max">
                                    <span class="text-danger error-text max_err"></span>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Add</button>
                                <input class="btn btn-secondary" id="reset" type="reset" value="Reset">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="row">
        <div class="card card-absolute">
            <div class="card-header bg-light">
                <h5 class="text-white">
                    <h5>{{ $project->name }} &emsp;<span
                            class="badge badge-{{ App\Enums\ProjectStatusEnum::from($project->project_status)->color() }}">{{ $project->project_status_text }}</span>
                    </h5>
                </h5>

            </div>
            <div class="card-body">
                @if ($project->assignedUser)
                    <div class="card border border" style="border-radius: 15px; border-color:blue; border-width: 10px;">
                        <div class="card-body p-3">
                            <div class="d-flex text-black">
                                <div class="flex-shrink-0">
                                    <img src="{{ $project->assignedUser->profile }}" alt="Generic placeholder image"
                                        class="img-fluid" style="width: 180px; height:180px; border-radius: 10px;">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-1">{{ $project->assignedUser->name }}
                                        @if ($project->assignedUser->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                            <span class="" style="display: inline-block; vertical-align: middle;">
                                                <svg width="40" height="20">
                                                    <image
                                                        xlink:href="{{ asset('admin/assets/images/logo/elemantra_verified.svg') }}"
                                                        width="40" height="20" />
                                                </svg>
                                            </span>
                                        @endif
                                    </h5>
                                    <p class="mb-2 pb-1" style="color: #2b2a2a;">
                                        @if (!$project->assignedUser->userWorkType->empty())
                                            {{ $project->assignedUser->userWorkType[0]->workType->name }}
                                        @else
                                            ---
                                        @endif
                                    </p>
                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Email :
                                        {{ $project->assignedUser->email }}
                                    </p>
                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Contact No :
                                        {{ $project->assignedUser->phone }}</p>
                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Alt Contact No :
                                        {{ $project->assignedUser->alt_phone }}
                                        {{-- <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
                                        style="background-color: #efefef;">
                                        <div>
                                            <p class="small text-muted mb-1">Rating</p>
                                            <p class="mb-0">
                                                {{ $project->assignedUser->review_ratings_avg_rating ?? 0 }}
                                            </p>
                                        </div>
                                    </div> --}}
                                        {{-- <div class="d-flex pt-1">
                                        <button type="button"
                                            class="btn btn-outline-primary me-1 flex-grow-1">Chat</button>
                                        <button type="button" class="btn btn-primary flex-grow-1">Follow</button>
                                    </div> --}}
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <ul class="nav nav-pills nav-primary" id="myTab" role="tablist">
                    @forelse ($project->projectWorkType as $key => $projectWT)
                        <li class="nav-item"><a class="nav-link @if ($loop->first) active @endif"
                                id="home-tab" data-bs-toggle="tab" href="#project-work-type-{{ $projectWT->id }}"
                                role="tab" aria-controls="project-work-type-{{ $projectWT->id }}"
                                aria-selected="true">{{ $projectWT->workType->name }}
                                <span
                                    class="badge rounded-pill badge-secondary">{{ $projectWT->workRequest->count() }}</span></a>
                        </li>
                    @empty
                    @endforelse
                </ul>

                <div class="tab-content" id="myTabContent">
                    @forelse ($project->projectWorkType as $key => $projectWT)
                        <div class="tab-pane fade show @if ($loop->first) active @endif"
                            id="project-work-type-{{ $projectWT->id }}" role="tabpanel"
                            aria-labelledby="project-work-type-{{ $projectWT->id }}-tab">
                            <div class="card">
                                <h4 class="m-2">BoQ's</h4>
                                <div class="table table-responsive">
                                    <table class="table">
                                        <thead>
                                            <th>Sr.No</th>
                                            <th>Unique Id</th>
                                            <th>Item Name</th>
                                            <th>Item Category</th>
                                            <th>Item Details</th>
                                            <th>Brand Specification</th>
                                            <th>Description</th>
                                            <th>Unit</th>
                                            <th>Floor Plan</th>
                                        </thead>
                                        <tbody>
                                            @forelse ($projectWT->workRequest as $key=>$boqRequest)
                                                <tr>
                                                    <td>{{ $loop->index + 1 }}</td>
                                                    <td>
                                                        {{$boqRequest->unique_request_id}}
                                                    </td>
                                                    <td>
                                                        @if ($boqRequest->item)
                                                            {{ $boqRequest->item->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($boqRequest->itemCategory)
                                                            {{ $boqRequest->itemCategory->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($boqRequest->itemDetail)
                                                            {{ $boqRequest->itemDetail->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($boqRequest->itemBrandSpecification)
                                                            {{ $boqRequest->itemBrandSpecification->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>

                                                    <td>
                                                        {{ $boqRequest->item_description }}
                                                    </td>

                                                    <td>
                                                        @if ($boqRequest->unit)
                                                            {{ $boqRequest->unit->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <a href="{{$boqRequest->floor_plan_file}}">view</a>
                                                    </td>
                                                </tr>
                                            @empty
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    @empty
                    @endforelse
                </div>


            </div>
        </div>

    </div>
    <!-- Data ends -->
    <script>
        $(document).ready(function() {

            $("#addToTable").click(function() {
                $("#addContainer").slideDown();
                $(this).hide();
                $("#btnCancel").show();
            });

            $("#btnCancel").click(function() {
                $("#addContainer").slideUp();
                $(this).hide();
                $("#addToTable").show();
            });


            function resetErrors(formName) {
                var form = document.getElementById(formName);
                var data = new FormData(form);
                for (var [key, value] of data) {
                    console.log(key, value)
                    $('.' + key + '_err').text('');
                }
            }

            function printErrMsg(msg) {
                $.each(msg, function(key, value) {
                    console.log(key);
                    $('.' + key + '_err').text(value);
                });
            }

            $("#reset").click(function() {
                resetErrors();
            });


        });
    </script>
</x-admin.layout>
