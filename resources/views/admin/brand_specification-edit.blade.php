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
                    <h5>Add Brand Specification</h5>
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
                    <h5>Brand Specification : {{ $brandSpecification->name }}</h5>
                    {{-- <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Brand Specification</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div> --}}
                </div>
                <div class="card-body pt-2">
                    <form class="form-wizard" action="{{route('admin.brand_specification.update',['id'=>$brandSpecification->id])}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="work_type_id">Work Type</label>
                                    <select name="work_type_id" id="work_type_id" class="form-control">
                                        <option value="">Select Work Item</option>
                                        @foreach ($workTypes as $workType)
                                            <option value="{{ $workType->id }}" @selected($workType->id == $brandSpecification->workType->id)>
                                                {{ $workType->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('work_type_id')
                                        <span class="text-danger error-text work_type_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="item_id">Items</label>
                                    <select name="item_id" id="item_id" class="form-control">

                                        @foreach ($items as $item)
                                            <option value="{{ $item->id }}" @selected($item->id == $brandSpecification->item->id)>
                                                {{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('item_id')
                                        <span class="text-danger error-text item_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="item_category_id">Item Category</label>
                                    <select name="item_category_id" id="item_category_id" class="form-control">
                                        {{-- <option value="">Select Item Category</option> --}}
                                        @foreach ($itemCategories as $itemCategory)
                                            <option value="{{ $itemCategory->id }}" @selected($itemCategory->id == $brandSpecification->itemCategory->id)>
                                                {{ $itemCategory->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('item_category_id')
                                        <span
                                            class="text-danger error-text item_category_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="item_detail_id">Item Details</label>
                                    <select name="item_detail_id" id="item_detail_id" class="form-control">
                                        {{-- <option value="">Select Item Details</option> --}}
                                        @foreach ($itemDetails as $itemDetail)
                                            <option value="{{ $itemDetail->id }}" @selected($itemDetail->id == $brandSpecification->itemDetail->id)>
                                                {{ $itemDetail->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('item_detail_id')
                                        <span class="text-danger error-text item_detail_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input class="form-control" id="name" type="text" name="name"
                                        value="{{ $brandSpecification->name }}">
                                    @error('name')
                                        <span class="text-danger error-text name_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="unit_id">Unit</label>
                                    <select name="unit_id" id="unit_id" class="form-control">
                                        <option value="">Select Unit</option>
                                        @foreach ($units as $unit)
                                            <option value="{{ $unit->id }}" @selected($brandSpecification->unit->id == $unit->id)>
                                                {{ $unit->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('unit_id')
                                        <span class="text-danger error-text unit_id_err">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" type="text" name="description" rows="5">{{ $brandSpecification->description }}</textarea>
                            @error('description')
                                <span class="text-danger error-text description_err">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="rate">Rates</label>
                            <input class="form-control" id="rate" type="text" name="rate"
                                value="{{ $brandSpecification->rate }}">
                            @error('rate')
                                <span class="text-danger error-text rate_err">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Update</button>
                                <a href="{{ route('admin.brand_specification') }}"
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

        });
    </script>

</x-admin.layout>
