@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-9 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Create New Service</h5>
                <p class="text-center text-dark text-decoration-underline "><strong>Step 2</strong></p>
                <div class="row">
                     <input type="hidden" id="registration_id" value="{{$id}}">
                    <div class="col-md-12 mb-3">
                        <span>Please  copy the token from Employee QR code and paste it here.</span><br>
                        <label  class="form-label">Paste Employee Token  </label>
                        <input type="password"  class="form-control" id="employee_token" name="employee_token" placeholder="Enter Employee Token">
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
     var employee_token = document.querySelector('#employee_token');
    
        employee_token.onpaste = function() {
        	setTimeout(function() {
        	    var token = employee_token.value;
            	$.ajax({
                    url:"{{route('get.employee.info.for.service')}}",
                    method: "GET",
                    data: {
                        "token":token
                    },
                    success: function (result) {
                       // alert(JSON.stringify(result));
                       $('#serial_info_div').html(result);
                    }, error: function(response) {
                       // alert(JSON.stringify(response));
    
                    }, beforeSend: function () {
                        $('#loading').show();
                    },complete: function () {
                        $('#loading').hide();
                    }
                });
            });
        };
     });
    


   
   
    
    function serviceStepTwoToThree(id){
        
        var registration_id = $('#registration_id').val();
       // alert(registration_id);
        window.location.href=("{{ url('/service/Step/Two/To/Three') }}" + "/" + id   + "/" + registration_id);
    }
    
    
</script>
@endsection