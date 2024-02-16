<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Budget Range</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Budget Range</li>
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
                    <h5>Brand Specification</h5>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Budget</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div>
                </div>
                <div class="card-body pt-2">
                    <div class="table-responsives">
                        <table class="table display" id="example-style-1">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Min</th>
                                    <th>Max</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @foreach ($bugetRanges as $key => $budget)
                                    <tr>
                                        <td>{{ $budget->name }}</td>
                                        <td>{{ $budget->min }}</td>
                                        <td>{{ $budget->max }}</td>
                                        <td>
                                            <a href="{{ route('admin.budget-ranges.edit', ['budget_range' => $budget->id]) }}"
                                                class="btn btn-pill btn-outline-primary btn-sm btn-air-primary ">Edit</a>

                                            {{-- <a type="button"
                                                class="btn btn-pill btn-outline-danger btn-sm btn-air-primary"
                                                data-budgetId="{{ $budget->id }}">Delete</a> --}}

                                            <a href="#" type="button"
                                                class="btn btn-pill btn-outline-danger remove-budgetRange"
                                                id="" data-id={{ $budget->id }}>Delete</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Data ends -->

    <!-- modals-->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- modals end-->
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

            $("#addForm").submit(function(e) {

                e.preventDefault();

                var formData = new FormData(this);

                $.ajax({
                    type: "POST",
                    url: "{{ route('admin.budget-ranges.store') }}",
                    data: formData,
                    success: function(data) {
                        console.log(data);
                        if (data.success) {
                            location.reload();
                        } else {
                            resetErrors('addForm');
                            printErrMsg(data.data);

                        }
                    },
                    contentType: false,
                    processData: false,
                    error: function(data) {
                        console.error(data);
                        alert('failed');
                    }
                });
            });

            $('.remove-budgetRange').on('click', function() {
                // e.preventDefault();
                // var formData = new FormData(this);
                swal({
                        title: "Are you sure?",
                        text: "Once deleted,",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).data('id');
                            $.ajax({
                                type: "POST",
                                url: 'budget-ranges/' + id, //deleteUrl,
                                data: {
                                    '_token': "{{ csrf_token() }}",
                                    '_method': 'DELETE'
                                },
                                success: function(obj) {
                                    swal("Work Type deleted successfully!", {
                                        icon: "success",
                                    });
                                    location.reload();
                                },
                                error: function() {
                                    willDelete = false;
                                    swal("Not Deleted");

                                }
                            });

                        } else {
                            swal("Not Deleted");
                        }
                    });
            });
        });
    </script>
</x-admin.layout>
