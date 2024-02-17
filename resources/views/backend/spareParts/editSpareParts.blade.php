@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h5 class="text-center text-dark text-decoration-underline ">Edit Spare Part</h5>
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
                        <input class="form-control input-sm" id="name" type="text" name="name" placeholder=" Product name" value="{{$part->name}}">
                        <span class="text-danger" id="nameError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Product Code <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="product_code" type="text" name="product_code" placeholder=" Product Code" value="{{$part->product_code}}">
                        <span class="text-danger" id="nameError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Category <span class="text-danger"> * </span></label><br>
                        <select name="category_id" id="category_id" class="form-control input-sm">
                            <option value="{{$part->category_id}}" selected="selected">Select Category</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                        <span class="text-danger" id="categoryError"></span>
                    </div>
                    
                    <div class="form-group col-md-6">
                        <label>Model</label>
                        <input class="form-control input-sm" id="model_no" type="text" name="model_no" placeholder=" Model Number " value="{{$part->model}}">
                        <span class="text-danger" id="model_noError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Unit <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="unit" type="text" name="unit" placeholder=" Unit" value="{{$part->unit}}">
                        <span class="text-danger" id="unitError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Purchase Price <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="purchase_price" type="number" name="purchase_price" placeholder="Minimum price" value="{{$part->purchase_price}}"> 
                        <span class="text-danger" id="purchase_priceError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Sale Price <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" id="sale_price" type="number" name="sale_price"placeholder=" Maximum price" value="{{$part->sale_price}}">
                        <span class="text-danger" id="sale_priceError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label> Opening Stock <span class="text-danger"> * </span></label>
                        <input class="form-control input-sm" min="0" id="opening_stock" type="number" name="opening_stock" placeholder="Opening stock" value="{{$part->opening_qty}}">
                        <span class="text-danger" id="opening_stockError"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Notes</label>
                        <textarea class="form-control input-sm" id="notes" type="text" name="notes"
                            placeholder="Notes about product ">{{$part->remarks}}</textarea>
                        <span class="text-danger" id="notesError"></span>
                    </div>
                    <input type="hidden" id="id" value="{{$part->id}}">
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
        var id=$('#id').val();
        var name=$('#name').val();
        var category_id=$('#category_id').val();
        var model_no=$('#model_no').val();
        var unit=$('#unit').val();
        var purchase_price=$('#purchase_price').val();
        var sale_price=$('#sale_price').val();
        var opening_stock=$('#opening_stock').val();
        var notes=$('#notes').val();
        var product_code=$('#product_code').val();
         $.ajax({
                url:"{{route('update_spare_parts')}}",
                method: "GET",
                data: {
                    "id":id,
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
                    //alert(JSON.stringify(result));
                   $('#alert').html(result.message);
                }, error: function(response) {
                    //alert(JSON.stringify(response));
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