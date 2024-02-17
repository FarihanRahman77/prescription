@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-9 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Create and Print QR codes for Parts</h5>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <span>Important Note: Please follow the stages below in order. To perform a new search please press the reset button here:</span><br>
                        <label  class="form-label">Step 1. Select Serial Number</label>
                        <select class="form-select" id="serial_no" name="serial_no" onchange="getWarrentyInfo()" required>
                            <option selected>Select Serial No.</option>
                            @foreach($registrations as $registration)
                                <option value="{{$registration->id}}">{{$registration->serial_no}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-12" id="serial_info_div"></div>
                    
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
    
    function getWarrentyInfo(){
        var serial_no=$('#serial_no').val();
         $.ajax({
                url:"{{route('get.warrenty.info')}}",
                method: "GET",
                data: {
                    "serial_no":serial_no
                },
                success: function (result) {
                 //   alert(JSON.stringify(result));
                   $('#serial_info_div').html(result);
                }, error: function(response) {
                 //   alert(JSON.stringify(response));

                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
    
    function showRegistrationInfo(id){
      window.location.href=("{{ url('/get/registration/info') }}" + "/" + id);
        
    }
    function showRegisteredServiceRepair(id){
         window.location.href=("{{ url('/get/Registered/Service/Repair') }}" + "/" + id);
    }
    function addClaimInfo(id){
         window.location.href=("{{ url('/create/new/claim/page/one') }}" + "/" + id);
    }
    
</script>
@endsection