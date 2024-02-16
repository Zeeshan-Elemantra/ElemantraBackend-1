<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Work Types</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Work Types</li>
                        <li class="breadcrumb-item active">Edit</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->
    {{-- <div class="row" id="addContainer" style="display: none;">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>Add Work Type</h5>
                    </div>
                    <div class="card-body">
                        <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input class="form-control" id="name" type="text" name="name" >
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
        </div> --}}

    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h5>Edit - {{ $workType->name }}</h5>
                </div>
                <div class="card-body pt-2">
                    <form action="{{ route('admin.work_types.update', ['work_type' => $workType->id]) }}"
                        method="post">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="form-control" id="name" type="text" name="name"
                                        placeholder="Work Type name..." value="{{ $workType->name }}">
                                    @error('name')
                                        <span class="text-danger error-text ">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit">Submit</button>
                                    <a href="{{ route('admin.work_types.index') }}"
                                        class="btn btn-outline-secondary">Cancel</a>
                                </div>
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

</x-admin.layout>
