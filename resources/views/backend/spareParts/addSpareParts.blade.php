@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Add Spare Parts</h5>
                <div class="row">
                   
                    <div class="col-md-4">
                        <a href="{{route('productParts')}}" class="btn btn-secondary"> Return to Spare parts list</a>
                    </div>
                    <div class="col-md-8"></div>
                </div><br>
                <div class="row">
                     <div class="col-md-12" id="alert" ></div>
                    <div class="form-group col-md-6">
                        <label> Product Name <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="name" type="text" name="name" placeholder=" Product name">
                        <span class="text-danger" id="nameError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Product Code <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="product_code" type="text" name="product_code" placeholder=" Product Code">
                        <span class="text-danger" id="product_codeError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Category <span class="text-danger"> * </span></label><br>
                        <select name="category_id" id="category_id" class="form-control input-sm">
                            <option value="" selected="selected">Select Category</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                        <span class="text-danger" id="categoryError"></span>
                    </div>
                    
                    <div class="form-group col-md-6">
                        <label>Model</label>
                        <input class="form-control input-sm" id="model_no" type="text" name="model_no" placeholder=" Model Number ">
                        <span class="text-danger" id="model_noError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Unit <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="unit" type="text" name="unit" placeholder="Unit">
                        <span class="text-danger" id="unitError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Purchase Price <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="purchase_price" type="number" name="purchase_price" placeholder="Minimum price" value="0"> 
                        <span class="text-danger" id="purchase_priceError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Sale Price <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="sale_price" type="number" name="sale_price"placeholder=" Maximum price" value="0">
                        <span class="text-danger" id="sale_priceError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Opening Stock <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" min="0" id="opening_stock" type="number" name="opening_stock" placeholder="Opening stock" value="0">
                        <span class="text-danger" id="opening_stockError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Notes</label>
                        <textarea class="form-control input-sm" id="notes" type="text" name="notes"
                            placeholder="Notes about product "></textarea>
                        <span class="text-danger" id="notesError"></span>
                    </div>
                </div>
                <span class="btn btn-primary float-right m-2" onclick="saveProduct()">Save</span>
            </div>
        </div>
    </div> 
@endsection

@section('javascript')
<script>

    
    
    
     $(document).ready(function() {
        $('#serial_no').select2();
    });
    
    function saveProduct(){
        var name=$('#name').val();
        var category_id=$('#category_id').val();
        var model_no=$('#model_no').val();
        var unit=$('#unit').val();
        var purchase_price=$('#purchase_price').val();
        var product_code=$('#product_code').val();
        var sale_price=$('#sale_price').val();
        var opening_stock=$('#opening_stock').val();
        var notes=$('#notes').val();
         $.ajax({
                url:"{{route('save_spare_parts')}}",
                method: "GET",
                data: {
                    "name":name,
                    "category_id":category_id,
                    "model_no":model_no,
                    "unit":unit,
                    "purchase_price":purchase_price,
                    "sale_price":sale_price,
                    "opening_stock":opening_stock,
                    "notes":notes,
                    "product_code":product_code,
                },
                success: function (result) {
                   // alert(JSON.stringify(result));
                   $('#alert').html(result.message);
                }, error: function(response) {
                    //alert(JSON.stringify(response));
                    $('#nameError').text(response.responseJSON.errors.name);
                    $('#product_codeError').text(response.responseJSON.errors.product_code);
                    $('#categoryError').text(response.responseJSON.errors.category_id);
                    $('#model_noError').text(response.responseJSON.errors.model_no);
                    $('#unitError').text(response.responseJSON.errors.unit);
                    $('#purchase_priceError').text(response.responseJSON.errors.purchase_price);
                    $('#sale_priceError').text(response.responseJSON.errors.sale_price);
                    $('#opening_stockError').text(response.responseJSON.errors.opening_stock);
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
         window.open("{{ url('/get/Registered/Service/Repair') }}" + "/" + id);
    }
    function addClaimInfo(id){
         window.open("{{ url('/create/new/claim/page/one') }}" + "/" + id);
    }
    
</script>
@endsection