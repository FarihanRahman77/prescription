@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 ">
                    <h4 class="text-center"><u>Product</u></h4>
                </div>
                <div class="col-md-12 ">
                    <span class="text-success text-center" id="message"></span>
                </div>
                <div class="col-md-12 row m-1">
                    @if (Auth::guard('web')->user()->can('Product Create'))
                    <div class="col-md-3  row" style="min-height:530px;">
                        <h5 class="text-center">Add Product</h5>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="product_name" name="product_name" placeholder="Product Name">
                            <span class="text-danger" id="product_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Model</label>
                            <input class="form-control" id="model" name="model" placeholder="Product model">
                            <span class="text-danger" id="model_error"></span>
                        </div> 
                       <div class=" col-md-12 mb-3">
                            <label  class="form-label">Serial No.</label>
                            <input class="form-control" id="product_serial" name="product_serial" placeholder="Product serial">
                            <span class="text-danger" id="product_serial_error"></span>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label  class="form-label">Category</label>
                            <select class="form-select" id="category_id" name="category_id" >
                                <option value="">Select Category</option>
                                @foreach($categories as $category)
                                <option value="{{$category->id}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                            <span class="text-danger" id="category_id_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Dispatch Ex Factory Date</label>
                            <input type="date" class="form-control" id="ex_factory_date" name="ex_factory_date" >
                            <span class="text-danger" id="ex_factory_date_error"></span>
                        </div>
                        
                        <div class=" col-md-12 m-2 ">
                            <span class="btn btn-primary text-center" onclick="submit()">Submit</span>
                        </div>
                    </div>
                    @endif
                    <div class="col-md-9 ">
                        
                        <div class="table">
                            <table id="manageProductTable" width="100%" class="table table-bordered  table-hover m-0">
                                <thead>
                                    <tr>
                                        <td width="5%" >SL.</td>
                                        <td width="15%">Ex Factory Date</td>
                                        <td width="20%">Name</td>
                                        <td width="10%">Model</td>
                                        <td width="20%">Category</td>
                                        <td width="20%">Serial No</td>
                                        <td  width="5%">Status</td>
                                        <td  width="5%">ACTION</td>
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
                        <h5 class="modal-title">Edit Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row">
                        <input class="form-control" type="hidden" id="edit_id" name="id" >
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="edit_product_name" name="edit_product_name" placeholder="Product Name">
                            <span class="text-danger" id="edit_product_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Type</label>
                            <input class="form-control" id="edit_product_serial" name="edit_product_serial" >
                            <span class="text-danger" id="edit_product_serial_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Model</label>
                            <input class="form-control" id="edit_model" name="edit_model" >
                            <span class="text-danger" id="edit_model_error"></span>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label  class="form-label">Ex Factory Date</label>
                            <input type="date" class="form-control" id="edit_ex_factory_date" name="edit_ex_factory_date" >
                            <span class="text-danger" id="edit_ex_factory_date_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Category</label>
                            <select class="form-select" id="edit_category_id" name="edit_category_id" >
                                <option value="">Select Category</option>
                                @foreach($categories as $category)
                                <option value="{{$category->id}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                            <span class="text-danger" id="edit_category_id_error"></span>
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
                        <button type="button" class="btn btn-primary" onclick="updateProduct()">Update</button>
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
		table = $('#manageProductTable').DataTable({
			'ajax': "{{route('getProducts')}}",
			processing:true,
		});
	}) 

    function reset(){
        $('#product_name').val('');
       /*  $('#product_model').val(''); */
        $('#product_serial').val('');
        $('#category_id').val('');
    }


    function submit(){
        var product_name=$('#product_name').val();
        var model=$('#model').val();
         var ex_factory_date=$('#ex_factory_date').val(); 
        var product_serial=$('#product_serial').val();
        var category_id=$('#category_id').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
					url:"{{route('product.store')}}",
					method: "POST",
					data: {"name":product_name,'serial':product_serial,'category_id':category_id, "_token":_token,"ex_factory_date":ex_factory_date,"model":model},
					success: function (result) {
						//alert(JSON.stringify(result));
                        $('#message').text(result);
                        location.reload();
                        reset();
					}, error: function(response) {
                        //alert(JSON.stringify(response));
                        $('#product_name_error').text(response.responseJSON.errors.name);
                       $('#model_error').text(response.responseJSON.errors.model); 
                        $('#product_serial_error').text(response.responseJSON.errors.product_serial);
                        $('#category_id_error').text(response.responseJSON.errors.category_id);
                        $('#ex_factory_date_error').text(response.responseJSON.errors.ex_factory_date);
					}, beforeSend: function () {
						$('#loading').show();
					},complete: function () {
						$('#loading').hide();
					}
				});
    }


    function editProduct(id){
        $.ajax({
                url:"{{route('get.editProduct')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#editModal').modal('show');
                    $('#edit_model').val(result.model);
                    $('#edit_ex_factory_date').val(result.ex_factory_date);
                    $('#edit_id').val(result.id);
                    $('#edit_product_name').val(result.name);
                    $('#edit_product_serial').val(result.serial_no);
                    $('#edit_category_id').val(result.category_id);
                    $('#edit_status').val(result.status);
                }, error: function(response) {
                   // alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }



    function updateProduct(){
        var product_name=$('#edit_product_name').val();
        var model=$('#edit_model').val(); 
        var product_serial=$('#edit_product_serial').val();
        var category_id=$('#edit_category_id').val();
        var ex_factory_date=$('#edit_ex_factory_date').val();
        var status=$('#edit_status').val();
        var id=$('#edit_id').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
		var fd = new FormData();
		fd.append('name',product_name);
		fd.append('serial',product_serial);
		fd.append('model',model);
		fd.append('category_id',category_id);
		fd.append('ex_factory_date',ex_factory_date);
		fd.append('status',status);
		fd.append('id',id);
		fd.append('_token',_token);
		$.ajax({
			url:"{{route('products.update')}}",
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
               //alert(JSON.stringify(response));
				$('#edit_category_name_error').text(response.responseJSON.errors.name);
                $('#edit_model_error').text(response.responseJSON.errors.model);
                $('#edit_category_type_error').text(response.responseJSON.errors.type);
                $('#edit_ex_factory_date_error').text(response.responseJSON.errors.ex_factory_date);
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
                url:"{{route('deleteProduct')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
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