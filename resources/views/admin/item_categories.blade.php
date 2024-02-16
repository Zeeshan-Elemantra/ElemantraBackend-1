<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Item Categories</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Item Categories</li>
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
                    <h5>Add Item Category</h5>
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="work_type">Work Category</label>
                                    <select name="work_type" id="work_type" class="form-control selectpicker"
                                        data-size=5>
                                        <option value="">Select Work Category</option>
                                        @foreach ($workTypes as $workType)
                                            <option value="{{ $workType->id }}">{{ $workType->name }}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-danger error-text work_type_err"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="work_item">Work Item</label>
                                    <select name="work_item" id="work_item" class="form-control selectpicker"
                                        title="select work item"></select>
                                    <span class="text-danger error-text work_item_err"></span>
                                </div>
                            </div>
                        </div>

                        {{-- <div class="form-group">
                            <label for="item_id">Work Item</label>
                            <select name="item_id" id="item_id" class="form-control">
                                <option value="">Select Work Item</option>
                                @foreach ($items as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                            <span class="text-danger error-text item_id_err"></span>
                        </div> --}}

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
                    <h5>Item Categories</h5>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Item Category</button>
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
                                    <th>Created at</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="tableContainer">
                                @foreach ($item_categories as $n_key => $item_category)
                                    <tr>
                                        <td>{{ $n_key + 1 }}</td>
                                        <td>{{ $item_category->name }}</td>
                                        <td>{{ $item_category->item->name }}</td>
                                        <td>
                                            {{ $item_category->created_at ? date('d M, Y h:i A', strtotime($item_category->created_at)) : '-' }}
                                        </td>
                                        <td class="text text-nowrap">
                                            <a href="{{ route('admin.item_categories.edit', ['id' => $item_category->id]) }}"
                                                class="btn btn-pill btn-outline-primary">Edit</a>
                                            <a href="#" type="button"
                                                class="btn btn-pill btn-outline-danger remove-workItem" id=""
                                                data-id={{ $item_category->id }}>Delete</a>
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
                    url: "{{ route('admin.add-item-category') }}",
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

        });
    </script>
    <script>
        $(document).ready(function() {
            var workTypes = @json($workTypes);
            console.log(workTypes);
            $('#work_type').on('change', function() {
                var items = workTypes.find(wt => wt.id == $(this).val()).items;
                $('#work_item').empty();
                items.forEach(item => {
                    $('#work_item').append('<option value="' + item.id + '">' + item.name +
                        '</option>')
                });
                $('#work_item').selectpicker('refresh');
            });

            $('.remove-workItem').on('click', function() {
                // e.preventDefault();
                // var formData = new FormData(this);
                swal({
                        title: "Are you sure?",
                        text: "Once deleted, other related data also delete!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).data('id');
                            $.ajax({
                                type: "POST",
                                url: 'item_categories/' + id, //deleteUrl,
                                data: {
                                    '_token': "{{ csrf_token() }}",
                                    '_method': 'DELETE'
                                },
                                success: function(obj) {
                                    swal("Category deleted successfully!", {
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
