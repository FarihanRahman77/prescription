  <div class="container mt-3 ml-3">
    <div class="row">
        <div class="col-md-2"><img src="{{asset('backend/image/logo.png')}}" alt="" width="200px"></div>
        <div class="col-md-10"><p class="h2 text-right  m-2 p-2">Trident Agency Ltd.</p></div>
    </div>
  </div>

    <nav class="navbar navbar-expand-lg navbar-white bg-light">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav m-auto">
            <li class="nav-item active">
              <a class="nav-link" href="{{ route('home') }}">Home</a>
            </li>
            @if (Auth::guard('web')->user()->can('Registration'))
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Registration
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    @if (Auth::guard('web')->user()->can('Registration Create'))
                    <a class="dropdown-item" href="{{route('warrenty.add.registration') }}">New Registration</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Registration List'))
                    <a class="dropdown-item" href="{{route('search.view')}}">All Registration</a>
                    @endif
                </div>
            </li>
            @endif
            <!---- Claims-->
            @if (Auth::guard('web')->user()->can('Claim'))
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Warrenty Claims
                </a>
                
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    @if (Auth::guard('web')->user()->can('Claim Create'))
                    <a class="dropdown-item" href="{{route('newClaim')}}">New Claim</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Claim List'))
                    <a class="dropdown-item" href="{{route('allClaim')}}">All Claim</a>
                    @endif
                </div>
            </li>
            @endif
            
            <!---- services-->
            @if (Auth::guard('web')->user()->can('Service'))
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Services
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    @if (Auth::guard('web')->user()->can('Service Create'))
                    <a class="dropdown-item" href="{{route('create_service')}}">Add Service</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Service List'))
                    <a class="dropdown-item" href="{{route('service_list')}}">Service List</a>
                    @endif
                </div>
            </li>
            @endif
            
           @if (Auth::guard('web')->user()->can('User'))
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    User Management
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    @if (Auth::guard('web')->user()->can('User Create'))
                    <a class="dropdown-item" href="{{route('profile')}}">Add</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('User List'))
                    <a class="dropdown-item" href="{{route('user_list')}}">User List</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Roles'))
                    <a class="dropdown-item" href="{{route('roles_list')}}">Roles</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Permission'))
                    <a class="dropdown-item" href="{{route('permissions_list')}}">Permissions</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Permission'))
                    <a class="dropdown-item" href="{{route('role_to_permissions')}}">Role to Permissions</a>
                    @endif
                </div>
            </li>
            @endif
            @if (Auth::guard('web')->user()->can('Shop Setting'))
             <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Settings
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    @if (Auth::guard('web')->user()->can('Category'))
                    <a class="dropdown-item" href="{{route('category')}}">Category</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Product'))
                    <a class="dropdown-item" href="{{route('product')}}">Product</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Spare Parts'))
                    <a class="dropdown-item" href="{{route('productParts')}}">Product Parts</a>
                    @endif
                    @if (Auth::guard('web')->user()->can('Employee'))
                    <a class="dropdown-item" href="{{route('employees_list')}}">Employees</a>
                    @endif
                    @if (Auth::user()->role == 'Super Admin') 
                    
                    <a class="dropdown-item" href="{{route('shopSettingView')}}">Shop Setting</a>
                    @endif
                </div>
            </li>
            @endif
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Log Off
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <!---  <a class="dropdown-item" href="#">Change Password</a>--->
                <a class="dropdown-item" href="{{ route('logout') }}"onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    Log out
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
              </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{Auth::user()->name}}
                </a>
            </li>
          </ul>
        </div>
    </nav>
