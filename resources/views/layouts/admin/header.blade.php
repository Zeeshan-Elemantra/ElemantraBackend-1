<!-- Page Header Start-->
<div class="page-main-header">
    <div class="main-header-right row m-0">
        <div class="main-header-left">
            <div class="logo-wrapper"><a href="{{ route('admin.home') }}"><img class="img-fluid"
                        src="{{ asset('admin/assets/images/logo/elemantra_logo.png') }}" style="height: 29px;"
                        alt=""></a></div>
            <div class="dark-logo-wrapper"><a href="{{ route('admin.home') }}"><img class="img-fluid"
                        src="{{ asset('admin/assets/images/logo/dark-logo.png') }}" alt=""></a></div>
            @if (!request()->routeIs('admin.login'))
                <div class="toggle-sidebar"><i class="status_toggle middle" data-feather="align-center"
                        id="sidebar-toggle"></i></div>
            @endif
        </div>

        <div class="nav-right col pull-right right-menu p-0">
            <ul class="nav-menus">
                @auth('admin')
                    <li class="onhover-dropdown p-0">
                        <form method="POST" action="{{ route('admin.logout') }}">
                            @csrf
                            <button class="btn btn-primary-light" type="button"
                                onclick="event.preventDefault();
							this.closest('form').submit();"><i
                                    data-feather="log-out"></i> Logout</button>
                        </form>
                    </li>
                @endauth
            </ul>
        </div>
        <div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
    </div>
</div>
<!-- Page Header Ends -->
