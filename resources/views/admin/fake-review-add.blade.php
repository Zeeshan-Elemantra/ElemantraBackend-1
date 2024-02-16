<x-admin.layout>
    <style>
        .profile-image {
            width: 80px;
            height: 80px;
            border-radius: 20%;
            object-fit: cover;
        }

        .separator {
            border-left: 1px solid #ddd;
            height: 100%;
            /* Adjust the height based on your design */
            margin-left: 15px;
            /* Adjust the margin based on your design */
        }
    </style>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>User - {{ $user->name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Elemantra Verification</li>
                        <li class="breadcrumb-item active">Rating</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->

    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="container-fluid">
        <div class="card card-absolute">
            <div class="card-header bg-light">
                <h5 class="text-white">
                    <h5>{{ $user->name }}</h5>
                </h5>
            </div>
            <div class="card-body">
                <form action="{{ route('admin.review.add') }}" method="post">
                    @csrf
                    <input type="hidden" name="user_id" value="{{$user->id}}">
                    <div class="row">
                        <div class="col-md-6">
                            <label class="col-form-label pt-0" for="review_by_name">User Name</label>
                            <input type="text" class="form-control" name="review_by_name" id="review_by_name"
                                placeholder="Review By name..." required>
                            @error('review_by_name')
                                <span class="text text-danger">Required</span>
                            @enderror
                        </div>
                    </div>
                    @forelse ($reviewCategories as $key=> $category)
                        <div class="mt-3 row">
                            <label class="col-sm-3 col-form-label" for="inputEmail3">{{ $category->name }}</label>
                            <div class="col-sm-9">
                                <input type="hidden" name="reviews[{{ $category->id }}][review_category_id]"
                                    value="{{ $category->id }}">
                                <div class="rating-container" id="{{ $category->id }}">
                                    <select class="u-rating-fontawesome" name="reviews[{{ $category->id }}][rating]"
                                        id="rating_{{ $category->id }}" required>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    @empty
                    @endforelse
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="col-form-label pt-0" for="description">Description</label>
                            <textarea class="form-control" name="description" id="" cols="30" rows="5"
                                placeholder="Descirption..." required></textarea>

                            @error('description')
                                <span class="text text-danger">Required</span>
                            @enderror
                        </div>
                    </div>
                    <div class="row mt-3 text-center">
                        <center>
                            <button type="submit" class="btn btn-outline-success w-25">Submit</button>
                        </center>
                    </div>
                </form>
            </div>

        </div>
    </div>


    <!-- Data ends -->
    {{-- <script>
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
    </script> --}}
    {{-- <script src="dist/js/bs-stepper.js"></script> --}}
    <script>
        function showStep(stepId) {
            // Handle the visibility of steps here
            // You can use jQuery or plain JavaScript to toggle classes, or set visibility, etc.
        }

        function nextStep(currentStepId) {
            var nextStep = currentStepId + 1;
            $('.step').removeClass('active');
            $('#stepperhead_' + nextStep).addClass('active');
            $('.content').removeClass('active dstepper-block');
            $('#step_' + nextStep).addClass('active dstepper-block');
        }

        function previousStep(currentStepId) {
            var prevStep = currentStepId - 1;
            $('.step').removeClass('active');
            $('#stepperhead_' + prevStep).addClass('active');
            $('.content').removeClass('active dstepper-block');
            $('#step_' + prevStep).addClass('active dstepper-block');
        }

        // var stepper2 = new Stepper(document.querySelector('#verififcationStepper'), {
        //     linear: false,
        //     // animation: true,
        //     // startingStep: 2
        // })

        // var verififcationStepperNode = document.querySelector('#verififcationStepper')
        // var verififcationStepper = new Stepper(document.querySelector('#verififcationStepper'))

        // verififcationStepperNode.addEventListener('show.bs-stepper', function(event) {
        //     console.warn('show.bs-stepper', event)
        // })
        // verififcationStepperNode.addEventListener('shown.bs-stepper', function(event) {
        //     console.warn('shown.bs-stepper', event)
        // })

        // var stepper2 = new Stepper(document.querySelector('#stepper2'), {
        //     linear: false,
        //     animation: true
        // })
        // var stepper3 = new Stepper(document.querySelector('#stepper3'), {
        //     animation: true
        // })
        // var stepper4 = new Stepper(document.querySelector('#stepper4'))
    </script>
</x-admin.layout>
