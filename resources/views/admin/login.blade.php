<x-admin.layout>
	<div class="page-body">
		<div class="container-fluid">
			<div class="page-header">
				<div class="row">
					<div class="col-lg-6">
						<!--<h3>Sign In</h3>-->
						<!--<ol class="breadcrumb">-->
						<!--    <li class="breadcrumb-item"><a href="index.php">Home</a></li>-->
						<!--    <li class="breadcrumb-item active">Sign In</li>-->
						<!--</ol>-->
					</div>
				</div>
			</div>
		</div>

		<!-- Login form starts -->
		<div class="row" style="margin-top: 5%;">
			<div class="col-lg-3 col-md-6 col-sm-12 mx-auto">
				<div class="card">
					<div class="card-header pb-0">
						<h5>Sign In</h5>
					</div>
					<div class="card-body">
						<form class="form-wizard" id="loginForm" method="POST">
							@csrf
							<div class="form-group">
								<label for="username">Username</label>
								<input class="form-control" id="username" name="username" type="text" dir="ltr" required="required">
							</div>

							<div class="form-group">
								<label for="password">Password</label>
								<input class="form-control" id="password" name="password" type="password" dir="ltr" required="required">
							</div>

							<div class="mt-4">
								<div class="btn-m">
									<button class="btn btn-primary" type="submit">Sign In</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Login form ends -->
	</div>

	<script>
		$("#loginForm").submit(function(e) {

			e.preventDefault();

			var formData = new FormData(this);

			$.ajax({
				type: "POST",
				url: "{{ route('admin.signin') }}",
				data: formData,
				success: function(obj) {
					result = obj;
					if(result.response == 'y') {
						// alert(result.message);
						window.location = '{{ route('admin.home') }}';
						// location.reload();
					}
					else{
						alert(result.message);
					}
				},
				contentType: false,
				processData: false,
				error: function() { alert('failed'); }
			});
		});
	</script>

</x-admin.layout>
