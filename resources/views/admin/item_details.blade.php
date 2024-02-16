<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Item Details</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Item Details</li>
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
                    <h5>Add Item Details</h5>
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="work_type_id">Work Types</label>
                            <select name="work_type_id" id="work_type_id" class="form-control">
                                <option value="">Select Work Item</option>
                                @foreach ($workTypes as $workType)
                                    <option value="{{ $workType->id }}">{{ $workType->name }}</option>
                                @endforeach
                            </select>
                            <span class="text-danger error-text work_type_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="item_id">Work Item</label>
                            <select name="item_id" id="item_id" class="form-control">
                                {{-- <option value="">Select Work Item</option>
                                @foreach ($items as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach --}}
                            </select>
                            <span class="text-danger error-text item_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="item_category_id">Item Category</label>
                            <select name="item_category_id" id="item_category_id" class="form-control">
                                {{-- <option value="">Select Item Category</option> --}}
                            </select>
                            <span class="text-danger error-text item_category_id_err"></span>
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
                    <h5>Item Details</h5>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Item Details</button>
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
                                    <th>Work Item</th>
                                    <th>Item Category</th>
                                    <th>Created at</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @foreach ($item_details as $n_key => $item_detail)
                                    <tr>
                                        <td>{{ $n_key + 1 }}</td>
                                        <td>{{ $item_detail->name }}</td>
                                        <td>{{ $item_detail->item->name }}</td>
                                        <td>{{ $item_detail->itemCategory->name }}</td>
                                        <td>
                                            {{ $item_detail->created_at ? date('d M, Y h:i A', strtotime($item_detail->created_at)) : '-' }}
                                        </td>
                                        <td class="text text-nowrap">
                                            <a href="{{ route('admin.item_details.edit', ['id' => $item_detail->id]) }}"
                                                class="btn btn-pill btn-outline-primary">Edit</a>
                                            <a href="#" type="button"
                                                class="btn btn-pill btn-outline-danger remove-itemDetail" id=""
                                                data-id={{ $item_detail->id }}>Delete</a>
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
                    url: "{{ route('admin.add-item-detail') }}",
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
                    error: function() {
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

            $("#work_type_id").change(function() {
                var work_type_id = $(this).val();

                $.ajax({
                    url: "{{ route('admin.work-items-of-category') }}",
                    data: {
                        work_type_id: work_type_id
                    },
                    method: "GET",
                    success: function(response) {
                        $("#item_id").empty();
                        $("#item_category_id").empty();
                        // $("#item_detail_id").empty();
                        $("#item_id").append(
                            '<option value="">Select Item</option>');
                        $.each(response, function(key, value) {
                            $("#item_id").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });


            $("#item_id").change(function() {
                var item_id = $(this).val();

                $.ajax({
                    url: "{{ route('admin.get-item-categories') }}",
                    data: {
                        item_id: item_id
                    },
                    method: "GET",
                    success: function(response) {
                        console.log(response);

                        $("#item_category_id").empty();
                        $("#item_category_id").append(
                            '<option value="">Select Item Category</option>');

                        $.each(response, function(key, value) {
                            $("#item_category_id").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });

            $('.remove-itemDetail').on('click', function() {
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
                                url: 'item_details/' + id, //deleteUrl,
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
