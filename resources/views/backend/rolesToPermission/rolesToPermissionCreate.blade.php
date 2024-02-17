@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 p-4">
                    <h4 class="text-center">Assign Roles To Permission</h4>
                </div>
               
                <div class="col-md-12 ">
                    <span class="text-success text-center float-right" id="message"></span>
                </div>
                <div class="col-md-12 row m-3">
                    <form method="POST" action="{{ route('roleToPermissionStore') }}">
                        @csrf
                        <div class="row">

                            <div class="form-group col-md-12">
                                <label for="email" class=" col-form-label">Role Name :<span
                                        class="text-danger"> * </span></label>
                                <select class="form-control" name="role_id" id="role_id"
                                    onchange="checkRole()">
                                    <option value="" disabled selected>Select Roles</option>
                                    @foreach ($roles as $role)
                                        <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                <p class="font-weight-bold">Permissions</p>
                                <div class="form-check ">
                                    <input class="form-check-input" type="checkbox" id="checkPermissionAll"
                                        value="1">
                                    <label class="form-check-label" for="checkPermissionAll">All</label>
                                </div>
                                @php
                                    $i = 1;
                                @endphp
                                @foreach ($permission_groups as $group)
                                    <div class="row" style="border: 1px solid #eaeaea;">
                                        <div class="col-md-6" style="border-right: 1px solid #eaeaea;">
                                            <div class="form-check">
                                                <input name="permissions[]" class="form-check-input"
                                                    type="checkbox" id="{{ $i }}Management"
                                                    value="{{ $group->name }}"
                                                    onclick="checkPermissionByGroup('role-{{ $i }}-management-checkBox',this)">
                                                <label class="form-check-label text-capitalize"
                                                    for="checkPermission">{{ $group->name }}</label>
                                            </div>
                                        </div>
                                        <div class="role-{{ $i }}-management-checkBox col-md-6">
                                            @php
                                                $permissionss = App\Models\User::getPermissionsByGroupName($group->name);
                                                $j = 1;
                                            @endphp
                                            @foreach ($permissionss as $permission)
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        name="permissions[]"
                                                        id="checkPermission{{ $permission->id }} "
                                                        value="{{ $permission->name }} ">
                                                    <label class="form-check-label text-capitalize"
                                                        for="checkPermission{{ $permission->id }}">{{ $permission->name }}</label>
                                                </div>
                                                @php
                                                    $j++;
                                                @endphp
                                            @endforeach
                                        </div>
                                    </div>
                                    <br>
                                    @php
                                        $i++;
                                    @endphp
                                @endforeach
                            </div>
                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn  btn-primary"><i class="fa fa-save"></i>
                                Save</button>
                        </div>
                    </form>  
                </div>
            </div>
        </div>
    </div> 
@endsection

@section('javascript')

<script>

    $(document).ready(function() {
        $('#role_id').select2({
            placeholder: "Select Roles",
            allowClear: true,
            width: '100%'
        });
    });
        
        
    var table;
	$(document).ready(function() {
		table = $('#managePermissionTable').DataTable({
			'ajax': "{{route('getPermission')}}",
			processing:true,
		});
	}) 

        
        
    function reset(){
        $('#group_name').val('');
    }

        $("#checkPermissionAll").click(function() {
            if ($(this).is(':checked')) {
                $("input[type=checkbox]").prop('checked', true);
            } else {
                $("input[type=checkbox]").prop('checked', false);
            }
        });


        function checkPermissionByGroup(className, checkThis) {
            const groupIdName = $("#" + checkThis.id);
            const classCheckBox = $('.' + className + ' input');
            if (groupIdName.is(':checked')) {
                classCheckBox.prop('checked', true);
            } else {
                classCheckBox.prop('checked', false);
            }
        }

    function submit(){
        var group_name=$('#group_name').val();
        var name=$('#name').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
					url:"{{route('permission.store')}}",
					method: "POST",
					data: {"group_name":group_name,"name":name,"_token":_token},
					success: function (result) {
						//alert(JSON.stringify(result));
                        $('#message').text(result.success);
                        location.reload();
                        reset();
					}, error: function(response) {
                        //alert(JSON.stringify(response));
                        $('#group_name_error').text(response.responseJSON.errors.group_name);
					}, beforeSend: function () {
						$('#loading').show();
					},complete: function () {
						$('#loading').hide();
					}
				});
    }


    function editCategory(id){
        $.ajax({
                url:"{{route('editPermission')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#editModal').modal('show');
                    $('#edit_id').val(result.id);
                    $('#edit_group_name').val(result.group_name);
                    $('#edit_name').val(result.name);
                    $('#edit_status').val(result.status);
                }, error: function(response) {
                    //alert(JSON.stringify(response));
                    
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }



    function updateCategory(){
        var group_name=$('#edit_group_name').val();
        var name=$('#edit_name').val();
        var status=$('#edit_status').val();
        var id=$('#edit_id').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
		var fd = new FormData();
		fd.append('group_name',group_name);
		fd.append('name',name);
		fd.append('status',status);
		fd.append('id',id);
		fd.append('_token',_token);
		$.ajax({
			url:"{{route('permission.update')}}",
			method:"POST",
			data:fd,
			contentType: false,
			processData: false,
			success:function(result){
                //alert(JSON.stringify(result));
				$("#editModal").modal('hide');
                $('#message').text(result.success);
                location.reload();
			}, 
			error: function(response) {
                //alert(JSON.stringify(response));
				$('#edit_group_name_error').text(response.responseJSON.errors.group_name);
                $('#edit_category_type_error').text(response.responseJSON.errors.type);
                $('#edit_status_error').text(response.responseJSON.errors.status);
			}, beforeSend: function () {
				$('#loading').show();
			},complete: function () {
				$('#loading').hide();
			}
		})
	}


    function confirmDelete(id){
        $.ajax({
                url:"{{route('deletePermission')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#message').text(result.success);
                    location.reload();
                }, error: function(response) {
                    //alert(JSON.stringify(response));
                    
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
</script>
@endsection