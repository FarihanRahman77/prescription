
@extends('backend.layouts.master')
@section('content')

    <div class="container mt-1">
       
       <div class="w-100 mx-auto p-5 shadow scroll-sidebar">
            @if(session()->has('message'))
                <div class="alert alert-success">
                    {{ session()->get('message') }}
                </div>
            @endif
            <div class="row">
                <div class="col-md-12">
                    <a class="btn btn-primary float-right" href="{{route('warrenty_list_excel')}}"><i class="fa fa-file-excel-o"></i> EXEL</a>
                </div>
            </div>
           <h3 style="text-align:center;"><u>Registration List</u></h3>
            <div class="table-responsive">
               <table id="datatable2" width="100%" class="table table-bordered table-hover" style="font-size:13px;">
                   <thead>
                   <tr>
                       <th width="3%" >SL</th>
                       <th width="20%">Reg No</th>
                       <th width="8%">Installation Date</th>
                       <th width="23%">Customer Info</th>
                       <th width="15%">Product Info</th>
                       <th width="8%">Registered By</th>
                       <th width="8%">Warrenty</th>
                       <th width="12%">Application Type</th>
                       <th width="3%">Action</th>
                   </tr>
                   </thead>
                   <tbody style="font-size:12px;">
                       @php 
                            $i=1;
                       @endphp
                       @foreach($warrenties as $warrenty)
                           @php 
                           $product=App\Models\Product::find($warrenty->product_id);
                           $warrenty_type=App\Models\WarrentyType::find($warrenty->warrenty_type);
                           $customer=App\Models\Customer::find($warrenty->customer_id);
                           @endphp
                       <tr>
                           <td>{{$i++}}</td>
                           <td>Reg Serial: {{$warrenty->reg_id}}<br> Reg No: {{$warrenty->registration_number}}</td>
                           <td>{{$warrenty->instalation_date}}</td>
                           <td>Company Name: {{$customer->company_name}}<br>Mobile: {{$customer->phone}}<br>Address: {{$customer->address}}, {{$customer->city}}, {{$customer->country}}</td>
                           <td>Name: {{$product->name}} - {{$product->model}} <br> Serial: {{$product->serial_no}} </td>
                           <td>{{$warrenty->registered_by}}</td>
                           <td>{{$warrenty_type->type}}</td>
                           <td>{{$warrenty->application_type}}</td>
                            <td style="width: 12%;">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                    <i class="fas fa-cog"></i>  <span class="caret"></span></button>
                                    <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                        @if (Auth::guard('web')->user()->can('Registration Details'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/details/registration',$warrenty->id)}}"><i class="fas fa-file-pdf"></i> Details </a></li>
                                        @endif
                                        @if (Auth::guard('web')->user()->can('Registration Attachment'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/attachment/registration',$warrenty->id)}}"><i class="fa-solid fa-paperclip"></i> Attachment </a></li>
                                        @endif
                                        @if (Auth::guard('web')->user()->can('Registration QR Code'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/generate/Warrenty/QR',$warrenty->id)}}"><i class="fa-solid fa-qrcode"></i> QR Code </a></li> 
                                        @endif
                                        @if (Auth::guard('web')->user()->can('Registration Edit'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/edit/registration',$warrenty->id)}}"><i class="fas fa-edit"></i> Edit </a></li>
                                        @endif
                                        @if (Auth::guard('web')->user()->can('Registration Delete'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/delete/registration',$warrenty->id)}}"><i class="fas fa-trash-alt"></i> Delete </a></li>
                                        @endif
                                    </ul>
                                </div>
                            </td>
                           
                       </tr>
                       @endforeach
                   </tbody>
               </table>
             </div>




           <!-- Modal -->
           <div id="updateModal" class="modal fade" role="dialog">
               <div class="modal-dialog">

                   <!-- Modal content-->
                   <div class="modal-content">
                       <div class="modal-header">
                           <h4 class="modal-title">Update</h4>
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                       </div>
                       <div class="modal-body">
                           <div class="form-group">
                               <label for="name" >Employee Name</label>
                               <input type="text" class="form-control" id="emp_name" placeholder="Enter Employee name" required>
                           </div>
                           <div class="form-group">
                               <label for="email" >Email</label>
                               <input type="email" class="form-control" id="email" placeholder="Enter email">
                           </div>
                           <div class="form-group">
                               <label for="gender" >Gender</label>
                               <select id='gender' class="form-control">
                                   <option value='Male'>Male</option>
                                   <option value='Female'>Female</option>
                               </select>
                           </div>
                           <div class="form-group">
                               <label for="city" >City</label>
                               <input type="text" class="form-control" id="city" placeholder="Enter city">
                           </div>

                       </div>
                       <div class="modal-footer">
                           <input type="hidden" id="txt_empid" value="0">
                           <button type="button" class="btn btn-success btn-sm" id="btn_save">Save</button>
                           <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                       </div>
                   </div>

               </div>
           </div>

       </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
 <script type="text/javascript">
    
    $(document).ready( function () {
        $('#datatable2').DataTable();
    } );
    
    
        var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');

        $(document).ready(function(){

            var table = $('#yajra-datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('get.search.data') }}",
                scrollY:        false,
                scrollX: true,
                columns: [
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'registration_number', name: 'registration_number'},
                    {data: 'serial_no', name: 'serial_no'},
                    {data: 'category_id', name: 'category_id'},
                    {data: 'product_id', name: 'product_id'},
                    {data: 'registered_by', name: 'registered_by'},
                    {data: 'instalation_date', name: 'instalation_date'},
                    {data: 'warrenty_type', name: 'warrenty_type'},
                    {data: 'application_type', name: 'application_type'},
                    {
                        data: 'action',
                        name: 'action',
                        orderable: true,
                        searchable: true
                    },
                ]
            });










            // // Update record
            // $('.updateUser').click(function(){
            //     var id = $(this).data('id');
            //
            //     $('#yajra-datatable').val(id);
            //
            //     alert( $('#txt_empid').val(id));

                // AJAX request
                {{--$.ajax({--}}
                {{--    url: "{{ route('getEmployeeData') }}",--}}
                {{--    type: 'post',--}}
                {{--    data: {_token: CSRF_TOKEN,id: id},--}}
                {{--    dataType: 'json',--}}
                {{--    success: function(response){--}}

                {{--        if(response.success == 1){--}}

                {{--            $('#emp_name').val(response.emp_name);--}}
                {{--            $('#email').val(response.email);--}}
                {{--            $('#gender').val(response.gender);--}}
                {{--            $('#city').val(response.city);--}}

                {{--            empTable.ajax.reload();--}}
                {{--        }else{--}}
                {{--            alert("Invalid ID.");--}}
                {{--        }--}}
                {{--    }--}}
                {{--});--}}

            // });

            // Save user
            {{--$('#btn_save').click(function(){--}}
            {{--    var id = $('#txt_empid').val();--}}

            {{--    var emp_name = $('#emp_name').val().trim();--}}
            {{--    var email = $('#email').val().trim();--}}
            {{--    var gender = $('#gender').val().trim();--}}
            {{--    var city = $('#city').val().trim();--}}

            {{--    if(emp_name !='' && email != '' && city != ''){--}}

            {{--        // AJAX request--}}
            {{--        $.ajax({--}}
            {{--            url: "{{ route('updateEmployee') }}",--}}
            {{--            type: 'post',--}}
            {{--            data: {_token: CSRF_TOKEN,id: id,emp_name: emp_name, email: email, gender: gender, city: city},--}}
            {{--            dataType: 'json',--}}
            {{--            success: function(response){--}}
            {{--                if(response.success == 1){--}}
            {{--                    alert(response.msg);--}}

            {{--                    // Empty and reset the values--}}
            {{--                    $('#emp_name','#email','#city').val('');--}}
            {{--                    $('#gender').val('Male');--}}
            {{--                    $('#txt_empid').val(0);--}}

            {{--                    // Reload DataTable--}}
            {{--                    empTable.ajax.reload();--}}

            {{--                    // Close modal--}}
            {{--                    $('#updateModal').modal('toggle');--}}
            {{--                }else{--}}
            {{--                    alert(response.msg);--}}
            {{--                }--}}
            {{--            }--}}
            {{--        });--}}

            {{--    }else{--}}
            {{--        alert('Please fill all fields.');--}}
            {{--    }--}}
            {{--});--}}

            // Delete record
            {{--$('#empTable').on('click','.deleteUser',function(){--}}
            {{--    var id = $(this).data('id');--}}

            {{--    var deleteConfirm = confirm("Are you sure?");--}}
            {{--    if (deleteConfirm == true) {--}}
            {{--        // AJAX request--}}
            {{--        $.ajax({--}}
            {{--            url: "{{ route('deleteEmployee') }}",--}}
            {{--            type: 'post',--}}
            {{--            data: {_token: CSRF_TOKEN,id: id},--}}
            {{--            success: function(response){--}}
            {{--                if(response.success == 1){--}}
            {{--                    alert("Record deleted.");--}}

            {{--                    // Reload DataTable--}}
            {{--                    empTable.ajax.reload();--}}
            {{--                }else{--}}
            {{--                    alert("Invalid ID.");--}}
            {{--                }--}}
            {{--            }--}}
            {{--        });--}}
            {{--    }--}}

            {{--});--}}

        });





    </script>
@endsection