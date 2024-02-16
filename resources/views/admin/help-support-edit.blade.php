<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Help Support</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Help Support</li>
                        <li class="breadcrumb-item active">Update</li>
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
        <div class="card">
            <div class="card-header">
                <h5>{{ $helpSupport->user ? $helpSupport->user->name : '--' }}</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <form action="{{ route('admin.help-support.update', ['help_support' => $helpSupport->id]) }}"
                        method="post">
                        @csrf
                        @method('put')
                        @if ($helpSupport->feedback)
                            <div class="row">
                                <label for="">Feedback</label>
                                <div class="alert alert-light   ">
                                    <p>
                                        {{ $helpSupport->feedback }}
                                    </p>
                                </div>
                            </div>
                        @endif
                        <div class="row mt-2">
                            {{-- <div class="btn-radio">
                                 <div class="btn-group" data-bs-toggle="buttons">
                                    <div class="btn btn-primary">
                                        <div class="radio radio-primary">
                                            <input id="support_status_1" type="radio" name="support_status"
                                                value="0" @checked($helpSupport->support_status == \App\Enums\HelpSupportEnum::REQUESTED->value)>
                                            <label for="support_status_1">Requested</label>
                                        </div>
                                    </div>
                                    <div class="btn btn-primary active">
                                        <div class="radio radio-primary">
                                            <input id="support_status_2" type="radio" name="support_status"
                                                value="1" @checked($helpSupport->support_status == \App\Enums\HelpSupportEnum::SOLVED->value)>
                                            <label for="support_status_2">Solved</label>
                                        </div>
                                    </div>
                                </div>
                            </div> --}}
                            <label for="">Current Status</label>
                            {{-- <div class="col-md-6"> --}}
                                <div class="form-group">
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="support_status"
                                            id="support_status1" autocomplete="off" value="0"
                                            @checked($helpSupport->support_status == \App\Enums\HelpSupportEnum::REQUESTED->value)>
                                        <label class="btn btn-outline-primary" for="support_status1">Requested</label>

                                        <input type="radio" class="btn-check" name="support_status"
                                            id="support_status2" autocomplete="off" value="1"
                                            @checked($helpSupport->support_status == \App\Enums\HelpSupportEnum::SOLVED->value)>
                                        <label class="btn btn-outline-primary" for="support_status2">Solved</label>
                                    </div>

                                </div>
                            {{-- </div> --}}
                        </div>

                        <div class="row mt-2">
                            <label for="">Remark...</label>
                            <textarea class="form-control" name="remark" id="" cols="30" rows="10">{{ $helpSupport->remark }}</textarea>
                        </div>
                        <div class="row mt-2">
                            <center>
                                <button type="submit" class="btn btn-outline-success w-25">Submit</button>
                            </center>
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


        });
    </script>
</x-admin.layout>
