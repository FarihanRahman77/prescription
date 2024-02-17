@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-11 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Registered Service and Repair of serial: {{$info->serial_no}}</h5>
                <div class="row">
                    <div class="col-md-12 mb-3">
                       <div class="table">
                            <table  width="100%" class="table table-bordered  table-hover m-0">
                                <tr>
                                    <td width="40%">Product:</td>
                                    <td width="60%">{{$info->product_name}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Model:</td>
                                    <td width="60%">{{$info->product_model}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Serial No:</td>
                                    <td width="60%">{{$info->serial_no}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Registration No:</td>
                                    <td width="60%">{{$info->registration_number}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Issued By:</td>
                                    <td width="60%">{{date("d-m-Y", strtotime($info->instalation_date))}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">IMEI Number:</td>
                                    <td width="60%">{{$info->imei_number}}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12 row" id="serial_info_div"></div>
                    @if($message == '1')
                    
                        <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                                @if(session()->has('message'))
                                    <div class="alert alert-success">
                                        {{ session()->get('message') }} 
                                    </div>
                                @endif
                            <h3 class="text-center text-dark text-decoration-underline ">Previous Claim List</h3>
                            <div class="row">
                                <div class="table-responsive">
                                    <table id="managePreviousClaimTable" width="100%" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td width="5%" class="text-center">SL#</td>
                                                <td width="10%" class="text-center">Date</td>
                                                <td width="20%" class="text-center">Claim Info</td>
                                                <td width="15%" class="text-center">Customer Info</td>
                                                <td width="15%" class="text-center">Product Info</td>
                                                
                                                <td width="15%" class="text-center">Claim Summary</td>
                                                <td width="10%" class="text-center">Serviced By</td>
                                                <td width="5%" class="text-center">Status</td>
                                                <td width="8%" class="text-center">Actions</td>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:12px;">
                                            @php 
                                                $i=1;
                                            @endphp
                                            @foreach($claims as $claim)
                                            <tr>
                                                <td>{{$i++}}</td>
                                                <td>{{$claim->created_at}}</td>
                                                <td>Serial:WC-{{$claim->claim_serial}} <br>Ref:{{$claim->claim_reference}}<br>Comission Date:{{$claim->comission_date}}<br>Failure Date:{{$claim->failure_date}}<br>Done Date:{{$claim->work_done_date}}</td>
                                                <td>Customer Name:{{$claim->first_name}} {{$claim->last_name}}<br>Mobile:{{$claim->phone}}</td>
                                                <td>Serial:{{$claim->serial_no}}<br>Product:{{$claim->productName}}-{{$claim->productModel}}<br>Category:{{$claim->categoryName}}</td>
                                                
                                                <td>Defect:{{$claim->defect_details}}<br>Hours Run:{{$claim->run_hour}}<br>Oil Consumption:{{$claim->oil_consumption}}<br>Temp:{{$claim->ambient_temperature}}</td>
                                                <td>{{$claim->service_by}}</td>
                                                <td>{{$claim->status}}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                            <i class="fas fa-cog"></i><span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                                            <li class="action liDropDown"><a  class="btn" href="{{url('/details/claim',$claim->id)}}"><i class="fas fa-file-pdf"></i> Details </a></li>
                                                            <li class="action liDropDown"><a  class="btn" href="{{url('/edit/claim',$claim->id)}}"><i class="fas fa-edit"></i> Edit </a></li>
                                                            <li class="action liDropDown"><a  class="btn" href="{{url('/delete/claim',$claim->id)}}"><i class="fas fa-trash-alt"></i> Delete </a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    
                    @elseif($message == '2')
                    @endif
                </div>
            </div>
        </div>
    </div> 
@endsection

@section('javascript')

<script>

    $(document).ready( function () {
        $('#managePreviousClaimTable').DataTable();
    } );
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
@endsection