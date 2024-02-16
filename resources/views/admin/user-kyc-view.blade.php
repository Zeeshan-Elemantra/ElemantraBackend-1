<x-admin.layout>
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-6">
                    <h3>Kyc</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.home') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Elemantra Verification</li>
                        <li class="breadcrumb-item active">Kyc</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Add form starts -->

    <!-- Add form ends -->

    <!-- Data starts -->
    <div class="row">
        <div class="card">
            <div class="card-header">
                <h5>{{ $user->name }}</h5>
            </div>
            <div class="card-body photoswipe-pb-responsive">
                <div class="my-gallery row grid gallery" id="aniimated-thumbnials" itemscope="">
                    @forelse ($user->kyc as $kyc)
                        {{-- <img class="card-img-top" src="{{ $kyc->image }}" alt="Card image cap" width="180px" height="400px">
                                <div class="card-body">
                                    <h5 class="card-title">{{ str_replace('_', ' ', ucfirst($kyc->name)) }}</h5>
                                </div> --}}

                        {{-- <figure class="" itemprop="associatedMedia" itemscope="" width="180px" height="400px">
                            <a href="{{ $kyc->image }}" itemprop="contentUrl" data-size=""><img
                                    class="img-thumbnail" src="{{ $kyc->image }}" itemprop="thumbnail"
                                    alt="Image description"></a>
                            <figcaption itemprop="caption description">{{ str_replace('_', ' ', ucfirst($kyc->name)) }}
                            </figcaption>
                        </figure> --}}


                        <figure class="col-md-4 col-sm-6 grid-item" itemprop="associatedMedia" itemscope="">
                            <a href="{{ $kyc->image }}" itemprop="contentUrl" data-size="">
                                <img class="img-thumbnail" src="{{ $kyc->image }}" itemprop="thumbnail"
                                    alt="Image description" width="400px" height="400px"> </a>
                            <figcaption itemprop="caption description">{{ str_replace('_', ' ', ucfirst($kyc->name)) }}</figcaption>
                        </figure>
                    @empty
                    @endforelse
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
