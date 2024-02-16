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
                        <li class="breadcrumb-item active">Edit</li>
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
                </div>
                <div class="card-body pt-2">
                    <form class="form-wizard"
                        action="{{ route('admin.item_details.update', ['id' => $itemDetail->id]) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="work_type_id">Work Types</label>
                                    <select name="work_type_id" id="work_type_id" class="form-control">
                                        <option value="">Select Work Item</option>
                                        @foreach ($workTypes as $workType)
                                            <option value="{{ $workType->id }}" @selected($workType->id == $itemDetail->workType->id)>
                                                {{ $workType->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('work_type_id')
                                        <span class="text-danger error-text work_type_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="item_id">Work Item</label>
                                    <select name="item_id" id="item_id" class="form-control">
                                        @forelse ($items as $key=>$item)
                                            <option value="{{ $item->id }}" @selected($itemDetail->item->id == $item->id)>
                                                {{ $item->name }}</option>
                                        @empty
                                        @endforelse
                                    </select>

                                    @error('item_id')
                                        <span class="text-danger error-text item_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="item_category_id">Item Category</label>
                                    <select name="item_category_id" id="item_category_id" class="form-control">
                                        @forelse ($itemCategories as $key=>$itemCategory)
                                            <option value="{{ $itemCategory->id }}" @selected($itemDetail->itemCategory->id == $itemCategory->id)>
                                                {{ $itemCategory->name }}</option>
                                        @empty
                                        @endforelse
                                    </select>
                                    @error('item_category_id')
                                        <span
                                            class="text-danger error-text item_category_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" id="name" type="text" name="name"
                                value="{{ $itemDetail->name }}">
                            @error('name')
                                <span class="text-danger error-text name_err">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Update</button>
                                {{-- <input class="btn btn-secondary" id="reset" type="reset" value="Reset"> --}}
                                <a href="{{ route('admin.item_details') }}"
                                    class="btn btn-outline-secondary">Cancel</a>
                            </div>
                        </div>
                    </form>
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

        });
    </script>

</x-admin.layout>
