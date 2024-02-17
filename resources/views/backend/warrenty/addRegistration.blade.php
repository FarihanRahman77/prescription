@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class="col-md-3 sidebar p-1">
                <a class="active  text-center" href="#home">Warranty Terms</a>
                <a href="#" class=" text-center text-danger">Select Registration Type,Serial Number and see details</span></a>
                <a href="#" class="text-center text-danger" href="Dryer.html">Commissioning/Installation and Warranty Type</a>
                <a href="#" class="text-center text-danger" href="userdeatiles.html">End User Details</a>
                <a href="#" class="text-center text-danger" href="upload_file.html">Upload Required Documents</a>
                <a href="#" class="text-center text-danger" href="upload_sucess.html">Save and Submit</a>
            </div>
      
            <div class=" col-md-9 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">General Warranty Terms</h5>
                <ul>
                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> All units and associated equipment must be serviced by factory trained technicians, using genuine parts and lubricants, as per our published recommended service schedules. All services must be registered online, where applicable</li>

                    <li class="text-dark list_view "  style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> All units and associated equipment must be serviced by factory trained technicians, using genuine parts and lubricants, as per our published recommended service schedules. All services must be registered online, where applicable</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> All units and associated equipment must be commissioned by factory trained technicians. Commissioning/Installation forms must be uploaded at the time of registration (certain exclusions apply) </li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> The manufacturer shall be under no liability for warranty if incorrect warranty certificates have been issued as a result of incorrect warranty type being selected by the person who made the registration. This registration process is designed to prevent incorrec selections,however if the progress has failed to prevent an incorrect selection the full terms and conditions of our warranties will prevail over anyone-line registration selection.</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> Submitting incomplete or false information will invalidate the warranty</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> Extended warranties are subject to additional terms and conditions, including exclusions. Please make sure you are familiar with the terms and conditions and the customer is informed accordingly.</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> Extended warranties for certain products or regions may require a further authorisation from your local warranty department.</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> Water Analysis Reports must be uploaded for Water-Injected Oil Free Screw Compressors</li>

                    <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i> Regional terms and Conditions Apply - please check with your local sales representative
                     Full terms and conditions can be downloaded by clicking the following link: - </li>
                   
                       
                     <li class="text-dark list_view " style="font-size:12px;"><i class="text-dark fa-solid fa-circle-exclamation icon_" style="font-size:14px;"></i>
                        <a class="text-danger text-center" href="img/tream.pdf" target="_blank"> Trident Full terms and Condtions </a>,
                        
                    </li>
                    <form action="{{route('warrenty.save.step2')}}" method="get">
                        
                    <li class=" ml-5 list-unstyled"><input type="checkbox" id="checked" onchange="checkOrNot()" name="checked" value="1">
                        <label for="horns"><a href="#"> I have read and accept the terms and conditions </a><label> 
                    </li>
                    
                    <span type="submit"  class="btn btn-primary" disabled id="notOkayBtn" onclick="checkOrNot()">Okay</span>
                    <button type="submit"  class="btn btn-primary" style="display:none" id="okayBtn">Okay</button><span id="checkText"class="text-danger"></span>
                </ul>
                </form>
            </div>
        </div>
    </div> 
@endsection

@section('javascript')
<script>
    function checkOrNot(){
        var checked=$('#checked').is(":checked");
        if(checked == true){
            $('#notOkayBtn').hide();
            $('#okayBtn').show();
        }else{
            $('#checkText').text('Please select the check box as read.')
        }
    }
</script>
@endsection