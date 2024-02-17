@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class="col-md-3 sidebar p-1">
                <a class="text-center text-success" ><span style="margin-right:10px;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span>Warranty Terms </a>
                <a class="text-center"><span style="margin-right:10px;color:green;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span><span style="color:green;"> Select Registration Type,Serial Number and see details</span></a>
                <a class=" active text-center" href="Dryer.html">Commissioning/Installation and Warranty Type</a>
                <a class="text-center text-danger" href="userdeatiles.html">End User Details</a>
                <a class="text-center text-danger" href="upload_file.html">Upload Required Documents</a>
                <a class="text-center text-danger" href="upload_sucess.html">Save and Submit</a>
            </div>

            <div class=" col-md-9 content border border-secondary p-3 m-0" style="height:auto;">

                    <form action="{{route('save.installationForm')}}" method="post">
                        @csrf
                <div class="row">
                        <h5 class="text-center text-dark text-decoration-underline m-2">Commissioning/Installation and Warranty Selection</h5>
                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Commissioned/Installed:</label>
                            <input class="form-control" type="date" id="commission_date" name="instalation_date" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            @php
                            $warrentyType = \App\Models\WarrentyType::all();
                            @endphp

                            <label class="form-label">Warranty Type <!-- (Select commissioned date to get Warranty Type) -->:</label>
                            <select class="form-select" id="warrenty_type" name="warrenty_type" required>
                                <option value="" selected>Select type</option>
                                @foreach($warrentyType as $warrenty)
                                    <option value="{{ $warrenty->id }}">{{ $warrenty->type }}</option>
                                @endforeach
                            </select>
                            @error('warrenty_type')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Application:</label>
                            <input class="form-control" type="text" id="application_type" name="application_type" placeholder="Enter Application" required>
                            @error('application_type')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>

                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Controller Box ID NO.:</label>
                            <input class="form-control" type="text" id="imei_no" name="imei_number" placeholder="IMEI No." required>
                            @error('imei_number')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div class="col-md-6 mb-3">

                            @php
                                $runHours = \App\Models\AnnualRunHour::all();
                            @endphp

                            <label class="form-label">Estimated Annual Run Hours:</label>
                            <select class="form-select" id="annual_run_hour" name="annual_run_hour" required>
                                <option value="" selected>Select application</option>
                                @foreach($runHours as $hour)
                                    <option value="{{ $hour->hour }}">{{ $hour->hour }}</option>
                                @endforeach
                            </select>
                            @error('annual_run_hour')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Estimated First Service Date:</label>
                            <input class="form-control" type="date" id="estimited_first_service_date" name="estimited_first_service_date" required>
                            @error('estimited_first_service_date')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary">Continue</button>
                        </div>
                </div>
                    </form>


            </div>
        </div>
    </div>
@endsection

@section('javascript')

<script>
     $(document).ready(function() {
        $('#category').select2();
    });
    function getProduct(){
        var category_id=$('#category').val();
        $.ajax({
                url:"{{route('warrenty.get.product')}}",
                method: "GET",
                data: {
                    "category_id":category_id
                },
                success: function (result) {
                   // alert(JSON.stringify(result));
                    $('#product_serial_div').html(result);
                    $('#product_name').select2();
                }, error: function(response) {
                  //  alert(JSON.stringify(response));

                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }


    function getProductDetails(){
        var product_name=$('#product_name').val();
        $.ajax({
                url:"{{route('get.productData')}}",
                method: "GET",
                data: {
                    "product_id":product_name
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                    $('#product_details__div').html(result);
                    $('#okay_btn').show();
                }, error: function(response) {
                    //alert(JSON.stringify(response));

                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }


</script>
@endsection
