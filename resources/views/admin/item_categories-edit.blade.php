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
                    <h5>Add Item Category</h5>
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
                    <h5>Item Categories : {{ $itemCategory->name }}</h5>
                    {{-- <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Add Item Category</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div> --}}
                </div>
                <div class="card-body pt-2">
                    <form class="form-wizard" action="{{route('admin.item_categories.update',['id'=>$itemCategory->id])}}"  method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="work_type">Work Category</label>
                                    <select name="work_type" id="work_type" class="form-control selectpicker"
                                        data-size=5>
                                        <option value="">Select Work Category</option>
                                        @foreach ($workTypes as $workType)
                                            <option value="{{ $workType->id }}" @selected($itemCategory->workType->id == $workType->id)>
                                                {{ $workType->name }}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-danger error-text work_type_err"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="work_item">Work Item</label>
                                    <select name="work_item" id="work_item" class="form-control selectpicker"
                                        title="select work item">
                                        @foreach ($items as $item)
                                            <option value="{{ $item->id }}" @selected($itemCategory->item->id == $item->id)>
                                                {{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-danger error-text work_item_err"></span>
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" id="name" type="text" name="name" value="{{$itemCategory->name}}">
                            <span class="text-danger error-text name_err"></span>
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Update</button>
                                {{-- <input class="btn btn-secondary" id="reset" type="reset" value="Reset"> --}}
                                <a href="{{route('admin.item_categories')}}" class="btn btn-outline-secondary">Cancel</a>
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

        });
    </script>

</x-admin.layout>
