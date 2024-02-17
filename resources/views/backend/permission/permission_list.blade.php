@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 p-4">
                    <h4 class="text-center">Permissions</h4>
                </div>
                <div class="col-md-12 ">
                    <span class="text-success text-center float-right" id="message"></span>
                </div>
                <div class="col-md-12 row m-3">
                    <div class="col-md-3 m-3 row" style="height:100px;">
                        <h5 class="text-center">Add Permission</h5>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Group Name</label>
                            <input class="form-control" id="group_name" name="group_name" placeholder="Group Name">
                            <span class="text-danger" id="group_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="name" name="name" placeholder="Name">
                            <span class="text-danger" id="name_error"></span>
                        </div>
                        
                        <div class=" col-md-12 m-2 ">
                            <span class="btn btn-primary text-center" onclick="submit()">Submit</span>
                        </div>
                    </div>
                    <div class="col-md-8 m-3">
                        
                        <div class="table">
                            <table id="managePermissionTable" width="100%" class="table table-bordered  table-hover m-0">
                                <thead>
                                    <tr>
                                        <td >SL.</td>
                                        <td>Group Name</td>
                                        <td>Name</td>
                                        <td >Status</td>
                                        <td >ACTION</td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
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