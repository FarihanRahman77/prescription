@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h3 class="text-center text-dark text-decoration-underline ">User Profile</h3>
                <div class="row">
                   <div class="row">
                       <form action="{{route('saveUser')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            
                            <div class="form-group col-md-6">
                                <label> Full Name <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" id="name" type="text" name="name" placeholder=" Write Full Name" >
                                @error('name')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="email" id="email" name="email" placeholder=" Write email">
                                @error('email')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label>Mobile No <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="text" id="mobile_no" name="mobile_no" placeholder=" Write mobile no">
                                @error('mobile_no')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label>Password <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="password" id="password" name="password" placeholder=" Write password">
                               @error('password')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                           
                            <div class="form-group col-md-6">
                                <label>Address</label>
                                <input class="form-control input-sm" id="address" type="text" name="address" placeholder=" Write address">
                                @error('address')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label>Designation</label>
                                <input class="form-control input-sm" id="designation" type="text" name="designation" placeholder=" Write designation">
                                @error('designation')<div class="alert alert-danger">{{ $message }}</div>@enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label>Role</label>
                                <select class="form-control input-sm" id="role" type="text" name="role" placeholder=" Write designation">
                                    @foreach($roles as $role)
                                    <option value="{{$role->name}}">{{$role->name}}</option> 
                                    @endforeach
                                </select>
                                
                            </div>
                            
                           <!---- <div class="form-group col-md-6">
                                <label for="">Image</label>
                                <input type="file" name="image" id="image" 
                                       class="form-control form-control-sm">
                                <span class="text-danger" id="imageError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <img id="showImage" src="{{ asset('upload/no_image.png') }}"
                                     style="width: 100px;height: 110px; border:1px solid #000000">
                            </div>---->
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary btnSave float-right" ><i class="fa fa-save"></i> Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <br><br>
    
  
@endsection

@section('javascript')
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script>

    $('#image').change(function(e) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#showImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            }); 

    
</script>
@endsection