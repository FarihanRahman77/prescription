@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h3 class="text-center text-dark text-decoration-underline ">User List</h3>
                <div class="row">
                    @if(session()->has('message'))
                        <div class="alert alert-success">
                            {{ session()->get('message') }} 
                        </div>
                    @endif
                   <div class="table-responsive">
                        <table id="manageUserTable" width="100%" class="table table-bordered table-hover ">
                            <thead>
                                <tr>
                                    <td width="6%">ID</td>
                                    <td>Full Name</td>
                                    <td>Contact</td>
                                    <td>Dep./Des.</td>
                                    <td>Status</td>
                                    <td width="8%">ACTION</td>
                                </tr>
                            </thead>
                            <tbody>
                                @php 
                                $i=1;
                                @endphp
                                @foreach ($users as $user) 
                                @php 
                                    if($user->status == 'Active')
                                    {
                                        $statusColor ="color:green";
                                        $statusIcon = "fas fa-check-circle";
                                    }else{
                                        $statusColor = "color:red";
                                        $statusIcon = "fas fa-times-circle";
                                    }
                                @endphp
                    		    <tr>
                    		        <td>{{$i++}}</td>
                    		        <td>{{$user->name}}</td>
                    		        <td>Email: {{$user->email}}<br>Mobile: {{$user->mobile}}</td>
                    		        <td>Designation: {{$user->designation}}</td>
                    		        <td>{{$user->status}}</td>
                    		        <td style="width: 12%;">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                            <i class="fas fa-cog"></i>  <span class="caret"></span></button>
                                            <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                                @if (Auth::guard('web')->user()->can('User Edit'))
                                                <li class="action"><a href="{{route('userEdit',['id'=>$user->id])}}" class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                                                @endif
                                                @if (Auth::guard('web')->user()->can('User Delete'))
                                                <li class="action"><a   class="btn" href="{{route('userDelete',['id'=>$user->id])}}" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                                @endif
                                            </ul>
                                        </div>
                                    </td>
                    		    </tr>
                    		    @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <br><br>
    <script>
        $(document).ready( function () {
            $('#manageUserTable').DataTable();
        } );
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
@endsection

