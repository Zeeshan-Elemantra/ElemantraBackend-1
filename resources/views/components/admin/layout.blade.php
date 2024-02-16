<!doctype html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="viho admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
        content="admin template, viho admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="{{ asset('admin/assets/images/logo/favicon.png') }}" type="image/x-icon">
    <link rel="shortcut icon" href="{{ asset('admin/assets/images/logo/favicon.png') }}" type="image/x-icon">
    <title>{{ $title ?? config('app.name', 'Laravel') }} - Admin Panel</title>
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">
    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/fontawesome.css') }}">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/icofont.css') }}">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/themify.css') }}">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/flag-icon.css') }}">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/feather-icon.css') }}">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/prism.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/rating.css') }}">
    <!-- Plugins css Ends-->

    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/bootstrap.css') }}">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/style.css') }}">
    <link id="color" rel="stylesheet" href="{{ asset('admin/assets/css/color-1.css') }}" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/responsive.css') }}">

    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/fontawesome.css') }}">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/icofont.css') }}">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/themify.css') }}">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/flag-icon.css') }}">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/feather-icon.css') }}">
    <!-- Plugins css start-->
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/bootstrap.css') }}">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/style.css') }}">
    <link id="color" rel="stylesheet" href="{{ asset('admin/assets/css/color-1.css" media="screen') }}">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/assets/css/responsive.css') }}">



    <!-- latest jquery-->
    <script src="{{ asset('admin/assets/js/jquery-3.5.1.min.js') }}"></script>

    <!-- bootsrap select cdns jquery -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- CDN link used below is compatible with this example -->

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>


    <!-- Toaster Js -->
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />

    <!-- Plugins step-->
    <link href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>

    {{-- <script src="{{ asset('admin/assets/js/jquery-3.5.1.min.js') }}"></script> --}}

    {{-- <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
    <script>
        window.OneSignal = window.OneSignal || [];
        OneSignal.push(function() {
            OneSignal.init({
                appId: "{{ env('ONE_SIGNAL_APP_ID') }}",
        });
    });
    </script>

    <script src="{{ asset('OneSignalSDKWorker.js') }}"></script> --}}

    <style>
        .form-wizard .tab {
            display: initial;
        }

        table.dataTable:not(.fixedHeader-locked):not(.fixedHeader-floating) {
            width: calc(100% - 1px) !important;
        }

        thead,
        tbody,
        tbody tr td {
            border-width: 2px !important;
            border-color: #d6e2e5 !important;
        }

        .previous-app-ids {
            position: relative;
            cursor: pointer;
            width: 95px;
        }

        .toggle-app-id-view {
            height: 25px;
            overflow: hidden;
        }

        .toggle-app-id-view::after {
            content: 'more...';
            position: absolute;
            top: 0;
            right: 0;
            font-weight: bold;
            background-color: #fff;
            padding: 0 5px;
        }
    </style>
</head>

<body>
    <!-- Loader starts -->
    <div class="loader-wrapper">
        <div class="theme-loader">
            <div class="loader-p"></div>
        </div>
    </div>
    <!-- Loader ends -->

    <!-- page-wrapper Start -->
    <div class="page-wrapper" id="pageWrapper">

        @include('layouts.admin.header')

        <!-- Page Body Start -->
        <div class="page-body-wrapper horizontal-menu">
            @if (!request()->routeIs('admin.login'))
                @include('layouts.admin.navigation', [
                    'new_case_count' => 0,
                ])
            @endif

            <div class="page-body">
                @if (Session::has('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success ! :</strong> {{ Session::get('success') }}.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                    </div>
                @endif
                @if (Session::has('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error ! :</strong> {{ Session::get('error') }}.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                    </div>
                @endif
                {{ $slot }}
            </div>


            @if (!request()->routeIs('admin.login'))
                {{-- @include('layouts.admin.footer') --}}
            @endif
        </div>
    </div>


    <!-- feather icon js-->
    <script src="{{ asset('admin/assets/js/icons/feather-icon/feather.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/icons/feather-icon/feather-icon.js') }}"></script>
    <!-- Sidebar jquery-->
    @if (!request()->routeIs('admin.login'))
        <script src="{{ asset('admin/assets/js/sidebar-menu.js') }}"></script>
    @endif
    <script src="{{ asset('admin/assets/js/config.js') }}"></script>
    <!-- Bootstrap js-->
    <script src="{{ asset('admin/assets/js/bootstrap/popper.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/bootstrap/bootstrap.min.js') }}"></script>
    <!-- Plugins JS start-->
    <script src="{{ asset('admin/assets/js/prism/prism.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/clipboard/clipboard.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/custom-card/custom-card.js') }}"></script>
    <script src="{{ asset('admin/assets/js/tooltip-init.js') }}"></script>
    {{-- <script src="{{ asset('admin/assets/js/form-wizard/form-wizard.js') }}"></script> --}}
    <script src="{{ asset('admin/assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/datatable/datatables/datatable.custom.js') }}"></script>
    <script src="{{ asset('admin/assets/js/rating/jquery.barrating.js') }}"></script>
    <script src="{{ asset('admin/assets/js/rating/rating-script.js') }}"></script>
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="{{ asset('admin/assets/js/script.js') }}"></script>
    <script src="{{ asset('admin/assets/js/theme-customizer/customizer.js') }}"></script>
    <!-- login js-->
    <!-- Plugins JS start-->
    <script src="{{ asset('admin/assets/js/chart/chartist/chartist.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/chartist/chartist-plugin-tooltip.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/knob/knob.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/knob/knob-chart.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/apex-chart/apex-chart.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/apex-chart/stock-prices.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/google/google-chart-loader.js') }}"></script>
    <script src="{{ asset('admin/assets/js/chart/google/google-chart.js') }}"></script>

    <script src="{{ asset('admin/assets/js/prism/prism.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/clipboard/clipboard.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/counter/jquery.waypoints.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/counter/jquery.counterup.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/counter/counter-custom.js') }}"></script>
    <script src="{{ asset('admin/assets/js/custom-card/custom-card.js') }}"></script>
    <script src="{{ asset('admin/assets/js/notify/bootstrap-notify.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/jquery-jvectormap-2.0.2.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-world-mill-en.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-us-aea-en.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-uk-mill-en.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-au-mill.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-chicago-mill-en.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-in-mill.js') }}"></script>
    <script src="{{ asset('admin/assets/js/vector-map/map/jquery-jvectormap-asia-mill.js') }}"></script>
    <script src="{{ asset('admin/assets/js/dashboard/default.js') }}"></script>
    <script src="{{ asset('admin/assets/js/notify/index.js') }}"></script>
    <script src="{{ asset('admin/assets/js/datepicker/date-picker/datepicker.js') }}"></script>
    <script src="{{ asset('admin/assets/js/datepicker/date-picker/datepicker.en.js') }}"></script>
    <script src="{{ asset('admin/assets/js/datepicker/date-picker/datepicker.custom.js') }}"></script>
    <script src="{{ asset('admin/assets/js/sweet-alert/sweetalert.min.js') }}"></script>
    <script src="{{ asset('admin/assets/js/sweet-alert/app.js') }}"></script>
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="{{ asset('admin/assets/js/script.js') }}"></script>
    {{-- <script src="{{ asset('admin/assets/js/theme-customizer/customizer.js') }}"></script> --}}
    <!-- Plugin used-->
</body>

</html>
