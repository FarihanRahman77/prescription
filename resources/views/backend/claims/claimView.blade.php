@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                    @if(session()->has('message'))
                        <div class="alert alert-success">
                            {{ session()->get('message') }} 
                        </div>
                    @endif
                <h3 class="text-center text-dark text-decoration-underline ">Claim List</h3>
                <div class="row">
                    <div class="col-md-12">
                        @php
                        $type='Claim';
                        @endphp
                        @if (Auth::guard('web')->user()->can('Claim Exel'))
                        <a href="{{route('claim_list_excel',$type)}}" class="btn btn-primary float-right m-3"><i class="fa fa-file-excel-o"></i> Excel</a>
                        @endif
                    </div>
                    
                    <div class="table-responsive">
                        <table id="manageClaimTable" width="100%" class="table table-bordered table-hover">
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
                                @php 
                                    $bgColor='';
                                    if($claim->status == 'Approved'){
                                        $bgColor='bg-success';
                                    }elseif($claim->status == 'Denied'){
                                        $bgColor='bg-danger';
                                    }
                                @endphp
                                <tr class="{{$bgColor}}">
                                    <td>{{$i++}}</td>
                                    <td>{{$claim->created_at}}</td>
                                    <td>Serial:{{$claim->serial_key}}-{{ $claim->year}}-{{$claim->claim_serial}} <br>Ref:{{$claim->claim_reference}}<br>Comission Date:{{$claim->comission_date}}<br>Failure Date:{{$claim->failure_date}}<br>Done Date:{{$claim->work_done_date}}</td>
                                    <td>Company Name:{{$claim->company_name}} <br>Mobile:{{$claim->phone}}</td>
                                    <td>Serial:{{$claim->serial_no}}<br>Product:{{$claim->productName}}-{{$claim->productModel}}<br>Category:{{$claim->categoryName}}</td>
                                    
                                    <td>Defect:{{$claim->defect_details}}<br>Hours Run:{{$claim->run_hour}}<br>Oil Consumption:{{$claim->oil_consumption}}<br>Temp:{{$claim->ambient_temperature}}</td>
                                    <td>{{$claim->service_by }}</td>
                                    <td>{{$claim->status}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                <i class="fas fa-cog"></i><span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                                @if (Auth::guard('web')->user()->can('Claim Details'))
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/details/claim',$claim->id)}}"><i class="fas fa-file-pdf"></i> Details </a></li>
                                                @endif
                                               
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/attachment/claim',$claim->id)}}"><i class="fa-solid fa-paperclip"></i> Attachments </a></li>
                                               
                                                @if (Auth::guard('web')->user()->can('Claim Edit'))
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/edit/claim',$claim->id)}}"><i class="fas fa-edit"></i> Edit </a></li>
                                                @endif
                                                @if (Auth::guard('web')->user()->can('Claim Delete'))
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/delete/claim',$claim->id)}}"><i class="fas fa-trash-alt"></i> Delete </a></li>
                                                @endif
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
        </div>
    </div> 
    <br><br>
    
  

<script>
    $(document).ready( function () {
        $('#manageClaimTable').DataTable();
    } );
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

@endsection