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
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->

    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h5>Jobs</h5>
                </div>
                <div class="card-body pt-2">
                    <div>
                        <form action="{{ route('admin.labour-projects.index') }}" method="get">
                            @csrf
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input class="form-control" id="search" type="text" name="search"
                                            placeholder="Search project name, address, created user name,phone, ...."
                                            value="{{ request()->search }}">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select class="form-control selectpicker show-tick" multiple
                                            name="search_work_types[]" id="search_work_types" title="Select Category">
                                            @foreach ($workTypes as $key => $workType)
                                                <option value="{{ $workType->id }}"
                                                    @if (request()->has('search_work_types')) @selected(in_array($workType->id, request()->search_work_types)) @endif>
                                                    {{ $workType->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                {{-- <div class="col-md-2">
                                    <div class="form-group">
                                        <select class="form-control selectpicker show-tick" multiple
                                            name="search_property[]" id="search_property" title="Select Property">
                                            @foreach ($properties as $key => $property)
                                                <option value="{{ $property->id }}"
                                                    @if (request()->has('search_property')) @selected(in_array($property->id, request()->search_property)) @endif>
                                                    {{ $property->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div> --}}

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <select class="form-control selectpicker show-tick" multiple
                                            name="search_project_status[]" id="search_project_status"
                                            title="Select Status">
                                            @foreach ($projectStatuses as $key => $projectStatus)
                                                <option value="{{ $key }}"
                                                    @if (request()->has('search_project_status')) @selected(in_array($key, request()->search_project_status)) @endif>
                                                    {{ $projectStatus }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>


                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <a href="{{ route('admin.labour-projects.index') }}"
                                        class="btn btn-secondary">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="table-responsives">
                        <table class="table display"> <!-- id="example-style-1" -->
                            <thead class="text text-center">
                                <th>Project Name</th>
                                <th>Adddress</th>
                                <th>User</th>
                                <th>Work Days</th>
                                <th>Rate</th>
                                <th>Start Date</th>
                                <th>Handover Date</th>
                                <th>Project Status</th>
                                <th>Action</th>
                            </thead>

                            <tbody id="tableContainer">
                                @forelse ($labourProjects as $key =>$project)
                                    <tr>
                                        <td>{{ $project->name }}
                                            <br>
                                            <small>
                                                <span>
                                                    <strong>{{ $project->workType->name }}</strong>
                                                </span>
                                            </small>
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
                                            {{ \Carbon\Carbon::parse($project->handover_date)->format('d-M-Y') }}</td>
                                        <td class="text text-center">
                                            <span
                                                class="badge rounded-pill badge-{{ \App\Enums\ProjectStatusEnum::from($project->project_status)->color() }}">
                                                {{ \App\Enums\ProjectStatusEnum::from($project->project_status)->label() }}
                                            </span>
                                        </td>
                                        <td class="text text-center">
                                            <a href="{{ route('admin.labour-projects.show', ['labour_project' => $project->id]) }}"
                                                class="btn btn-pill btn-outline-primary btn-sm btn-air-primary ">View</a>
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                        <div class="mt-2">
                            {{ $labourProjects->links() }}
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
