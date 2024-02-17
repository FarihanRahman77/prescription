@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-9 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Create New Service</h5>
                <p class="text-center text-dark text-decoration-underline "><strong>Step 1</strong></p>
                <div class="row">
                   
                    <div class="col-md-12 mb-3">
                        <span>Please  copy the token from Registered Product QR code and paste it here.</span><br>
                        <label  class="form-label">Paste Registered product Token  </label>
                        <input type="password"  class="form-control" id="registered_product_token" name="registered_product_token" placeholder="Enter Registered Product token" onpaste="registeredProductToken()">
                    </div>
                    <div class="col-md-12" id="serial_info_div">
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </div> 
@endsection

@section('javascript')
<script>

     $(document).ready(function() {
        $('#serial_no').select2();
    });
    
    
    
     $(document).ready(function() {
     var registered_product_token = document.querySelector('#registered_product_token');
    
        registered_product_token.onpaste = function() {
        	setTimeout(function() {
        	    var token = registered_product_token.value;
            	$.ajax({
                    url:"{{route('get.warrenty.info.for.service')}}",
                    method: "GET",
                    data: {
                        "token":token
                    },
                    success: function (result) {
                       // alert(JSON.stringify(result));
                       $('#serial_info_div').html(result);
                    }, error: function(response) {
                        //alert(JSON.stringify(response));
    
                    }, beforeSend: function () {
                        $('#loading').show();
                    },complete: function () {
                        $('#loading').hide();
                    }
                });
            });
        };
     });
    


   
   
    
    function serviceStepOneToTwo(id){
       // alert(id);
      window.location.href=("{{ url('/service/Step/One/To/Two') }}" + "/" + id);
        
    }
    
    
</script>
@endsection