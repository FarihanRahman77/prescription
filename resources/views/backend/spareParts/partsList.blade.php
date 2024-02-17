@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Spare Parts</h5>
                
                @if(session()->has('message'))
                    <div class="alert alert-success">
                        {{ session()->get('message') }}
                    </div>
                @endif
                @if (Auth::guard('web')->user()->can('Spare Parts Create'))
                <a href="{{route('add_spare_parts')}}" class="btn btn-primary float-right m-3"> + Add Spare Parts</a>
                @endif
                
              
                <a href="{{route('spare_parts_list_excel')}}" class="btn btn-primary float-right m-3"><i class="fa fa-file-excel-o"></i> Excel</a>
                
                
                <table id="manageSparePartsTable" width="100%" class="table table-bordered  table-hover m-0">
                    <thead>
                        <tr>
                            <td width="5%" >SL.</td>
                            <td width="15%">Description</td>
                            <td width="10%">Parts No</td>
                            <td width="10%">Category</td>
                            <td width="10%">Model</td>
                            <td width="20%">Prices</td>
                            <td width="15%">Stock</td>
                            <td  width="8%">Status</td>
                            <td  width="7%">ACTION</td>
                        </tr>
                    </thead>
                    <tbody>
                        @php 
                        $i=1;
                        $category='';
                        @endphp
                        @foreach($parts as $part)
                            @php
                                $category= App\Models\Category::where('id','=',$part->category_id)->first();
                                $stock= App\Models\Stock::where('product_id','=',$part->id)->first();
                            @endphp
                        <tr>
                            <td>{{$i++}}</td>
                            <td>{{$part->name}}</td>
                            <td>{{$part->product_code}}</td>
                            <td>{{$category->name}}</td>
                            <td>{{$part->model}}</td>
                            <td>Purchase Price:{{@$part->purchase_price}} <br> Sale Price: {{@$part->sale_price}}</td>
                            <td>Opening Qty: {{$part->opening_qty ?? '0'}} <br> Stock Qty:{{$stock->qty ?? '0'}}<br> Total Qty: {{@$part->opening_qty + @$stock->qty}}</td>
                            <td>{{$part->status}}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        <i class="fas fa-cog"></i><span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                        @if (Auth::guard('web')->user()->can('Spare Parts Edit'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/edit/spare/part',$part->id)}}"><i class="fas fa-edit"></i> Edit </a></li>
                                        @endif
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/qr/code/spare/part',$part->id)}}"><i class="fa-solid fa-qrcode"></i> QR Code</a></li>
                                        @if (Auth::guard('web')->user()->can('Spare Parts Delete'))
                                        <li class="action liDropDown"><a  class="btn" href="{{url('/delete/spare/part',$part->id)}}"><i class="fas fa-trash-alt"></i> Delete </a></li>
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
    
    <script>
        $(document).ready( function () {
            $('#manageSparePartsTable').DataTable();
        } );
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

@endsection

@section('javascript')


<script>

     $(document).ready(function() {
        $('#serial_no').select2();
    });
    
    function showRegistrationInfo(id){
      window.open("{{ url('/get/registration/info') }}" + "/" + id);
        
    }
    
    function showRegisteredServiceRepair(id){
         window.open("{{ url('/get/Registered/Service/Repair') }}" + "/" + id);
    }
    
    function addClaimInfo(id){
         window.open("{{ url('/create/new/claim/page/one') }}" + "/" + id);
    }
    
</script>
@endsection