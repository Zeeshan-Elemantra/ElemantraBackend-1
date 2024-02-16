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
                    <h3>Users</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Users</li>
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
            <div class="card">
                <div class="card-header">
                    <h5>Users</h5>

                </div>
                <div class="card-body pt-2">
                    <div>
                        <form action="{{ route('admin.users.index') }}" method="get">
                            @csrf
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        {{-- <label for="name">Name</label> --}}
                                        <input class="form-control" id="search" type="text" name="search"
                                            placeholder="Search name, phone, email ...."
                                            value="{{ request()->search }}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <select class="form-control selectpicker" name="search_role" id="search_role"
                                            title="Select Role">
                                            {{-- <option >--- Select Role ---</option> --}}
                                            @foreach ($roles as $key => $role)
                                                <option value="{{ $role->id }}" @selected(request()->search_role == $role->id)>
                                                    {{ $role->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <a href="{{ route('admin.users.index') }}" class="btn btn-secondary">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="table-responsives">
                        <table class="table display"> <!-- id="example-style-1" -->
                            <thead>
                                <tr>
                                    <td>Sr No</td>
                                    <th>Name</th>
                                    <th>Work Preference</th>
                                    <th>Phone</th>
                                    <th>Alt Phone</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th class="text text-center">Profile-wise Count</th>
                                    <th>Created at</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @forelse ($users as $key =>$user)

                                    <tr>
                                        <td>{{ $users->firstItem() + $loop->index }}</td>
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
                                            <br>
                                            <strong><small>#{{ $user->id }}</small></strong>
                                        </td>
                                        <td>
                                            @if ($user->userPropertyType->isNotEmpty())
                                                {{ $user->userWorkType[0]->workType->name }}
                                            @else
                                                ---
                                            @endif
                                        </td>
                                        <td>{{ $user->phone }}</td>
                                        <td>{{ $user->alt_phone }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td class="text-center">

                                            @if ($user->role)
                                                <span
                                                    class="badge rounded-pill badge-{{ \App\Enums\UserRoleEnum::from($user->role_id)->color() }}">
                                                    {{ ucwords(str_replace('_', ' ', \App\Enums\UserRoleEnum::from($user->role_id)->label())) }}
                                                </span>
                                            @else
                                                ---
                                            @endif
                                        </td>
                                        <td class="text text-nowrap">
                                            @if ($user->created_projects_count->isNotEmpty())
                                                <div class="btn-group m-0" id="hover-dropdown">
                                                    <button type="button"
                                                        class="btn btn-pill btn-outline-primary btn-sm btn-air-primary dropdown-toggle"
                                                        data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">Hire Work &emsp;<a
                                                            class="badge badge-light text-dark"
                                                            href="#">{{ $user->created_projects_count['projects'] }}</a></button>
                                                    <div class="dropdown-menu">
                                                        <ul class="list-group">
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Projects
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->created_projects_count['projects'] }}</span>
                                                            </li>
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Recieved Application
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->created_projects_count['recieved_application'] }}</span>
                                                            </li>
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Accepted
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->created_projects_count['accepted'] }}</span>
                                                            </li>
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Assigned
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->created_projects_count['assigned'] }}</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            @endif

                                            @if ($user->applied_projects_count->isNotEmpty())
                                                <div class="btn-group m-0" id="hover-dropdown">
                                                    <button type="button"
                                                        class="btn btn-pill btn-outline-primary btn-sm btn-air-primary dropdown-toggle"
                                                        data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">Find Work &emsp;<a
                                                            class="badge badge-light text-dark"
                                                            href="#">{{ $user->applied_projects_count['applied'] }}</a></button>
                                                    <div class="dropdown-menu">
                                                        <ul class="list-group">
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Applied
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->applied_projects_count['applied'] }}</span>
                                                            </li>
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Accepted
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->applied_projects_count['accepted'] }}</span>
                                                            </li>
                                                            <li
                                                                class="list-group-item d-flex justify-content-between align-items-center text-dark">
                                                                Assigned
                                                                <span
                                                                    class="badge badge-primary counter">{{ $user->applied_projects_count['assigned'] }}</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            @endif
                                        </td>
                                        <td>{{ \Carbon\Carbon::parse($user->created_at)->format('d,M Y') }}</td>
                                        <td>
                                            <a href="{{ route('admin.users.show', ['user' => $user->id]) }}"
                                                class="btn btn-pill btn-outline-primary btn-sm btn-air-primary ">View</a>
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                        <div class="mt-2">
                            {{ $users->links() }}
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
