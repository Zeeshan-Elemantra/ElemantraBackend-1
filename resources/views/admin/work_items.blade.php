<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Work Items</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Work Items</li>
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
                    <h5>Add Work Item</h5>
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="work_type_id">Work Type</label>
                            <select name="work_type_id" id="work_type_id" class="form-control">
                                <option value="">Select Work Type</option>
                                @foreach ($work_types as $work_type)
                                    <option value="{{ $work_type->id }}">{{ $work_type->name }}</option>
                                @endforeach
                            </select>
                            <span class="text-danger error-text work_type_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" id="name" type="text" name="name">
                            <span class="text-danger error-text name_err"></span>
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
                    <h5>Work Items</h5>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Work Item</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div>
                </div>
                <div class="card-body pt-2">
                    <div class="table-responsives" style="overflow-x:auto;">
                        <table class="display" id="example-style-1">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Name</th>
                                    <th>Work Type</th>
                                    <th>Created at</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @foreach ($work_items as $n_key => $work_item)
                                    <tr>
                                        <td>{{ $n_key + 1 }}</td>
                                        <td>{{ $work_item->name }}</td>
                                        <td>{{ $work_item->workType->name ?? '---' }}</td>
                                        <td>
                                            {{ $work_item->created_at ? date('d M, Y h:i A', strtotime($work_item->created_at)) : '-' }}
                                        </td>
                                        <td class="text text-nowrap">
                                            <a href="{{ route('admin.work_items.edit', ['id' => $work_item->id]) }}"
                                                class="btn btn-pill btn-outline-primary">Edit</a>
                                            <a href="#" type="button"
                                                class="btn btn-pill btn-outline-danger remove-workItem" id=""
                                                data-id={{ $work_item->id }}>Delete</a>
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

            $("#addForm").submit(function(e) {

                e.preventDefault();

                var formData = new FormData(this);

                $.ajax({
                    type: "POST",
                    url: "{{ route('admin.add-work-item') }}",
                    data: formData,
                    success: function(obj) {
                        // result = $.parseJSON(obj);
                        result = obj;
                        if (result.response == 'y') {
                            alert(result.message);
                            location.reload();
                        } else {
                            resetErrors();
                            printErrMsg(result.error);
                            // alert(result.message);
                        }
                    },
                    contentType: false,
                    processData: false,
                    error: function(data) {

                        alert('failed');
                    }
                });
            });

            function resetErrors() {
                var form = document.getElementById('addForm');
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

            $('.remove-workItem').on('click', function() {
                // e.preventDefault();
                // var formData = new FormData(this);
                swal({
                        title: "Are you sure?",
                        text: "Once deleted, you will not be able to this work item or its related category will deleted!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).data('id');
                            $.ajax({
                                type: "POST",
                                url: 'work_items/' + id, //deleteUrl,
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
