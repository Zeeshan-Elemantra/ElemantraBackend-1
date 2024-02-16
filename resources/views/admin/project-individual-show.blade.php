<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Individual Jobs</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Individual Jobs</li>
                        <li class="breadcrumb-item active">Details</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->

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
            <div class="card-body px-1 pb-1">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    @forelse ($project->projectWorkType as $key => $projectWT)
                        <li class="nav-item"><a class="nav-link @if ($loop->first) active @endif"
                                id="home-tab" data-bs-toggle="tab" href="#project-work-type-{{ $projectWT->id }}"
                                role="tab" aria-controls="project-work-type-{{ $projectWT->id }}"
                                aria-selected="true">
                                {{ $projectWT->workType->name }}
                                <span
                                    class="badge badge-{{ App\Enums\WorkTypeStatusEnum::from($projectWT->category_status)->color() }}">{{ $projectWT->category_status_text }}</span>
                                <br>

                            </a>
                        </li>
                    @empty
                    @endforelse
                </ul>

                <div class="tab-content" id="myTabContent">
                    @forelse ($project->projectWorkType as $key => $projectWT)
                        <div class="tab-pane fade show @if ($loop->first) active @endif"
                            id="project-work-type-{{ $projectWT->id }}" role="tabpanel"
                            aria-labelledby="project-work-type-{{ $projectWT->id }}-tab">

                            @if ($projectWT->assignedUser)
                                <div class="row mt-4 px-3">
                                    <h5>Assigned User</h5>
                                    <div class="card border border"
                                        style="border-radius: 15px; border-color:blue; border-width: 10px;">
                                        <div class="card-body p-3">
                                            <div class="d-flex text-black">
                                                <div class="flex-shrink-0">
                                                    <img src="{{ $projectWT->assignedUser->profile }}"
                                                        alt="Generic placeholder image" class="img-fluid"
                                                        style="width: 180px; height:180px; border-radius: 10px;">
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    <h5 class="mb-1">{{ $projectWT->assignedUser->name }}
                                                        @if ($projectWT->assignedUser->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                                            <span class=""
                                                                style="display: inline-block; vertical-align: middle;">
                                                                <svg width="40" height="20">
                                                                    <image
                                                                        xlink:href="{{ asset('admin/assets/images/logo/elemantra_verified.svg') }}"
                                                                        width="40" height="20" />
                                                                </svg>
                                                            </span>
                                                        @endif
                                                    </h5>
                                                    <p class="mb-2 pb-1" style="color: #2b2a2a;">
                                                        @if (!$projectWT->assignedUser->userWorkType->empty())
                                                            {{ $projectWT->assignedUser->userWorkType[0]->workType->name }}
                                                        @else
                                                            ---
                                                        @endif
                                                    </p>
                                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Email :
                                                        {{ $projectWT->assignedUser->email }}
                                                    </p>
                                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Contact No :
                                                        {{ $projectWT->assignedUser->phone }}</p>
                                                    <p class="mb-2 pb-1" style="color: #2b2a2a;"> Alt Contact No :
                                                        {{ $projectWT->assignedUser->alt_phone }}

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <div class="card">
                                <div class="default-according" id="parent-accordian-{{ $projectWT->id }}">
                                    <div class="card">
                                        <div class="" id="application-accordian-{{ $projectWT->id }}">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse"
                                                    data-bs-target="#application-accordian-collapse-{{ $projectWT->id }}"
                                                    aria-expanded="true"
                                                    aria-controls="application-accordian-{{ $projectWT->id }}">Applications
                                                    <a class="badge badge-secondary" href="#">
                                                        {{ $projectWT->application->count() }}</a></button>
                                            </h5>
                                        </div>
                                        <div class="collapse @if ($projectWT->application->isNotEmpty()) show @endif"
                                            id="application-accordian-collapse-{{ $projectWT->id }}"
                                            aria-labelledby="application-accordian-{{ $projectWT->id }}"
                                            data-bs-parent="#parent-accordian-{{ $projectWT->id }}">
                                            <div class="card-body p-2">
                                                <div class="table table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <th>Sr.No</th>
                                                            <th>Application Status</th>
                                                            <th>Name</th>
                                                            <th>Contact</th>
                                                            <th>Email</th>
                                                            <th class="text-center">Over All Cost</th>

                                                        </thead>
                                                        <tbody>
                                                            @forelse ($projectWT->application as $key=>$application)
                                                                <tr>
                                                                    <td>{{ $loop->index + 1 }}</td>

                                                                    <td>
                                                                        <span
                                                                            class="badge badge-{{ App\Enums\ApplicationStatusEnum::from($application->application_status)->color() }}">{{ $application->application_status_text }}</span>
                                                                    </td>
                                                                    <td>
                                                                        @if ($application->user)
                                                                            {{ $application->user->name }}
                                                                        @else
                                                                            ---
                                                                        @endif
                                                                    </td>
                                                                    <td>
                                                                        @if ($application->user)
                                                                            {{ $application->user->phone }}
                                                                        @else
                                                                            ---
                                                                        @endif
                                                                    </td>
                                                                    <td>
                                                                        @if ($application->user)
                                                                            {{ $application->user->email }}
                                                                        @else
                                                                            ---
                                                                        @endif
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <strong>₹{{ $application->over_all_total ?? 0 }}</strong>
                                                                    </td>

                                                                </tr>
                                                            @empty
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="" id="boq-accordian-{{ $projectWT->id }}">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse"
                                                    data-bs-target="#boq-accordian-collapse-{{ $projectWT->id }}"
                                                    aria-expanded="true"
                                                    aria-controls="boq-accordian-{{ $projectWT->id }}">BoQ's <a
                                                        class="badge badge-secondary" href="#">
                                                        {{ $projectWT->workRequest->count() }}</a></button>
                                            </h5>
                                        </div>
                                        <div class="collapse @if ($projectWT->application->isEmpty()) show @endif"
                                            id="boq-accordian-collapse-{{ $projectWT->id }}"
                                            aria-labelledby="boq-accordian-{{ $projectWT->id }}"
                                            data-bs-parent="#parent-accordian-{{ $projectWT->id }}">
                                            <div class="card-body p-2">
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
                                                                        {{ $boqRequest->unique_request_id }}
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
                                                                        <a href="{{ $boqRequest->floor_plan_file }}" target="_blank" class="btn btn-pill btn-outline-primary btn-sm btn-air-primary">View</a>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
