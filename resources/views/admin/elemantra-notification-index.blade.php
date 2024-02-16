<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Notification</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Notification</li>
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
                    <h5>Notify Users</h5>
                </div>
                <div class="card-body">
                    {{-- <form class="form-wizard" id="addForm" method="POST" enctype="multipart/form-data"> --}}
                    <form action="{{ route('admin.elemantra-notification.store') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input class="form-control" id="title" type="text" name="title" required>
                                    <span class="text-danger error-text title_err"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="type">type</label>
                                <div class="form-group">
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="interface_type" id="type_all"
                                            autocomplete="off" checked
                                            value="{{ \App\Enums\InterfaceTypeEnum::ALL->value }}">
                                        <label class="btn btn-outline-primary" for="type_all">All</label>

                                        <input type="radio" class="btn-check" name="interface_type" id="type_hire"
                                            autocomplete="off"
                                            value="{{ \App\Enums\InterfaceTypeEnum::HIREWORK->value }}">
                                        <label class="btn btn-outline-primary" for="type_hire">Hire Work</label>

                                        <input type="radio" class="btn-check" name="interface_type" id="type_find"
                                            autocomplete="off"
                                            value="{{ \App\Enums\InterfaceTypeEnum::FINDWORK->value }}">
                                        <label class="btn btn-outline-primary" for="type_find">Find Work</label>
                                    </div>
                                    <span class="text-danger error-text type_err"></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" name="description" id="" cols="30" rows="5" required></textarea>
                            <span class="text-danger error-text description_err"></span>
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Notify</button>
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
                    <h5>Notification</h5>
                    <div class="mt-4">
                        <button class="btn btn-primary" id="addToTable" type="button">Notify</button>
                        <button class="btn btn-secondary text-end" id="btnCancel" type="button"
                            style="display: none;">Cancel</button>
                    </div>
                </div>
                <div class="card-body pt-2">
                    <div class="table-responsives">
                        <table class="table display"> <!-- id="example-style-1" -->
                            <thead>
                                <th>Sr.No</th>
                                <th>Title</th>
                                <th>Descrition</th>
                                <th>Interface Type</th>
                                <th>Created At</th>
                                <th>Account`</th>
                            </thead>

                            <tbody id="tableContainer">
                                @forelse ($notifications as $key=>$notification)
                                    <tr>
                                        <td>{{ $loop->index + 1 }}</td>
                                        <td>{{ $notification->title }}</td>
                                        <td>{{ $notification->description }}</td>
                                        <td>{{ \App\Enums\InterfaceTypeEnum::from($notification->interface_type)->label() }}
                                        </td>
                                        <td>{{ \Carbon\Carbon::parse($notification->created_at)->format('d,M Y') }}
                                        <td>
                                            <form
                                                action="{{ route('admin.elemantra-notification.destroy', ['elemantra_notification' => $notification->id]) }}"
                                                method="post">
                                                @csrf
                                                @method('delete')
                                                <button type="submit" href=""
                                                    class="btn btn-pill btn-outline-danger">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                @endforelse
                            </tbody>
                        </table>
                        {{-- <div class="mt-2">
                            {{ $users->links() }}
                        </div> --}}
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
