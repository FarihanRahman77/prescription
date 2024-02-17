@extends('backend.layouts.master')


@section('content')
 <div class="container">

        <div class="row">
            <div class="col-md-3 sidebar p-1">
                <a class="text-center text-success" ><span style="margin-right:10px;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span>Warranty Terms </a>
                <a class="text-center"><span style="margin-right:10px;color:green;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span><span style="color:green;"> Select Registration Type,Serial Number and see details</span></a>
                <a class=" text-center" ><span style="margin-right:10px;color:green;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span><span style="color:green;">Commissioning/Installation and Warranty Type</span></a>
                <a class="text-center "><span style="margin-right:10px;color:green;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span><span style="color:green;">End User Details</span></a>
                <a class="active text-center " >Upload Required Documents</a>
                <a class="text-center text-danger" href="upload_sucess.html">Save and Submit</a>
            </div>

            <div class=" col-md-9 content border border-secondary p-3 m-0" style="height:auto;">
                <form action="{{ route('save.uploadForm') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <h5 class="text-center text-dark text-decoration-underline m-2">UPLOAD REQUIRED FORMS</h5>
                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Upload commissioning/installation Form:</label>
                            <input class="form-control" type="file" id="comission_form" name="comission_form" required>
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
