<x-admin.layout>
    <style>
        .btn-group:hover .dropdown-menu {
            display: block;
            margin-top: 0;
            /* Adjust the value based on your design */
        }
    </style>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Profile</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Users</li>
                        <li class="breadcrumb-item active">Profile</li>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="{{ $user->profile ?? 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp' }}"
                                alt="avatar" class="rounded img-fluid" style="width: 150px;">
                            <h5 class="my-3">{{ $user->name }}
                                @if ($user->elemantra_verification == \App\Enums\ElemantraVerificationEnum::VERIFIED->value)
                                    <span style="display: inline-block; vertical-align: middle;">
                                        <svg width="40" height="25">
                                            <image
                                                xlink:href="{{ asset('admin/assets/images/logo/elemantra_verified.svg') }}"
                                                width="45" height="25" />
                                        </svg>
                                    </span>
                                @endif
                            </h5>
                            <p class="text-muted mb-1">
                                @if ($user->userWorkType->isNotEmpty())
                                    {{ $user->userWorkType[0]->workType->name }}
                                @else
                                    ---
                                @endif
                            </p>
                            {{-- <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn btn-primary">Follow</button>
                                        <button type="button" class="btn btn-outline-primary ms-1">Message</button>
                                    </div> --}}
                        </div>
                    </div>
                    @if ($user->company)
                        <div class="card mb-4 mb-lg-0">
                            <div class="card-header pb-0">
                                <h2>Company Details</h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <p class="mb-0">Company Name</p>
                                    </div>
                                    <div class="col-sm-7">
                                        <p class="text-muted mb-0">{{ $user->company->name }}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <p class="mb-0">About</p>
                                    </div>
                                    <div class="col-sm-7">
                                        <p class="text-muted mb-0">{{ $user->company->about }}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <p class="mb-0">GST Number</p>
                                    </div>
                                    <div class="col-sm-7">
                                        <p class="text-muted mb-0">{{ $user->company->gst }}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <p class="mb-0">Addess</p>
                                    </div>
                                    <div class="col-sm-7">
                                        <p class="text-muted mb-0">{{ $user->company->address }}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <p class="mb-0">Work Recommendation</p>
                                    </div>
                                    <div class="col-sm-7">
                                        @if ($user->company->work_recommendation)
                                            <a href="{{ $user->company->work_recommendation }}" target="_blank"
                                                class="btn btn-pill btn-outline-success btn-sm">View</a>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ $user->name }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ $user->email }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ $user->phone }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Alt Mobile</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ $user->alt_phone }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Working Areas</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">
                                        {{ collect($user->userPropertyType->pluck('propertyType'))->pluck('name')->implode(',') }}
                                        @if ($user->userPropertyType->isNotEmpty())
                                        @else
                                            ---
                                        @endif
                                    </p>
                                </div>
                            </div>
                            {{-- <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
                                    </div>
                                </div> --}}

                        </div>
                    </div>

                    <div class="row">
                        <div class="card mb-lg-0">
                            <div class="card-header pb-0">
                                <h3>Sample Projects</h3>
                            </div>
                            <div class="card-body pt-0">
                                <div class="row">
                                    @forelse ($user->sampleProjects as $key =>$project)
                                        <div class="col-md-4">
                                            <div class="card">
                                                @if ($project->images->isNotEmpty())
                                                    {{-- <img src="{{ $project->images[0]->image }}" class="card-img-top"
                                                        alt="..."> --}}
                                                    <div id="carouselWorkSampleImage" class="carousel slide" data-bs-ride="carousel">

                                                        <div class="carousel-inner">
                                                            @forelse ($project->images as $key=>$image)
                                                                <div
                                                                    class="carousel-item @if ($key == 0) active @endif">
                                                                    <img src="{{ $image->image }}"
                                                                        class="d-block w-100" alt="">
                                                                </div>
                                                            @empty
                                                            @endforelse
                                                        </div>
                                                        <button class="carousel-control-prev" type="button"
                                                            data-bs-target="#carouselWorkSampleImage"
                                                            data-bs-slide="prev">
                                                            <span class="carousel-control-prev-icon"
                                                                aria-hidden="true"></span>
                                                            <span class="visually-hidden">Previous</span>
                                                        </button>
                                                        <button class="carousel-control-next" type="button"
                                                            data-bs-target="#carouselExample" data-bs-slide="next">
                                                            <span class="carousel-control-next-icon"
                                                                aria-hidden="true"></span>
                                                            <span class="visually-hidden">Next</span>
                                                        </button>
                                                    </div>
                                                @endif
                                                <div class="card-body">
                                                    <h5 class="card-title">{{ $project->name }}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    @empty
                                    @endforelse
                                    {{-- <div class="col-md-6">
                                        <div class="card mb-4 mb-md-0">
                                            <div class="card-body">
                                                <p class="mb-4"><span
                                                        class="text-primary font-italic me-1">assigment</span>
                                                    Project Status
                                                </p>
                                                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                <div class="progress rounded" style="height: 5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: 80%"
                                                        aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                                <div class="progress rounded" style="height: 5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: 72%"
                                                        aria-valuenow="72" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                <div class="progress rounded" style="height: 5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: 89%"
                                                        aria-valuenow="89" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                                <div class="progress rounded" style="height: 5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: 55%"
                                                        aria-valuenow="55" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                                <div class="progress rounded mb-2" style="height: 5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: 66%"
                                                        aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> --}}
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

        <script>
            $(document).ready(function() {
                $('#hover-dropdown').hover(
                    function() {
                        $(this).addClass('show');
                        $(this).find('.dropdown-menu').addClass('show');
                    },
                    function() {
                        $(this).removeClass('show');
                        $(this).find('.dropdown-menu').removeClass('show');
                    }
                );
            });
        </script>
</x-admin.layout>
