<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Labour Jobs</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Labour Jobs</li>
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
            <div class="card-body ">
                <div class="row">
                    <h5>Project Detail</h5>
                    <div class="table table-responsive">
                        <table class="table table-responsive">
                            <thead>
                                <th>Category</th>
                                <th>Address</th>
                                <th>User</th>
                                <th>Workin Days</th>
                                <th>Rate</th>
                                <th>Start Date</th>
                                <th>Handover Date</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <strong>{{ $project->workType->name }}</strong>
                                    </td>
                                    <td>
                                        @if ($project->address)
                                            {{ $project->address->room_no . ',' . $project->address->bldg_no . ',' . $project->address->address . ',' . $project->address->city . '-' . $project->address->pincode }}
                                        @else
                                            --
                                        @endif
                                    </td>
                                    <td>
                                        {{ $project->user ? $project->user->name : '---' }}
                                        <br>
                                        <small>
                                            <span
                                                class="badge rounded-pill badge-{{ \App\Enums\UserRoleEnum::from($project->user->role_id)->color() }}">
                                                {{ ucwords(str_replace('_', ' ', \App\Enums\UserRoleEnum::from($project->user->role_id)->label())) }}
                                            </span>
                                        </small>
                                    </td>
                                    <td class="text text-center">
                                        {{ $project->working_days }}
                                    </td>
                                    <td class="text text-end">
                                        <span>{{ $project->working_days }}(days) x ₹{{ $project->rate }} =
                                            <strong>₹{{ $project->total_rate }}</strong></span>
                                    </td>
                                    <td class="text text-center">
                                        {{ \Carbon\Carbon::parse($project->start_date)->format('d-M-Y') }}</td>
                                    <td class="text text-center">
                                        {{ \Carbon\Carbon::parse($project->handover_date)->format('d-M-Y') }}
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($project->assignedUser)
                    <div class="row mt-4 px-3">
                        <h5>Assigned User</h5>
                        <div class="card border border"
                            style="border-radius: 15px; border-color:blue; border-width: 10px;">
                            <div class="card-body p-3">
                                <div class="d-flex text-black">
                                    <div class="flex-shrink-0">
                                        <img src="{{ $project->assignedUser->profile }}"
                                            alt="Generic placeholder image" class="img-fluid"
                                            style="width: 180px; height:180px; border-radius: 10px;">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <h5 class="mb-1">{{ $project->assignedUser->name }}
                                            @if ($project->assignedUser->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
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
                    </div>
                @endif
                <div class="row mt-4">
                    <div class="default-according" id="parent-accordian-{{ $project->id }}">
                        <div class="card">
                            <div class="" id="application-accordian-{{ $project->id }}">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" data-bs-toggle="collapse"
                                        data-bs-target="#application-accordian-collapse-{{ $project->id }}"
                                        aria-expanded="true"
                                        aria-controls="application-accordian-{{ $project->id }}">Applications
                                        <a class="badge badge-secondary" href="#">
                                            {{ $project->application->count() }}</a></button>
                                </h5>
                            </div>
                            <div class="collapse @if ($project->application->isNotEmpty()) show @endif"
                                id="application-accordian-collapse-{{ $project->id }}"
                                aria-labelledby="application-accordian-{{ $project->id }}"
                                data-bs-parent="#parent-accordian-{{ $project->id }}">
                                <div class="card-body p-2">
                                    <div class="table table-responsive">
                                        <table class="table">
                                            <thead>
                                                <th>Sr.No</th>
                                                <th>Application Status</th>
                                                <th>Name</th>
                                                <th>Contact</th>
                                                <th>Email</th>
                                            </thead>
                                            <tbody>
                                                @forelse ($project->application as $key=>$application)
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
