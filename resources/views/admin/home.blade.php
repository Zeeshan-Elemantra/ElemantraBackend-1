<x-admin.layout>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
        <div class="row starter-main">
            <div class="col-md-4">
                <div class="card o-hidden border-0">
                    <div class="bg-primary b-r-4 card-body">
                        <div class="media static-top-widget">
                            <div class="align-self-center text-center"><i data-feather="user-plus"></i></div>
                            <div class="media-body"><span class="m-0">User</span>
                                <h4 class="mb-0 counter">{{ $usersCount['all'] }}</h4><i class="icon-bg"
                                    data-feather="user-plus"></i>
                            </div>
                        </div>
                    </div>
                    <ul class="list-group list-group-flush border border-primary">
                        <li class="list-group-item  border-primary d-flex justify-content-between align-items-center">
                            Designer
                            <span class="badge bg-primary rounded-pill">{{ $usersCount['designer'] }}</span>
                        </li>
                        <li
                            class="list-group-item border-primary border-left-primary d-flex justify-content-between align-items-center">
                            Turnkey
                            <span class="badge bg-primary rounded-pill">{{ $usersCount['turnkey'] }}</span>
                        </li>
                        <li class="list-group-item border-primary d-flex justify-content-between align-items-center">
                            Individual Contractor
                            <span class="badge bg-primary rounded-pill">{{ $usersCount['individual'] }}</span>
                        </li>
                        <li class="list-group-item border-primary d-flex justify-content-between align-items-center">
                            Labour
                            <span class="badge bg-primary rounded-pill">{{ $usersCount['labour'] }}</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <h5 class="m-3 mb-0">{{ \Carbon\Carbon::now()->format('M Y') }} ( Users )</h5>
                    <div id="user-chart-dashboard"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card social-widget-card " style="height: 88%">
                    <div class="card-body">
                        {{-- <div class="redial-social-widget radial-bar-70"
                            data-label="{{ ($elemantraUsers['verified'] / 100) * $elemantraUsers['application'] }}%"><i
                                class="fa fa-check font-primary"></i></div> --}}
                        <h5 class="b-b-light text-capitalize">Elemantra Verified</h5>
                        <div class="row">
                            <div class="col text-center b-r-light"><span>Total Applications</span>
                                <h4 class="counter mb-0">{{ $elemantraUsers['application'] }}</h4>
                            </div>
                            <div class="col text-center"><span>Verified</span>
                                <h4 class="counter mb-0">{{ $elemantraUsers['verified'] }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card o-hidden border-0">
                    <div class="bg-secondary b-r-4 card-body">
                        <div class="media static-top-widget">
                            <div class="align-self-center text-center"><i data-feather="shopping-bag"></i></div>
                            <div class="media-body"><span class="m-0">Jobs</span>
                                <h4 class="mb-0 counter">{{ $projectsCount['all'] }}</h4><i class="icon-bg"
                                    data-feather="shopping-bag"></i>
                            </div>
                        </div>
                    </div>
                    <ul class="list-group list-group-flush border border-secondary">
                        <li
                            class="list-group-item border-secondary border-left-secondary d-flex justify-content-between align-items-center">
                            Turnkey
                            <span class="badge bg-secondary rounded-pill">{{ $projectsCount['turnkey'] }}</span>
                        </li>
                        <li class="list-group-item border-secondary d-flex justify-content-between align-items-center">
                            Individual Contractor
                            <span class="badge bg-secondary rounded-pill">{{ $projectsCount['individual'] }}</span>
                        </li>
                        <li class="list-group-item border-secondary d-flex justify-content-between align-items-center">
                            Labour
                            <span class="badge bg-secondary rounded-pill">{{ $projectsCount['labour'] }}</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="m-3 mb-0">{{ \Carbon\Carbon::now()->format('M Y') }} ( Jobs )</h5>
                    <div id="project-chart-dashboard"></div>
                </div>
            </div>
            <div class="col-sm-12 col-xl-4 box-col-6 col-md-4">
                <div class="card">
                    <h5 class="m-3 mb-0">{{ \Carbon\Carbon::now()->format('M Y') }} ( Recieved Application )</h5>
                    <div id="application-chart-month-dashboard"></div>
                </div>
            </div>
        </div>
    </div>
    {{-- <div class="col-md-9">
        <div class="card income-card">
            <div class="card-header">
                <div class="header-top d-sm-flex align-items-center">
                    <h5>Jobs overview</h5>
                </div>
            </div>
            <div class="card-body p-0">
                <div id="chart-timeline-dashbord"></div>
            </div>
        </div>
    </div> --}}
    <!-- Container-fluid Ends-->

    <script>
        $(document).ready(function() {

            //user current month chart
            var currentMonthUsersCount = @json($currentMonthUsersCount);
            const seriesUsersCount = Object.values(currentMonthUsersCount);
            var usersChartOption = {
                series: seriesUsersCount, //[currentMonthUsersCount['designer'], currentMonthUsersCount['turnkey'], currentMonthUsersCount['individual'], currentMonthUsersCount['labour']],
                chart: {
                    height: 240,
                    type: 'radialBar',
                },
                plotOptions: {
                    radialBar: {
                        offsetY: 0,
                        startAngle: 0,
                        endAngle: 270,
                        hollow: {
                            margin: 5,
                            size: '30%',
                            background: 'transparent',
                            image: undefined,
                        },
                        dataLabels: {
                            name: {
                                show: true,
                            },
                            value: {
                                show: false,
                            }
                        }
                    }
                },
                colors: [vihoAdminConfig.primary, vihoAdminConfig.secondary, vihoAdminConfig.primary,
                    vihoAdminConfig
                    .secondary
                ],
                labels: ['All', 'Designer', 'Turnkey', 'Individual', 'Labour'],
                legend: {
                    show: true,
                    floating: true,
                    fontSize: '14px',
                    position: 'left',
                    fontFamily: 'Roboto',
                    fontweight: 400,
                    // offsetX:30,
                    offsetY: 20,
                    labels: {
                        useSeriesColors: true,
                    },
                    markers: {
                        size: 0,
                        show: false,
                    },
                    formatter: function(seriesName, opts) {
                        return seriesName + ":  " + opts.w.globals.series[opts.seriesIndex]
                    },
                    itemMargin: {
                        vertical: 5,
                        horizontal: 2
                    }
                },
                stroke: {
                    lineCap: 'round'
                },
                responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            show: true,
                            fontSize: '10px',
                        }
                    }
                }]
            };
            var usersChartApex = new ApexCharts(document.querySelector("#user-chart-dashboard"), usersChartOption);
            usersChartApex.render();

            //project current month chart

            var currentMonthProjectsCount = @json($currentMonthProjectsCount);
            const seriesProjctsCOunt = Object.values(currentMonthProjectsCount);
            var projectsChartOption = {
                series: seriesProjctsCOunt, //[currentMonthUsersCount['designer'], currentMonthUsersCount['turnkey'], currentMonthUsersCount['individual'], currentMonthUsersCount['labour']],
                chart: {
                    height: 270,
                    type: 'radialBar',
                },
                plotOptions: {
                    radialBar: {
                        offsetY: 0,
                        startAngle: 0,
                        endAngle: 270,
                        hollow: {
                            margin: 5,
                            size: '30%',
                            background: 'transparent',
                            image: undefined,
                        },
                        dataLabels: {
                            name: {
                                show: true,
                            },
                            value: {
                                show: false,
                            }
                        }
                    }
                },
                colors: [vihoAdminConfig.primary, vihoAdminConfig.secondary, vihoAdminConfig.primary,
                    vihoAdminConfig
                    .secondary
                ],
                labels: ['All', 'Turnkey', 'Individual', 'Labour'],
                legend: {
                    show: true,
                    floating: true,
                    fontSize: '14px',
                    position: 'left',
                    fontFamily: 'Roboto',
                    fontweight: 400,
                    // offsetX:30,
                    offsetY: 20,
                    labels: {
                        useSeriesColors: true,
                    },
                    markers: {
                        size: 0,
                        show: false,
                    },
                    formatter: function(seriesName, opts) {
                        return seriesName + ":  " + opts.w.globals.series[opts.seriesIndex]
                    },
                    itemMargin: {
                        vertical: 5,
                        horizontal: 2
                    }
                },
                stroke: {
                    lineCap: 'round'
                },
                responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            show: true,
                            fontSize: '10px',
                        }
                    }
                }]
            };
            var projectsChartApex = new ApexCharts(document.querySelector("#project-chart-dashboard"),
                projectsChartOption);
            projectsChartApex.render();

            //appplication current month chart
            var applicationsMonthCount = @json($applicationsMonthCount);
            console.log(applicationsMonthCount);
            const seriesApplicationMonthCount = Object.values(applicationsMonthCount);

            var applicationChartOption = {
                series: seriesApplicationMonthCount, //[currentMonthUsersCount['designer'], currentMonthUsersCount['turnkey'], currentMonthUsersCount['individual'], currentMonthUsersCount['labour']],
                chart: {
                    height: 270,
                    type: 'radialBar',
                },
                plotOptions: {
                    radialBar: {
                        offsetY: 0,
                        startAngle: 0,
                        endAngle: 270,
                        hollow: {
                            margin: 5,
                            size: '30%',
                            background: 'transparent',
                            image: undefined,
                        },
                        dataLabels: {
                            name: {
                                show: true,
                            },
                            value: {
                                show: false,
                            }
                        }
                    }
                },
                colors: [vihoAdminConfig.primary, vihoAdminConfig.secondary, vihoAdminConfig.primary,
                    vihoAdminConfig
                    .secondary
                ],
                labels: ['All', 'Individual', 'Labour', 'Turnkey'],
                legend: {
                    show: true,
                    floating: true,
                    fontSize: '14px',
                    position: 'left',
                    fontFamily: 'Roboto',
                    fontweight: 400,
                    // offsetX:30,
                    offsetY: 20,
                    labels: {
                        useSeriesColors: true,
                    },
                    markers: {
                        size: 0,
                        show: false,
                    },
                    formatter: function(seriesName, opts) {
                        return seriesName + ":  " + opts.w.globals.series[opts.seriesIndex]
                    },
                    itemMargin: {
                        vertical: 5,
                        horizontal: 2
                    }
                },
                stroke: {
                    lineCap: 'round'
                },
                responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            show: true,
                            fontSize: '10px',
                        }
                    }
                }]
            };
            var applicationChartApex = new ApexCharts(document.querySelector("#application-chart-month-dashboard"),
                applicationChartOption);
            applicationChartApex.render();
        });
    </script>
</x-admin.layout>
