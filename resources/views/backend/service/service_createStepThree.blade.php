@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <input type="hidden" id="reg_id" value="{{$registration_id}}"> 
                <input type="hidden" id="engineer_id" value="{{$id}}"> 
                <div class="row">
                    <div class=" col-md-12 content  w-75 h-auto m-auto">
                    <h5 class="text-center text-dark text-decoration-underline ">Create New Service</h5>
                    <p class="text-center text-dark text-decoration-underline "><strong>Step 3</strong></p>
                    <span>Please  copy the token from Spare Parts QR code and paste it here.</span><br>
                    <div class="row">
                        <div class="row col-md-12">
                            <span class="text-success" id="alertSuccess"></span>
                            <span class="text-danger" id="alertDanger" ></span>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Spare Parts Token</label>
                            <input type="password" id="spare_parts_token_no" name="spare_parts_token_no" class="form-control input-sm" style="width:100%" >
                        </div>
                        <div class="form-group col-md-6">
                            <label>Run Hours</label>
                            <input type="number" id="run_hour" name="run_hour" class="form-control input-sm" style="width:100%" >
                            <span class="text-danger" id="run_hourError"></span>
                        </div>
                        
                        <div class="form-group col-md-12"><br>
                            <label>Parts Details: </label>
                            <table border="1" style="font-size: 13px; width:100%;" class="table-bordered" >
                                <thead >
                                    <tr>
                                        <th>SL</th>
                                        <th c>Product Info</th>
                                        <th class="text-center">Available</th>
                                        <th class="text-center" style="width: 10%;">Qty</th>
                                        <th class="text-right" style="width: 14%;">Unit Price</th>
                                        <th class="text-right" style="width: 14%;">Total</th>
                                        <th class="text-center" style="width: 6%;">Actions</th>
                                    </tr>
                                    
                                </thead>
                                <tbody id="managePartTable"></tbody>
                            </table>
                        </div>
                        <div class="form-group col-md-12">
                            <label>Remarks</label>
                            <input type="text" id="remarks" name="remarks" class="form-control input-sm" style="width:100%" >
                            <span class="text-danger" id="remarksError"></span>
                        </div>
                        <div class="container row col-md-12 p-2">
                            <div class="col-md-2"><span onclick="clearSession()" id ="clerSessionBtn" style="display:none;" class="btn btn-danger">Clear All Data</span></div>
                            <div class="col-md-3"></div>
                            <div class="col-md-4"><span class="text-danger" id="exceed"></span></div>
                            <div class="col-md-2"></div>
                            <div class="col-md-1 "><span class="btn btn-primary" onclick="submitFormOne()">Submit</span></div>
                        </div>
                    </div>
                </div>
                
                </div>
                
                <br>
            </div>
        </div>
    </div> 
    <br><br>
    
  
@endsection

@section('javascript')
<script>
    $(document).ready(function() {
        $('#currency').select2();
        $('#part').select2();
    });
    
    
    
   $(document).ready(function() {
        var spare_parts_token_no = document.querySelector('#spare_parts_token_no');
        
        spare_parts_token_no.onpaste = function() {
        	setTimeout(function() {
        	    var token = spare_parts_token_no.value;
        	    var qty =1;
            	$.ajax({
                    url:"{{route('service.product.add.to.session')}}",
                    method: "GET",
                    data: {
                        "token":token,
                        "qty":qty
                    },
                    success: function (result){
                       // alert(JSON.stringify(result));
                        
                        if(result = 'Error'){
                            $('#alertDanger').text('Opps! Something wrong.');
                        }
                            fetchCart();
                            $('#alertDanger').text(' ');
                        
                        
                    }, error: function(response){
                        //alert(JSON.stringify(response));
                        $('#alertDanger').val('Opps! Something wrong.');
                    }, beforeSend: function () {
                        $('#loading').show();
                    },complete: function () {
                        $('#loading').hide();
                    }
                });
            });
        };
     });
    
    
    
   
    
    fetchCart();
    
     function fetchCart() {
            $.ajax({
                url: "{{ route('service.fetchSession') }}",
                method: "get",
                success: function(result) {
                    //alert(JSON.stringify(result));
                    $("#managePartTable").html(result.cart);
                    $("#totalAmount").text(result.totalAmount);
                    if(result != 'null'){
                        $("#clerSessionBtn").show();
                    }
                    $('#spare_parts_token_no').val('');
                    //calculateTotal();
                },
                error: function(response) {
                    //alert(JSON.stringify(response));
                    
                   
                }
            })
        }
        
    function loadCartandUpdate(id){
        var product_quantity = $('#quantity_' + id).val();
        var unitPrice = $('#unitPrice_' + id).val();
        $.ajax({
                url:"{{route('service.updateSession')}}",
                method: "GET",
                data: {
                    "id":id,
                    "quantity":product_quantity,
                    "unitPrice":unitPrice,
                },
                success: function (result){
                   // alert(JSON.stringify(result));
                    if(result == "exceed"){
                        $('#exceed').text('Stock unavailable');
                    }else if(result == "Success"){
                        $('#exceed').hide();
                        location.reload();
                    }
                    fetchCart();
                }, error: function(response){
                   // alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
        
        
        
        function clearSession() {
            var clear="1";
            $.ajax({
                url: "{{ route('service.clearSession') }}",
                method: "GET",
                data: {"clear":clear},
                contentType: false,
                processData: false,
                datatype: "json",
                success: function(result) {
                   // alert(JSON.stringify(result));
                    if (result == "Success") {
                         fetchCart();
                         location.reload();
                    } else {
                        alert(JSON.stringify(result));
                    }
                },
                beforeSend: function() {
                    $('#loading').show();
                },
                complete: function() {
                    $('#loading').hide();
                },
                error: function(response) {
                    //$("#barcodeError").text("No such product available in your system");
                   // alert(JSON.stringify(response));
                }
            })
               
        }

    function removeSessionPart(id){
        $.ajax({
                url:"{{route('service.removePart')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result){
                    //alert(JSON.stringify(result));
                    fetchCart();location.reload();
                }, error: function(response){
                   // alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }


     function finalSubmit(){
         var currency=$('#currency').val();
         var claimId=$('#claimId').val();
         var grand_total=$('#totalAmount').text();
         var vat=$('#vat').text();
        $.ajax({
                url:"{{route('claim.submitFinalPart')}}",
                method: "GET",
                data: {
                    "currency":currency,
                    "grand_total":grand_total,
                    "vat":vat,
                    "claimId":claimId
                },
                success: function (result){
                    //alert(JSON.stringify(result));
                    window.location.href=("{{ route('allClaim') }}");
                   
                }, error: function(response){
                    //alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }

    

    function submitFormOne(){
        var engineer_id=$('#engineer_id').val();
        var reg_id=$('#reg_id').val();
        var run_hour=$('#run_hour').val();
        var remarks=$('#remarks').val();
        
        $.ajax({
                url:"{{route('save.service.info')}}",
                method: "GET",
                data: {
                    "engineer_id":engineer_id,
                    "reg_id":reg_id,
                    "run_hour":run_hour,
                    "remarks":remarks
                },
                success: function (result) {
                   // alert(JSON.stringify(result));
                   $('#alert').html(result.message);
                  window.location.href=("{{ route('service_list') }}");
                }, error: function(response) {
                   // alert(JSON.stringify(response));
                    $('#run_hourError').text(response.responseJSON.errors.run_hour);
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
         
    }
    
    
    function redirect(id){
       // alert(id);
   
        window.open("{{ url('create/new/claim/page/Two') }}" + "/" + id);
    }
    
</script>
@endsection