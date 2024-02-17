@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 p-4">
                    <h4 class="text-center">Roles To Permission</h4>
                </div>
                <a href="{{route('role_to_permissions_create')}}" class="btn btn-primary float-right">Assign Role to Permission</a>
                <div class="col-md-12 ">
                    <span class="text-success text-center float-right" id="message"></span>
                </div>
                <div class="col-md-12 row m-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="data_Table" width="100%">
                                    <thead>
                                        <tr class="bg-light">
                                            <td width="5%" class="text-center">Sl</td>
                                            <td width="15%">Role Name</td>
                                            <td width="80%">Permissions</td>
                                            <!--<td width="8%" class="text-center">Action</td>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $i = 1;
                                        @endphp
                                        @foreach ($roles as $role)
                                            <tr>
                                                <td class="text-center">{{ $i++ }}</td>
                                                <td>{{ $role->name }}</td>
                                                <td>
                                                    @foreach ($role->permissions as $perm)
                                                        <span class="badge badge-primary">{{ $perm->name }}</span>
                                                    @endforeach
                                                </td>
        
                                                <!--<td>-->
                                                <!--    <div class="dropdown">-->
                                                <!--        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">-->
                                                <!--        <i class="fas fa-cog"></i>-->
                                                <!--        </button>-->
                                                <!--        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">-->
                                                <!--        <li class="action">-->
                                                <!--            <a href="{{ route('roleDelete', $role->id) }}"  class="btn">-->
                                                <!--                <i class="fas fa-trash-alt"></i> -->
                                                <!--                Delete -->
                                                <!--            </a>-->
                                                <!--        </li>-->
                                                <!--        </ul>-->
                                                <!--    </div>-->
                                                <!--</td>-->
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div><!-- Card Content end -->
                </div>
            </div>
        </div>

        <div class="edit-modal">
            <div class="modal" tabindex="-1" id="editModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Role</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row">
                        <input class="form-control" type="hidden" id="edit_id" name="id" placeholder="Role Name">
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Group Name</label>
                            <input class="form-control" id="edit_group_name" name="edit_group_name" placeholder="Role Name">
                            <span class="text-danger" id="edit_group_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="edit_name" name="edit_name" placeholder="Role Name">
                            <span class="text-danger" id="edit_name_error"></span>
                        </div>
                        
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Status</label>
                            <select class="form-select" id="edit_status" name="edit_status" >
                                <option value="">Select status</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                            <span class="text-danger" id="edit_status_error"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary me-auto" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updateCategory()">Update</button>
                    </div>
                    </div>
                </div>
            </div>
        </div>

    </div> 
@endsection

@section('javascript')

<script>


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