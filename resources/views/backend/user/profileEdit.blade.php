@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h3 class="text-center text-dark text-decoration-underline ">User Profile</h3>
                <div class="row">
                   <div class="row">
                       <form action="{{route('updateUser')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" value="{{$user->id}}" name="id">
                            <div class="form-group col-md-6">
                                <label> Full Name <span class="text-danger"> * </span></label>
                                <input class="form-control" id="name" type="text" name="name" value="{{ $user->name }}">
                                <span class="text-danger" id="nameError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="email" id="email" name="email" value="{{ $user->email }}">
                                <span class="text-danger" id="emailError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Mobile No <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="text" id="mobile_no" name="mobile_no" value="{{ $user->mobile }}">
                                <span class="text-danger" id="mobileError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Password <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="password" id="password" name="old_password" placeholder="Old Password">
                                <span class="text-danger" id="passwordError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Password <span class="text-danger"> * </span></label>
                                <input class="form-control input-sm" type="password" id="password" name="new_password" placeholder="New Password">
                                <span class="text-danger" id="passwordError"></span>
                            </div>
                           
                            <div class="form-group col-md-6">
                                <label>Address</label>
                                <input class="form-control input-sm" id="address" type="text" name="address" value="{{ $user->address }}">
                                <span class="text-danger" id="addressError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Designation</label>
                                <input class="form-control input-sm" id="designation" type="text" name="designation" value="{{ $user->designation }}">
                                <span class="text-danger" id="designationError"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Role</label>
                                <select class="form-control input-sm" id="role" type="text" name="role" placeholder=" Write designation">
                                    <option value="0" selected>Select Role</option>
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