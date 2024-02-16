<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Elemantra Verifications</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Elemantra Verifications</li>
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
        <div class="col-sm-12">
            <div class="card card-body pb-0">
                <div class="">
                    <form action="{{ route('admin.elemantra-verification.index') }}" method="get">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    {{-- <label for="name">Name</label> --}}
                                    <input class="form-control" id="search" type="text" name="search"
                                        placeholder="Search name, phone ...." value="{{ request()->search }}">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="{{ route('admin.elemantra-verification.index') }}"
                                    class="btn btn-secondary">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>

                {{-- <div class="table-responsives">
                        <table class="table display"> <!-- id="example-style-1" -->
                            <thead>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Alt Phone</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Requested At</th>
                                <th>Status</th>
                                <th>Completed</th>
                                <th>KYC</th>
                                <th>Action</th>
                            </thead>

                            <tbody id="tableContainer">
                                @forelse ($requestedUsers as $key =>$user)
                                    <tr>
                                        <td>
                                            {{ $user->name }}
                                            @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                                <span style="display: inline-block; vertical-align: middle;">
                                                    <svg width="40" height="18">
                                                        <image
                                                            xlink:href="{{ asset('admin/assets/images/logo/elemantra_verified.svg') }}"
                                                            width="40" height="18" />
                                                    </svg>
                                                </span>
                                            @endif

                                        </td>
                                        <td>{{ $user->phone }}</td>
                                        <td>{{ $user->alt_phone }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td class="text-center">
                                            <span
                                                class="badge badge-{{ \App\Enums\UserRoleEnum::from($user->role_id)->color() }}">{{ \App\Enums\UserRoleEnum::from($user->role_id)->label() }}</span>
                                        </td>
                                        <td>{{ \Carbon\Carbon::parse($user->verification_requested_at)->format('d,M Y') }}
                                        </td>

                                        <td>
                                            <span
                                                class="badge @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::PENDING->value) badge-primary @elseif($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value) badge-success @endif">
                                                {{ \App\Enums\ElemantraVerificationEnum::from($user->elemantra_verification)->label() }}
                                            </span>
                                        </td>

                                        <td>
                                            <div class="progress-showcase">
                                                <div class="progress mt-2" data-bs-toggle="tooltip"
                                                    data-bs-placement="bottom"
                                                    title="{{ round($user->verification_process_percent) }}%">
                                                    <div class="progress-bar-animated bg-{{ ['primary', 'secondary', 'info', 'success'][array_rand(['primary', 'secondary', 'info', 'success'], 1)] }} progress-bar-striped"
                                                        role="progressbar"
                                                        style="width: {{ $user->verification_process_percent }}%"
                                                        aria-valuenow="{{ $user->verification_process_percent }}"
                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>

                                            </div>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin.users.kyc.show', ['user_id' => $user->id]) }}"
                                                class="btn btn-sm btn-primary">Kyc Details</a>
                                        </td>
                                        <td class="text text-center text-nowrap">
                                            <a href="{{ route('admin.elemantra-verification.show', ['elemantra_verification' => $user->id]) }}"
                                                class="btn btn-sm btn-primary">Verifcation Process</a>
                                            @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                                <a href="{{ route('admin.review.view', ['user_id' => $user->id]) }}"
                                                    class="btn btn-sm btn-secondary">Add Review</a>
                                            @endif
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                        <div class="mt-2">
                            {{ $requestedUsers->links() }}
                        </div>
                    </div> --}}
            </div>

            <div class="card card-body">
                <div class="row">
                    @forelse ($requestedUsers as $key =>$user)
                        <div class="col-xxl-4 col-lg-6">
                            <div class="project-box"><span
                                    class="badge badge-{{ \App\Enums\ElemantraVerificationEnum::from($user->elemantra_verification)->color() }}">{{ \App\Enums\ElemantraVerificationEnum::from($user->elemantra_verification)->label() }}</span>
                                <h6>{{ $user->name }}
                                    @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                        <span style="display: inline-block; vertical-align: middle;">
                                            <svg width="40" height="18">
                                                <image
                                                    xlink:href="{{ asset('admin/assets/images/logo/elemantra_verified.svg') }}"
                                                    width="40" height="18" />
                                            </svg>
                                        </span>
                                    @endif
                                </h6>
                                <div class="media m-0"><img class="img-20 me-2 rounded-circle"
                                        src="{{ $user->profile }}" alt="" data-original-title="" title="">
                                    <div class="media-body">
                                        <p><strong>{{ ucwords(str_replace('_', ' ', \App\Enums\UserRoleEnum::from($user->role_id)->label())) }}</strong>
                                        </p>
                                    </div>
                                </div>
                                {{-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> --}}
                                <div class="row pt-1">
                                    <div class="col-4">
                                        <h6>Phone</h6>
                                        <p class="text-muted">{{ $user->phone ?? '---' }}</p>
                                    </div>
                                    <div class="col-4">
                                        <h6>Email</h6>
                                        <p class="text-muted">{{ $user->email ?? '---' }}</p>
                                    </div>

                                    <div class="col-4">
                                        <h6>KYC Detail</h6>
                                        <a href="{{ route('admin.elemantra-verification.kyc.show', ['user_id' => $user->id]) }}"
                                            class="btn btn-pill btn-outline-primary btn-xs w-100">View</a>
                                    </div>
                                </div>
                                <div class="project-status mt-2">
                                    <div class="media mb-0">
                                        <p>{{ $user->verification_process_percent ? round($user->verification_process_percent) : 0 }}%
                                        </p>
                                        <div class="media-body text-end"><span>
                                                @if ($user->elemantra_verification == (string) \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                                    Done
                                                @else
                                                    In-Process
                                                @endif
                                            </span></div>
                                    </div>
                                    <div class="progress" style="height: 5px">
                                        <div class="progress-bar-animated bg-{{ ['primary', 'secondary', 'info', 'success'][array_rand(['primary', 'secondary', 'info', 'success'], 1)] }} progress-bar-striped"
                                            role="progressbar"
                                            style="width: {{ round($user->verification_process_percent) }}%"
                                            aria-valuenow="{{ round($user->verification_process_percent) }}"
                                            aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="text-center mt-2">
                                        <div class="row align-items-start">
                                            <div class="col-md-6">
                                                <a href="{{ route('admin.elemantra-verification.show', ['elemantra_verification' => $user->id]) }}"
                                                    class="btn btn-pill btn-outline-primary btn-xs w-100">Verifcation
                                                    Process</a>
                                            </div>
                                            @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                                <div class="col-md-6">
                                                    <a href="{{ route('admin.review.view', ['user_id' => $user->id]) }}"
                                                        class="btn btn-pill btn-outline-primary btn-xs w-100">Add
                                                        Review</a>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @empty
                    @endforelse
                    <div class="">
                        {{ $requestedUsers->links() }}
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
