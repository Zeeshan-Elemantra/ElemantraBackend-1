<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Change Password</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.php">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Change Password</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Change password form starts -->
    <div class="row" id="addContainer">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header pb-0">
                    <h5>Change Password</h5>
                    <!--<span>Please Make sure fill all the filed before click on next button</span>-->
                </div>
                <div class="card-body">
                    <form class="form-wizard" id="changePasswordForm" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="old_password">Current Password</label>
                            <input class="form-control" id="old_password" type="password" name="old_password"
                                dir="ltr" required="required">
                        </div>

                        <div class="form-group">
                            <label for="new_password">New Password</label>
                            <input class="form-control" id="new_password" type="password" name="new_password"
                                dir="ltr" required="required">
                        </div>

                        <div class="form-group">
                            <label for="confirm_password">Confirm New Password</label>
                            <input class="form-control" id="confirm_password" type="password" name="confirm_password"
                                dir="ltr" required="required">
                        </div>

                        <div class="mt-4">
                            <div class="btn-m">
                                <button class="btn btn-primary" type="submit">Change</button>
                                <input class="btn btn-secondary" type="reset" value="Reset">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Change password form ends -->

    <script>
        $("#changePasswordForm").submit(function(e) {

            e.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                type: "POST",
                url: "{{ route('admin.update-password') }}",
                data: formData,
                success: function(obj) {
                    result = obj;
                    if (result.response == 'y') {
                        alert(result.message);
                        location.reload();
                    } else {
                        alert(result.message);
                    }
                },
                contentType: false,
                processData: false,
                error: function() {
                    alert('failed');
                }
            });
        });
    </script>

</x-admin.layout>
