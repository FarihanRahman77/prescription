@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class="col-md-3 sidebar p-1">
                <a class="text-center text-success" ><span style="margin-right:10px;"><i class="fa fa-check" style="font-size:10px;color:green"></i></span>Warranty Terms </a>
                <a class="active text-center">Select Registration Type,Serial Number and see details</span></a>
                <a class="text-center text-danger" href="Dryer.html">Commissioning/Installation and Warranty Type</a>
                <a class="text-center text-danger" href="userdeatiles.html">End User Details</a>
                <a class="text-center text-danger" href="upload_file.html">Upload Required Documents</a>
                <a class="text-center text-danger" href="upload_sucess.html">Save and Submit</a>
            </div>

            <div class=" col-md-9 content border border-secondary p-3 m-0" style="height:auto;">
                <div class="row">
                    <form action="{{route('warrenty.save.step2.post')}}" method="post">
                        @csrf
                        <h5 class="text-center text-dark text-decoration-underline ">Please select the product you want to register</h5>
                        <div class="col-md-6 mb-3">
                            <label  class="form-label">Registration Type</label>
                            <select class="form-select" id="category" name="category_id" onchange="getProduct()" required>
                                <option selected>Select Category</option>
                                @foreach($categories as $category)
                                    <option value="{{$category->id}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 mb-3" id="product_serial_div">
                            <span class="text-danger" id="category_type_error"></span>
                        </div>
                        <div class="col-md-12 p-5" id="product_details__div">


                        </div>
                        <div class="d-flex col-md-12 justify-content-center">
                            <button type="submit" id="okay_btn" style="display:none;" class="btn btn-primary">Okay</button>
                         
                        </div>
                    </form>

                </div>
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
