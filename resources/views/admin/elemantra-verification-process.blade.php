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
                        <li class="breadcrumb-item active">Process</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->

    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="container-fluid">
        <div class="row d-flex align-items-center h-100">
            <div class="col col-md-12 col-lg-12 col-xl-12">
                <div class="card" style="border-radius: 15px;">
                    <div class="card-body p-4">
                        <div class="d-flex text-black">
                            <div class="flex-shrink-0">
                                <img src="{{ $user->profile }}" alt="Generic placeholder image" class="img-fluid"
                                    style="width: 180px; border-radius: 10px;">
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5 class="mb-1">{{ $user->name }}</h5>
                                <p class="mb-2 pb-1" style="color: #2b2a2a;">
                                    @if (!$user->userWorkType->empty())
                                        {{ $user->userWorkType[0]->workType->name }}
                                    @else
                                        ---
                                    @endif
                                </p>
                                <p class="mb-2 pb-1" style="color: #2b2a2a;"> Email : {{ $user->email }}</p>
                                <p class="mb-2 pb-1" style="color: #2b2a2a;"> Contact No : {{ $user->phone }}</p>
                                <p class="mb-2 pb-1" style="color: #2b2a2a;"> Alt Contact No : {{ $user->alt_phone }}
                                </p>
                                {{-- <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
                                    style="background-color: #efefef;">
                                    <div>
                                        <p class="small text-muted mb-1">Articles</p>
                                        <p class="mb-0">41</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="small text-muted mb-1">Followers</p>
                                        <p class="mb-0">976</p>
                                    </div>
                                    <div>
                                        <p class="small text-muted mb-1">Rating</p>
                                        <p class="mb-0">8.5</p>
                                    </div>
                                </div>
                                <div class="d-flex pt-1">
                                    <button type="button"
                                        class="btn btn-outline-primary me-1 flex-grow-1">Chat</button>
                                    <button type="button" class="btn btn-primary flex-grow-1">Follow</button>
                                </div> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="col-md-12">
                <div id="verififcationStepper" class="bs-stepper">
                    <div class="bs-stepper-header">
                        @forelse ($onboardSteps as $key=>$step)
                            <div class="step @if ($user->verification_step == $step->id) active @endif"
                                data-target="#step_{{ $step->id }}" id="stepperhead_{{ $step->id }}">
                                <button type="button" class="step-trigger" role="tab"
                                    aria-controls="{{ $step->id }}" id="{{ $step->id }}-trigger"
                                    onclick="stepLabelClick({{$step->id}})">
                                    <span class="bs-stepper-circle">{{ $loop->index + 1 }}</span>
                                    <span class="bs-stepper-label">{{ $step->title }}</span>
                                </button>
                            </div>
                            @if (!$loop->last)
                                <div class="line"></div>
                            @endif
                        @empty
                        @endforelse
                    </div>
                    <div class="bs-stepper-content">
                        @forelse ($onboardSteps as $key=>$step)
                            @php
                                $remarkExists = false;
                                $spokenName = null;
                                $meetingMinute = null;
                                $remark = null;
                                if (
                                    $user
                                        ->verificationRemarks()
                                        ->where('onboard_step_id', $step->id)
                                        ->exists()
                                ) {
                                    $remarkData = $user->verificationRemarks->where('onboard_step_id', $step->id)->values()[0];
                                    $remarkExists = true;
                                    $spokenName = $remarkData->spoken_name;
                                    $meetingMinute = $remarkData->meeting_minute;
                                    $remark = $remarkData->remark;
                                }
                            @endphp
                            <div id="step_{{ $step->id }}"
                                class="content @if ($user->verification_step == $step->id) active dstepper-block @endif">
                                <div class="container-fluid">
                                    <div class="alert alert-light" role="alert">
                                        {{ $step->description }}
                                    </div>
                                    <form action="{{ route('admin.elemantra-verification.store') }}" method="post">
                                        @csrf
                                        <input type="hidden" name="user_id" value="{{ $user->id }}">
                                        <input type="hidden" name="step_id" value="{{ $step->id }}">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="spoken_name" class="form-label">Your Name</label>
                                                    <input type="text" class="form-control" id="spoken_name"
                                                        name="spoken_name" placeholder="Who spoke to the vendor...."
                                                        value="{{ $spokenName }}" @readonly($remarkExists)>
                                                    @error('spoken_name')
                                                        <span class="text-danger error-text">Spoken Name required</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="meeting_minute" class="form-label">Meeting
                                                        Minute</label>
                                                    <input type="number" class="form-control" id="meeting_minute"
                                                        name="meeting_minute"
                                                        placeholder="Meeting minutes with vendor...."
                                                        value="{{ $meetingMinute }}" @readonly($remarkExists)>
                                                    @error('meeting_minute')
                                                        <span class="text-danger error-text">Meeting of minute
                                                            required</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="remark" class="form-label">Remark...</label>
                                                    <textarea class="form-control" name="remark" id="" cols="30" rows="5" placeholder="Remarks..."
                                                        @readonly($remarkExists)>{{ $remark }}</textarea>
                                                    @error('meeting_minute')
                                                        <span class="text-danger error-text">Remark of
                                                            required</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row justify-content-center">
                                            @if (!$loop->first)
                                                <div class="col-md-4 text-left">
                                                    <button type="button" class="btn btn-primary"
                                                        onclick="previousStep({{ $step->id }});">Previous</button>
                                                </div>
                                            @endif
                                            @if (!$remarkExists)
                                                <div class="col-md-4">
                                                    <button type="submit"
                                                        class="btn btn-success w-100">Submit</button>
                                                </div>
                                            @endif
                                            @if ($step->id < $user->verification_step && !$loop->last)
                                                <div class="col-md-4 text-end ml-auto">
                                                    <button type="button" class="btn btn-primary float-end"
                                                        onclick="nextStep({{ $step->id }});">Next</button>
                                                </div>
                                            @endif
                                        </div>
                                    </form>
                                </div>
                            </div>
                            {{-- @if ($loop->first)
                                <div id="step_{{ $step->id }}"
                                    class="content @if ($user->verification_step == $step->id) active dstepper-block @endif">
                                    <div class="container-fluid">
                                        <div class="alert alert-light" role="alert">
                                            {{ $step->description }}
                                        </div>
                                        <form action="{{ route('admin.elemantra-verification.store') }}"
                                            method="post">
                                            @csrf
                                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                                            <input type="hidden" name="step_id" value="{{ $step->id }}">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="spoken_name" class="form-label">Your Name</label>
                                                        <input type="text" class="form-control" id="spoken_name"
                                                            name="spoken_name"
                                                            placeholder="Who spoke to the vendor....">
                                                        @error('spoken_name')
                                                            <span class="text-danger error-text">Spoken Name
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="meeting_minute" class="form-label">Meeting
                                                            Minute</label>
                                                        <input type="number" class="form-control"
                                                            id="meeting_minute" name="meeting_minute"
                                                            placeholder="Meeting minutes with vendor....">
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Meeting of minute
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="remark" class="form-label">Remark...</label>
                                                        <textarea class="form-control" name="remark" id="" cols="30" rows="5"
                                                            placeholder="Remarks..."></textarea>
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Remark of
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row justify-content-center">
                                                <div class="col-md-4 text-center">
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <button type="submit"
                                                        class="btn btn-success w-100">Submit</button>
                                                </div>
                                                @if ($step->id < $user->verification_step)
                                                    <div class="col-md-4 text-right ml-auto">
                                                        <button type="button" class="btn btn-primary float-end"
                                                            onclick="nextStep({{ $step->id }});">Next</button>
                                                    </div>
                                                @else
                                                    <div class="col-md-4 text-center">
                                                    </div>
                                                @endif
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            @endif
                            @if (!$loop->first && !$loop->last)
                                <div id="step_{{ $step->id }}"
                                    class="content @if ($user->verification_step == $step->id) active dstepper-block @endif">

                                    <div class="container-fluid">
                                        <div class="alert alert-light" role="alert">
                                            {{ $step->description }}
                                        </div>
                                        <form action="{{ route('admin.elemantra-verification.store') }}"
                                            method="post">
                                            @csrf
                                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                                            <input type="hidden" name="step_id" value="{{ $step->id }}">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="spoken_name" class="form-label">Your Name</label>
                                                        <input type="text" class="form-control" id="spoken_name"
                                                            name="spoken_name"
                                                            placeholder="Who spoke to the vendor....">

                                                        @error('spoken_name')
                                                            <span class="text-danger error-text">Spoken Name
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="meeting_minute" class="form-label">Meeting
                                                            Minute</label>
                                                        <input type="number" class="form-control"
                                                            id="meeting_minute" name="meeting_minute"
                                                            placeholder="Meeting minutes with vendor....">
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Meeting of minute
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="remark" class="form-label">Remark...</label>
                                                        <textarea class="form-control" name="remark" id="" cols="30" rows="5"
                                                            placeholder="Remarks..."></textarea>
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Remark of
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row justify-content-center">
                                                <div class="col-md-4 text-left">
                                                    <button type="button" class="btn btn-primary"
                                                        onclick="previousStep({{ $step->id }});">Previous</button>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <button type="submit"
                                                        class="btn btn-success w-100">Submit</button>
                                                </div>
                                                @if ($step->id < $user->verification_step)
                                                    <div class="col-md-4 text-right ml-auto">
                                                        <button type="button" class="btn btn-primary float-end"
                                                            onclick="nextStep({{ $step->id }});">Next</button>
                                                    </div>
                                                @else
                                                    <div class="col-md-4 text-center">
                                                    </div>
                                                @endif
                                            </div>
                                        </form>
                                    </div>


                                </div>
                            @endif

                            @if ($loop->last)
                                <div id="step_{{ $step->id }}"
                                    class="content @if ($user->verification_step == $step->id) active dstepper-block @endif">
                                    <div class="container-fluid">
                                        <div class="alert alert-light" role="alert">
                                            {{ $step->description }}
                                        </div>
                                        <form action="{{ route('admin.elemantra-verification.store') }}"
                                            method="post">
                                            @csrf
                                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                                            <input type="hidden" name="step_id" value="{{ $step->id }}">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="spoken_name" class="form-label">Your Name</label>
                                                        <input type="text" class="form-control" id="spoken_name"
                                                            name="spoken_name"
                                                            placeholder="Who spoke to the vendor....">
                                                        @error('spoken_name')
                                                            <span class="text-danger error-text">Spoken Name
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="meeting_minute" class="form-label">Meeting
                                                            Minute</label>
                                                        <input type="number" class="form-control"
                                                            id="meeting_minute" name="meeting_minute"
                                                            placeholder="Meeting minutes with vendor....">
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Meeting of minute
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="remark" class="form-label">Remark...</label>
                                                        <textarea class="form-control" name="remark" id="" cols="30" rows="5"
                                                            placeholder="Remarks..."></textarea>
                                                        @error('meeting_minute')
                                                            <span class="text-danger error-text">Remark of
                                                                required</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row justify-content-center">
                                                <div class="col-md-4 text-left">
                                                    <button type="button" class="btn btn-primary"
                                                        onclick="previousStep({{ $step->id }});">Previous</button>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <button type="submit"
                                                        class="btn btn-success w-100">Submit</button>
                                                </div>

                                                <div class="col-md-4 text-center">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            @endif --}}
                        @empty
                        @endforelse

                    </div>
                </div>
            </div>
        </div>
    </div>

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

        function stepLabelClick(step) {
            var currentStep = {{$user->verification_step}};
            if(step > currentStep){
                alert('Please Complete Step :'+currentStep+' before accessing the step : '+step);
            }else{
                $('.step').removeClass('active');
                $('.content').removeClass('active dstepper-block');
                $('#stepperhead_' + step).addClass('active');
                $('#step_' + step).addClass('active dstepper-block');
            }
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
