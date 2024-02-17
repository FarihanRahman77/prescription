@extends('backend.layouts.master')

@section('content')
    <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary  m-0" style="height:auto;">
                <div class="col-md-12 ">
                    <h4 class="text-center"><u>Employees</u></h4>
                </div>
                <div class="col-md-12 ">
                    <span class="text-success text-center" id="message"></span>
                </div>
                <div class="col-md-12 row m-1">
                    @if (Auth::guard('web')->user()->can('Employee Create'))
                    <div class="col-md-3  row" style="min-height:530px;">
                        <h5 class="text-center">Add Employee</h5>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="employee_name" name="employee_name" placeholder="Employee Name">
                            <span class="text-danger" id="employee_name_error"></span>
                        </div>
                        
                       <div class=" col-md-12 mb-3">
                            <label  class="form-label">Employee Designation</label>
                            <input class="form-control" id="employee_designation" name="employee_designation" placeholder="Employee serial">
                            <span class="text-danger" id="employee_designation_error"></span>
                        </div>
                        <div class=" col-md-12 m-2 ">
                            <span class="btn btn-primary text-center" onclick="submit()">Submit</span>
                        </div>
                    </div>
                    @endif
                    <div class="col-md-9 ">
                        
                        <div class="table">
                            <table id="manageEmployeeTable" width="100%" class="table table-bordered  table-hover m-0">
                                <thead>
                                    <tr>
                                        <td width="5%" >SL.</td>
                                        <td width="20%">Name</td>
                                        <td width="20%">Serial</td>
                                        <td width="20%">Designation</td>
                                        <td  width="20%">Status</td>
                                        <td  width="15%">ACTION</td>
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
                        <h5 class="modal-title">Edit Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row">
                        <input class="form-control" type="hidden" id="edit_id" name="id" >
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Name</label>
                            <input class="form-control" id="edit_employee_name" name="edit_employee_name" placeholder="Employee Name">
                            <span class="text-danger" id="edit_employee_name_error"></span>
                        </div>
                        <div class=" col-md-12 mb-3">
                            <label  class="form-label">Employee Designation</label>
                            <input class="form-control" id="edit_employee_designation" name="edit_employee_designation" >
                            <span class="text-danger" id="edit_employee_designation_error"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary me-auto" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updateEmployee()">Update</button>
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
		table = $('#manageEmployeeTable').DataTable({
			'ajax': "{{route('getEmployees')}}",
			processing:true,
		});
	}) 

    function reset(){
        $('#employee_name').val('');
        $('#employee_designation').val('');
    }


    function submit(){
        var employee_name=$('#employee_name').val();
        var employee_designation=$('#employee_designation').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
					url:"{{route('Employee.store')}}",
					method: "POST",
					data: { "name":employee_name,
        					"designation":employee_designation,
        					"_token":_token
					},
					success: function (result) {
						//alert(JSON.stringify(result));
                        $('#message').text(result);
                        location.reload();
                        reset();
					}, error: function(response) {
                        //alert(JSON.stringify(response));
                        $('#employee_name_error').text(response.responseJSON.errors.name);
                        $('#employee_designation_error').text(response.responseJSON.errors.employee_designation);
					}, beforeSend: function () {
						$('#loading').show();
					},complete: function () {
						$('#loading').hide();
					}
				});
    }


    function editemployee(id){
        $.ajax({
                url:"{{route('get.editEmployee')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#editModal').modal('show');
                    $('#edit_id').val(result.id);
                    $('#edit_employee_name').val(result.name);
                    $('#edit_employee_designation').val(result.designation);
                    $('#message').text(result);
                },error: function(response) {
                   //alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }



    function updateEmployee(){
        var employee_name=$('#edit_employee_name').val();
        var employee_designation=$('#edit_employee_designation').val();
        var id=$('#edit_id').val();
        var _token = $('meta[name="csrf-token"]').attr('content');
        
		var fd = new FormData();
		fd.append('name',employee_name);
		fd.append('designation',employee_designation);
		fd.append('id',id);
		fd.append('_token',_token);
		
		$.ajax({
			url:"{{route('Employees.update')}}",
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
				$('#edit_employee_name_error').text(response.responseJSON.errors.name);
                $('#edit_employee_designation_error').text(response.responseJSON.errors.designation);
			}, beforeSend: function () {
				$('#loading').show();
			},complete: function () {
				$('#loading').hide();
			}
		})
	}


    function confirmDelete(id){
        $.ajax({
            url:"{{route('deleteEmployee')}}",
            method: "GET",
            data: {
                "id":id
            },
            success: function (result) {
                //alert(JSON.stringify(result));
                $('#message').text(result);
                location.reload();
            }, error: function(response) {
               // alert(JSON.stringify(response));
            }, beforeSend: function () {
                $('#loading').show();
            },complete: function () {
                $('#loading').hide();
            }
        });
    }
    
    function QRCode(id){
        window.open("{{ url('/create/QR/code/pdf') }}" + "/" + id);
    }
    
    
    
    
    
</script>
@endsection