<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Help Support</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Help Support</li>
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
                    <h5>Contact Request</h5>
                    {{-- <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Budget</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div> --}}

                </div>
                <div class="card-body pt-2">

                    <div class="table table-bordered table-responsives">
                        <table class="table table-responsives"> <!-- id="example-style-1" -->
                            <thead class="border border">
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Alt Phone</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Problem At</th>
                                <th>Feedback</th>
                                <th>Remark</th>
                                <th>Requested At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </thead>

                            <tbody id="tableContainer">
                                @forelse ($helpSupports as $key =>$help)
                                    <tr>
                                        <td>{{ $help->user->name }}</td>
                                        <td>{{ $help->user->phone }}</td>
                                        <td>{{ $help->user->alt_phone }}</td>
                                        <td>{{ $help->user->email }}</td>
                                        <td class="text-center">
                                            <span
                                                class="badge badge-{{ App\Enums\UserRoleEnum::from($help->user->role_id)->color() }}">{{ App\Enums\UserRoleEnum::from($help->user->role_id)->label() }}</span>
                                        </td>
                                        <td>{{ $help->app_interface }}</td>
                                        <td>{{ $help->feedback }}</td>
                                        <td>{{$help->remark}}</td>
                                        <td>
                                            {{ \Carbon\Carbon::parse($help->requested_at)->format('d-M-Y, h:m a') }}
                                        </td>
                                        <td>
                                            <span
                                                class="badge badge-{{ \App\Enums\HelpSupportEnum::from($help->support_status)->color() }}">
                                                {{ \App\Enums\HelpSupportEnum::from($help->support_status)->label() }}
                                            </span>
                                        </td>
                                        <td class="text text-center">
                                            <a href="{{ route('admin.help-support.edit', ['help_support' => $help->id]) }}"
                                                class="btn btn-pill btn-outline-primary btn-sm btn-air-primary ">Update</a>
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                        {{-- <div class="mt-2">
                            {{ $users->links() }}
                        </div> --}}
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
