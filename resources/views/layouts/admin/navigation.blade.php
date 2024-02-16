<!-- Page Sidebar Start-->
<header class="main-nav">
    <nav>
        <div class="main-navbar">
            <div id="mainnav">
                <ul class="nav-menu custom-scrollbar">
                    <li class="back-btn">
                        <div class="mobile-back text-end"><span>Back</span><i class="fa fa-angle-right ps-2"
                                aria-hidden="true"></i></div>
                    </li>
                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.home') }}">
                            <i data-feather="home"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    {{-- <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.work_types') }}">
                            <i data-feather="briefcase"></i>
                            <span>Work Types</span>
                        </a>

                    </li> --}}


                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.users.index') }}">
                            <i data-feather="user"></i>
                            <span>Users</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.elemantra-verification.index') }}">
                            <i data-feather="user-check"></i>
                            <span>Elemantra Verifications</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.turkey-projects.index') }}">
                            <i data-feather="package"></i>
                            <span>Turnkey Jobs</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.individual-projects.index') }}">
                            <i data-feather="package"></i>
                            <span>Individual Jobs</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.labour-projects.index') }}">
                            <i data-feather="package"></i>
                            <span>Labour Jobs</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="javascript:void(0)">
                            <i data-feather="archive"></i>
                            <span>Work Items</span>
                        </a>
                        <ul class="menu-content">
                            <li><a class="dropdown nav-link menu-title"
                                    href="{{ route('admin.work_types.index') }}">Work
                                    Type</a></li>
                            <li><a class="dropdown nav-link menu-title" href="{{ route('admin.work_items') }}">Work
                                    Items</a></li>
                            <li class="dropdown">
                                <a class="nav-link menu-title" href="{{ route('admin.item_categories') }}">
                                    <span>Item Categories</span>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a class="nav-link menu-title" href="{{ route('admin.item_details') }}">
                                    <span>Item Details</span>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a class="nav-link menu-title" href="{{ route('admin.brand_specification') }}">
                                    <span>Item Brand Specification</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    {{-- <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.work_items') }}">
                            <i data-feather="disc"></i>
                            <span>Work Items</span>
                        </a>
                    </li> --}}

                    {{-- <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.item_categories') }}">
                            <i data-feather="grid"></i>
                            <span>Item Categories</span>
                        </a>
                    </li> --}}

                    {{-- <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.item_details') }}">
                            <i data-feather="life-buoy"></i>
                            <span>Item Details</span>
                        </a>
                    </li> --}}

                    {{-- <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.brand_specification') }}">
                            <i data-feather="stop-circle"></i>
                            <span>Item Brand Specification</span>
                        </a>
                    </li> --}}

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.budget-ranges.index') }}">
                            <i data-feather="stop-circle"></i>
                            <span>Budget Range</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.elemantra-notification.index') }}">
                            <i data-feather="bell"></i>
                            <span>Notification</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.help-support.index') }}">
                            <i data-feather="help-circle"></i>
                            <span>Help Support</span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="nav-link menu-title" href="{{ route('admin.change-password') }}">
                            <i data-feather="edit-3"></i>
                            <span>Change Password</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <form method="POST" action="{{ route('admin.logout') }}">
                            @csrf
                            <button class="nav-link menu-title" type="submit"
                                onclick="event.preventDefault();
							  this.closest('form').submit();">
                                <i data-feather="log-out"></i>
                                <span>Logout</span>
                            </button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- Page Sidebar Ends-->
