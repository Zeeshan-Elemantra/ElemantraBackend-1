<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Brand Specification</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Brand Specification</li>
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
                    <h5>Add Brand Specification</h5>
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group">
                            <label for="work_type_id">Work Type</label>
                            <select name="work_type_id" id="work_type_id" class="form-control">
                                <option value="">Select Work Item</option>
                                @foreach ($workTypes as $workType)
                                    <option value="{{ $workType->id }}">{{ $workType->name }}</option>
                                @endforeach
                            </select>
                            <span class="text-danger error-text item_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="item_id">Items</label>
                            <select name="item_id" id="item_id" class="form-control">
                                {{-- <option value="">Select Work Item</option> --}}
                                {{-- @foreach ($items as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach --}}
                            </select>
                            <span class="text-danger error-text item_id_err"></span>
                        </div>



                        <div class="form-group">
                            <label for="item_category_id">Item Category</label>
                            <select name="item_category_id" id="item_category_id" class="form-control">
                                {{-- <option value="">Select Item Category</option> --}}
                                {{-- @foreach ($item_categories as $item_category)
                                    <option value="{{ $item_category->id }}">{{ $item_category->name }}</option>
                                @endforeach --}}
                            </select>
                            <span class="text-danger error-text item_category_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="item_detail_id">Item Details</label>
                            <select name="item_detail_id" id="item_detail_id" class="form-control">
                                {{-- <option value="">Select Item Details</option> --}}
                                {{-- @foreach ($item_details as $item_detail)
                                    <option value="{{ $item_detail->id }}">{{ $item_detail->name }}</option>
                                @endforeach --}}
                            </select>
                            <span class="text-danger error-text item_detail_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" id="name" type="text" name="name">
                            <span class="text-danger error-text name_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="unit_id">Unit</label>
                            <select name="unit_id" id="unit_id" class="form-control">
                                <option value="">Select Unit</option>
                                @foreach ($units as $unit)
                                    <option value="{{ $unit->id }}">{{ $unit->name }}</option>
                                @endforeach
                            </select>
                            <span class="text-danger error-text unit_id_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" type="text" name="description" rows="5"></textarea>
                            <span class="text-danger error-text description_err"></span>
                        </div>

                        <div class="form-group">
                            <label for="rate">Rates</label>
                            <input class="form-control" id="rate" type="text" name="rate">
                            <span class="text-danger error-text rate_err"></span>
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
                        <button class="btn btn-primary" id="addToTable" type="button">Add Brand Specification</button>
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
                                    <th>Item Details</th>
                                    <th>Description</th>
                                    <th>Unit</th>
                                    <th>Rates</th>
                                    <th>Created at</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @foreach ($brand_specification as $n_key => $bs)
                                    <tr>
                                        <td>{{ $n_key + 1 }}</td>
                                        <td>{{ $bs->name }}</td>
                                        <td>{{ $bs->item->name }}</td>
                                        <td>{{ $bs->itemCategory->name }}</td>
                                        <td>{{ $bs->itemDetail->name }}</td>
                                        <td>{{ $bs->description }}</td>
                                        <td>{{ $bs->unit->name }}</td>
                                        <td>{{ $bs->rate }}</td>
                                        <td>
                                            {{ $bs->created_at ? date('d M, Y h:i A', strtotime($bs->created_at)) : '-' }}
                                        </td>
                                        <td class="text text-nowrap">
                                            <a href="{{ route('admin.brand_specification.edit', ['id' => $bs->id]) }}"
                                                class="btn btn-pill btn-outline-primary">Edit</a>
                                            <a href="#" type="button"
                                                class="btn btn-pill btn-outline-danger remove-brandSpecification" id=""
                                                data-id={{ $bs->id }}>Delete</a>
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
                    url: "{{ route('admin.add-brand-specification') }}",
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
                        $("#item_detail_id").empty();
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
                        $("#item_category_id").empty();
                        $("#item_detail_id").empty();
                        $("#item_category_id").append(
                            '<option value="">Select Item Category</option>');

                        $.each(response, function(key, value) {
                            $("#item_category_id").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });

            $("#item_category_id").change(function() {
                var item_category_id = $(this).val();

                $.ajax({
                    url: "{{ route('admin.item-details-of-category') }}",
                    data: {
                        item_category_id: item_category_id
                    },
                    method: "GET",
                    success: function(response) {
                        console.log(response);
                        $("#item_detail_id").empty();
                        $("#item_detail_id").append(
                            '<option value="">Select Item Category</option>');

                        $.each(response, function(key, value) {
                            $("#item_detail_id").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });

            $('.remove-brandSpecification').on('click', function() {
                // e.preventDefault();
                // var formData = new FormData(this);
                swal({
                        title: "Are you sure?",
                        text: "Once deleted, everything will deleted related to this brand!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).data('id');
                            $.ajax({
                                type: "POST",
                                url: 'brand_specification/' + id, //deleteUrl,
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
