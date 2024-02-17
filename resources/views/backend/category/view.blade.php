@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 p-4">
                    <h4 class="text-center">Category</h4>
                </div>
                <div class="col-md-12 ">
                    <span class="text-success text-center" id="message"></span>
                </div>
                <div class="col-md-12 row m-3">
                    @if (Auth::guard('web')->user()->can('Category Create'))
                    <div class="col-md-3 m-3 row" style="height:100px;">
                        <h5 class="text-center">Add Category</h5>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="category_name" name="category_name" placeholder="Category Name">
                            <span class="text-danger" id="category_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Type</label>
                            <select class="form-select" id="category_type" name="category_type" >
                                <option value="">Select category type</option>
                                <option value="pre_filled">Pre Filled</option>
                                <option value="fillable">Fillable</option>
                            </select>
                            <span class="text-danger" id="category_type_error"></span>
                        </div>
                        <div class=" col-md-12 m-2 ">
                            <span class="btn btn-primary text-center" onclick="submit()">Submit</span>
                        </div>
                    </div>
                    @endif
                    <div class="col-md-8 m-3">
                        
                        <div class="table">
                            <table id="manageCategoryTable" width="100%" class="table table-bordered  table-hover m-0">
                                <thead>
                                    <tr>
                                        <td >SL.</td>
                                        <td>Category Name</td>
                                        <td>Type</td>
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
                        <h5 class="modal-title">Edit Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row">
                        <input class="form-control" type="hidden" id="edit_id" name="id" placeholder="Category Name">
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="edit_category_name" name="edit_category_name" placeholder="Category Name">
                            <span class="text-danger" id="edit_category_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Type</label>
                            <select class="form-select" id="edit_category_type" name="edit_category_type" >
                                <option value="">Select category type</option>
                                <option value="pre_filled">Pre Filled</option>
                                <option value="fillable">Fillable</option>
                            </select>
                            <span class="text-danger" id="edit_category_type_error"></span>
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
		table = $('#manageCategoryTable').DataTable({
			'ajax': "{{route('getCategories')}}",
			processing:true,
		});
	}) 

    function reset(){
        $('#category_name').val('');
        $('#category_type').val('');
    }


    function submit(){
        var category_name=$('#category_name').val();
        var category_type=$('#category_type').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
					url:"{{route('category.store')}}",
					method: "POST",
					data: {"category_name":category_name,'category_type':category_type, "_token":_token},
					success: function (result) {
						//alert(JSON.stringify(result));
                        $('#message').text(result);
                        location.reload();
                        reset();
					}, error: function(response) {
                       // alert(JSON.stringify(response));
                        $('#category_name_error').text(response.responseJSON.errors.category_name);
                        $('#category_type_error').text(response.responseJSON.errors.category_type);
					}, beforeSend: function () {
						$('#loading').show();
					},complete: function () {
						$('#loading').hide();
					}
				});
    }


    function editCategory(id){
        $.ajax({
                url:"{{route('get.editCategory')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#editModal').modal('show');
                    $('#edit_id').val(result.id);
                    $('#edit_category_name').val(result.name);
                    $('#edit_category_type').val(result.type);
                    $('#edit_status').val(result.status);
                }, error: function(response) {
                    //alert(JSON.stringify(response));
                    /*  */
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }



    function updateCategory(){
        var category_name=$('#edit_category_name').val();
        var category_type=$('#edit_category_type').val();
        var status=$('#edit_status').val();
        var id=$('#edit_id').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
		var fd = new FormData();
		fd.append('name',category_name);
		fd.append('type',category_type);
		fd.append('status',status);
		fd.append('id',id);
		fd.append('_token',_token);
		$.ajax({
			url:"{{route('categories.update')}}",
			method:"POST",
			data:fd,
			contentType: false,
			processData: false,
			success:function(result){
                //alert(JSON.stringify(result));
				$("#editModal").modal('hide');
                $('#message').text(result);
                location.reload();
			}, 
			error: function(response) {
               // alert(JSON.stringify(response));
				$('#edit_category_name_error').text(response.responseJSON.errors.name);
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
                url:"{{route('deleteCategory')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                   // alert(JSON.stringify(result));
                    $('#message').text(result);
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