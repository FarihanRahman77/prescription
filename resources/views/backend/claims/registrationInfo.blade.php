@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-9 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Registration Information of serial: {{$info->serial_no}}</h5>
                <div class="row">
                    <div class="col-md-12 mb-3">
                       
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
                    //alert(JSON.stringify(result));
                   $('#serial_info_div').html(result);
                }, error: function(response) {
                   // alert(JSON.stringify(response));

                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
    
    function showRegistrationInfo(id){
      window.open("{{ url('/get/registration/info') }}" + "/" + id);
        
    }
    function showRegisteredServiceRepair(id){
        alert(id);
    }
    function addClaimInfo(id){
        alert(id);
    }
    
</script>
@endsection