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
    <div class="card">
        <div class="header">
            <h4 class="m-4">Edit - {{ $budget->name }}</h4>
        </div>
        <div class="card-body">
            <ul>
                @forelse ($errors->all() as $message)
                    <li>
                        <span class="text text-danger">{{ $message }}</span>
                    </li>
                @empty
                @endforelse
            </ul>
            <form action="{{ route('admin.budget-ranges.update', ['budget_range' => $budget->id]) }}" method="post">
                @csrf
                @method('PUT')
                <div class="row">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" id="name" type="text" name="name"
                            value="{{ $budget->name }}" required>
                        @error('name')
                            <span class="text-danger error-text name_err">dsfs</span>
                        @enderror
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="min">Min</label>
                            <input class="form-control" id="name" type="number" name="min"
                                value="{{ $budget->min }}" required>
                            @error('name')
                                <span class="text-danger error-text min_err">dsfs</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="max">Max</label>
                            <input class="form-control" id="max" type="number" name="max"
                                value="{{ $budget->max }}" required>
                            <span class="text-danger error-text max_err"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <button type="submit" class="btn btn-outline-success w-25">Submit</button>
                    </center>
                </div>
            </form>
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
        });
    </script>
</x-admin.layout>
