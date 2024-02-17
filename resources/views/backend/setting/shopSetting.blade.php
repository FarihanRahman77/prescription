@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h3 class="text-center text-dark text-decoration-underline ">Shop Setting</h3>
                <div class="row">
                    @if (\Session::has('success'))
                        <div class="alert alert-success">
                            <ul>
                                <li>{!! \Session::get('success') !!}</li>
                            </ul>
                        </div>
                    @endif
                    <form action={{route('updateSetting')}} method="post">
                        @csrf
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="name">Shop Name<font style="color:red">*</font> </label>
                            <input type="text" name="name" id="companyName" class="form-control form-group-sm"
                                value="{{$setting->name}}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="email">Email<font style="color:red">*</font> </label>
                            <input type="text" name="email" id="companyEmail" class="form-control form-group-sm"
                                 value="{{$setting->email}}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="phone">Phone No<font style="color:red">*</font> </label>
                            <input type="text" name="phone" id="companyPhone" class="form-control form-group-sm"
                                 value="{{$setting->phone}}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Address<font style="color:red">*</font> </label>
                            <input type="text" name="address" id="companyAddress" class="form-control form-group-sm"
                                 value="{{$setting->address}}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="fax">Fax<font style="color:red">*</font> </label>
                            <input type="text" name="fax" id="companyFax" class="form-control form-group-sm"
                                 value="{{$setting->fax}}">
                        </div>
                       
                        <div class="form-group col-md-12">
                            <label for="">Report Header</label>
                            <textarea class="ckeditor form-control" id="company_report_header" name="company_report_header">{{$setting->report_header}}</textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="">Report footer</label>
                            <textarea class="ckeditor form-control" id="company_report_footer" name="company_report_footer">{{$setting->report_footer}}</textarea>
                        </div>
    
                      <!---  <div class="form-group col-md-4">
                            <label for="watermark">Watermark <font style="color:red">*</font> </label>
                            <input type="file" name="watermark" id="companyWatermark"
                                class="form-control form-group-sm" />
                            <img id="watermark" src="{{ asset('upload/no_image.png') }}"
                                style="width: 100px;height: 110px; border:1px solid #000000;margin-top: 1%;">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="logo">Shop Logo <font style="color:red">*</font> </label>
                            <input type="file" name="logo" id="companyLogo"
                                class="form-control form-group-sm" />
                            <img id="logo" src="{{ asset('upload/no_image.png') }}"
                                style="width: 100px;height: 110px; border:1px solid #000000;margin-top: 1%;">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="logo">Shop Logo(Horizontal) <font style="color:red">*</font> </label>
                            <input type="file" name="logo" id="companyLogoHorizontal"
                                class="form-control form-group-sm" />
                            <img id="logoHorizontal" src="{{ asset('upload/no_image.png') }}"
                                style="width: 350px;height: 110px; border:1px solid #000000;margin-top: 1%;">
                        </div>--->
    
                        <div class="form-group col-md-4" style="padding-top: 30px">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <br><br>
    
  
@endsection

@section('javascript')
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
<script>
    

    
</script>
@endsection