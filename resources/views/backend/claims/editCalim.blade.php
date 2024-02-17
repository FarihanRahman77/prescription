@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                <h3 class="text-center text-dark text-decoration-underline ">Edit General and fault details</h3>
                <input type="hidden" id="claim_id" value="{{$claim->id}}"> 
                <input type="hidden" id="reg_id" value="{{$claim->reg_id}}"> 
                <div class="row">
                    <!---claimant Details start---->
                    <div class="col-md-6 row ">
                        <p><b>Claimant Details</b></p>
                           <table  width="100%" class="table table-bordered   m-0 border border-secondary">
                                <tr>
                                    <td width="40%">Company Name:</td>
                                    <td width="60%">{{@$setting->name}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Company Address:</td>
                                    <td width="60%">{{@$setting->address}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Town:</td>
                                    <td width="60%">{{@$setting->name}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Post Code/Zip:</td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%">Phone:</td>
                                    <td width="60%">{{@$setting->phone}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Fax:</td>
                                    <td width="60%">{{@$setting->fax}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Email:</td>
                                    <td width="60%">{{@$setting->email}}</td>
                                </tr>
                                
                            </table>
                    </div>
                    <!---claimant Details end---->
                    
                    
                    <!---End User Details start---->
                    <div class="col-md-6 row">
                        <p><b>End User Details</b></p>
                           <table  width="100%" class="table table-bordered   m-0 border border-secondary">
                                <tr>
                                    <td width="40%">Company Name:</td>
                                    <td width="60%">{{@$customer->company_name}}<input type="hidden" id="customer_id" value="{{@$customer->id}}"></td>
                                </tr>
                                <tr>
                                    <td width="40%">Company Address:</td>
                                    <td width="60%">{{@$customer->address}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Town:</td>
                                    <td width="60%">{{@$customer->city}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">State:</td>
                                    <td width="60%">{{@$customer->city}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Post Code/Zip:</td>
                                    <td width="60%">{{@$customer->post_code}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Phone:</td>
                                    <td width="60%">{{@$customer->phone}}</td>
                                </tr>
                                
                                <tr>
                                    <td width="40%">Email:</td>
                                    <td width="60%">{{@$customer->email}}</td>
                                </tr>
                            </table>
                    </div>
                    <!---End User Details end---->
                </div>
                <br><br>
                <div class="row">
                    <!---Machine Information start---->
                    <div class="col-md-6 row">
                        <p><b>Machine Information</b></p>
                           <table  width="100%" class="table table-bordered   m-0 border border-secondary">
                                <tr>
                                    <td width="40%">Claimant Claim Ref:</td>
                                    <td width="60%"><input class="form-control" id="claim_ref_no" value="{{@$claim->claim_reference}}"><span class="text-danger" id="claim_ref_noError"></span></td>
                                    
                                </tr>
                                <tr>
                                    <td width="40%">Serial Number:</td>
                                    <td width="60%">{{@$info->serial_no}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Frame Size:</td>
                                    <td width="60%">{{@$info->categoryName}}</td>
                                </tr>
                                <tr>
                                    <td width="40%">Model:</td>
                                    <td width="60%"><input class="form-control" id="model" value="{{@$info->product_model}}" readonly></td>
                                </tr>
                                <tr>
                                    <td width="40%">Hours Run:</td>
                                    <td width="60%"><input type="number" class="form-control" id="run_hour" value="{{@$claim->run_hour}}" > <span class="text-danger" id="run_hourError"></span></td>
                                </tr>
                                <tr>
                                    <td width="40%">Operating Hours Last Service:</td>
                                    <td width="60%"><input type="number" class="form-control" id="operating_hours_last_service" value="{{@$claim->operating_hours_last_service}}"><span class="text-danger" id="operating_hours_last_serviceError"></span></td>
                                </tr>
                                <tr>
                                    <td width="40%">Serviced By:</td>
                                    <td width="60%">
                                        <input class="form-control" id="service_by" placeholder="Provider name" value="{{@$claim->service_by}}" >
                                        <span class="text-danger" id="service_byError"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">Commissioning Date:</td>
                                    <td width="60%">{{@$info->instalation_date}} </td>
                                </tr>
                                <tr>
                                    <td width="40%">Date of Failure:</td>
                                    <td width="60%"><input type="date" class="form-control" id="failure_date" value="{{@$claim->failure_date}}" ><span class="text-danger" id="failure_dateError"></span></td>
                                </tr>
                                <tr>
                                    <td width="40%">Date Work Done:</td>
                                    <td width="60%"><input type="date" class="form-control" id="work_done_date" value="{{@$claim->work_done_date}}" ><span class="text-danger" id="work_done_dateError"></span></td>
                                </tr>
                                
                                <tr>
                                    <td width="40%">Warranty Type:</td>
                                    <td width="60%">Standard {{@$info->warrenty_type}} years</td>
                                </tr>
                               <tr>
                                    <td width="40%">Warranty Expire Date:</td>
                                    <td width="60%">
                                        @php 
                                        $expire_date=date('d-m-Y', strtotime($info->instalation_date. ' + '.$info->warrenty_type.' years'));
                                        @endphp
                                        {{@$expire_date}}
                                    </td>
                                </tr>
                            </table>
                    </div>
                    <!--Machine Information end---->    
                    
                    
                    
                    <!---Fault Information start---->
                    <div class="col-md-6 row">
                        <p><b>Fault Information</b></p>
                           <table  width="100%" class="table table-bordered   m-0 border border-secondary">
                                <tr>
                                    <td width="40%">Defect Found:</td>
                                    <td width="60%">
                                        <textarea class="form-control" id="defect_details">{{@$claim->defect_details}}
                                        </textarea>
                                        <span class="text-danger" id="defect_detailsError"></span></td>
                                </tr>
                                <tr>
                                    <td width="40%">Defect Issue:</td>
                                    <td width="60%">
                                        <textarea class="form-control" id="defect_issue" >{{@$claim->defect_issue}}
                                        </textarea>
                                        <span class="text-danger" id="defect_issueError"></span>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td width="40%">Oil Consumption</td>
                                    <td width="60%"><input  class="form-control" id="oil_consumption" value="{{@$claim->oil_consumption}}"><span class="text-danger" id="oil_consumptionError"></span></td>
                                </tr>
                                <tr>
                                    <td width="40%">Ambient Temperature:</td>
                                    <td width="60%">
                                        <input  class="form-control" id="ambient_temperature" value="{{@$claim->ambient_temperature}}"><span class="text-danger" id="ambient_temperatureError"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">Action Taken:</td>
                                    <td width="60%">
                                        <textarea type="text" class="form-control" id="action_taken">{{@$claim->action_taken}}</textarea>
                                        <span class="text-danger" id="action_takenError"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">Status</td>
                                    <td width="60%">
                                        <select id="status" name="status" class="form-control abcd" style="width:100%" required>
                                            <option value='0' selected='true'> Select Status </option>
                                            <option value="Open">Open</option>
                                            <option value="Approved">Approved</option>
                                            <option value="Denied">Denied</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%"></td>
                                </tr>
                                
                            </table>
                    </div>
                    <!--Fault Information end---->   
                    <br><br><br>
                    <div class=" col-md-12 content  w-75 h-auto m-auto">
                    <h3 class="text-center text-dark text-decoration-underline ">Edit Parts and Labours</h3>
                    <div class="row">
                        <div class="row col-md-12">
                            <span class="text-success" id="alertSuccess"></span>
                            <span class="text-danger" id="alertDanger" ></span>
                            <div class="col-md-2"></div>
                        </div>
                       
                        <div class="form-group col-md-6">
                            <label> Claim Currency: <span class="text-danger">*</span></label>
                            <select id="currency" name="currency" class="form-control abcd" style="width:100%" required>
                                <option value='{{@$claim->currency}}' selected='true'> Select Currency </option>
                                <option>select currency</option>
                                <option value="AFN">Afghan Afghani</option>
                                <option value="ALL">Albanian Lek</option>
                                <option value="DZD">Algerian Dinar</option>
                                <option value="AOA">Angolan Kwanza</option>
                                <option value="ARS">Argentine Peso</option>
                                <option value="AMD">Armenian Dram</option>
                                <option value="AWG">Aruban Florin</option>
                                <option value="AUD">Australian Dollar</option>
                                <option value="AZN">Azerbaijani Manat</option>
                                <option value="BSD">Bahamian Dollar</option>
                                <option value="BHD">Bahraini Dinar</option>
                                <option value="BDT" selected>Bangladeshi Taka</option>
                                <option value="BBD">Barbadian Dollar</option>
                                <option value="BYR">Belarusian Ruble</option>
                                <option value="BEF">Belgian Franc</option>
                                <option value="BZD">Belize Dollar</option>
                                <option value="BMD">Bermudan Dollar</option>
                                <option value="BTN">Bhutanese Ngultrum</option>
                                <option value="BTC">Bitcoin</option>
                                <option value="BOB">Bolivian Boliviano</option>
                                <option value="BAM">Bosnia-Herzegovina Convertible Mark</option>
                                <option value="BWP">Botswanan Pula</option>
                                <option value="BRL">Brazilian Real</option>
                                <option value="GBP">British Pound Sterling</option>
                                <option value="BND">Brunei Dollar</option>
                                <option value="BGN">Bulgarian Lev</option>
                                <option value="BIF">Burundian Franc</option>
                                <option value="KHR">Cambodian Riel</option>
                                <option value="CAD">Canadian Dollar</option>
                                <option value="CVE">Cape Verdean Escudo</option>
                                <option value="KYD">Cayman Islands Dollar</option>
                                <option value="XOF">CFA Franc BCEAO</option>
                                <option value="XAF">CFA Franc BEAC</option>
                                <option value="XPF">CFP Franc</option>
                                <option value="CLP">Chilean Peso</option>
                                <option value="CNY">Chinese Yuan</option>
                                <option value="COP">Colombian Peso</option>
                                <option value="KMF">Comorian Franc</option>
                                <option value="CDF">Congolese Franc</option>
                                <option value="CRC">Costa Rican ColÃ³n</option>
                                <option value="HRK">Croatian Kuna</option>
                                <option value="CUC">Cuban Convertible Peso</option>
                                <option value="CZK">Czech Republic Koruna</option>
                                <option value="DKK">Danish Krone</option>
                                <option value="DJF">Djiboutian Franc</option>
                                <option value="DOP">Dominican Peso</option>
                                <option value="XCD">East Caribbean Dollar</option>
                                <option value="EGP">Egyptian Pound</option>
                                <option value="ERN">Eritrean Nakfa</option>
                                <option value="EEK">Estonian Kroon</option>
                                <option value="ETB">Ethiopian Birr</option>
                                <option value="EUR">Euro</option>
                                <option value="FKP">Falkland Islands Pound</option>
                                <option value="FJD">Fijian Dollar</option>
                                <option value="GMD">Gambian Dalasi</option>
                                <option value="GEL">Georgian Lari</option>
                                <option value="DEM">German Mark</option>
                                <option value="GHS">Ghanaian Cedi</option>
                                <option value="GIP">Gibraltar Pound</option>
                                <option value="GRD">Greek Drachma</option>
                                <option value="GTQ">Guatemalan Quetzal</option>
                                <option value="GNF">Guinean Franc</option>
                                <option value="GYD">Guyanaese Dollar</option>
                                <option value="HTG">Haitian Gourde</option>
                                <option value="HNL">Honduran Lempira</option>
                                <option value="HKD">Hong Kong Dollar</option>
                                <option value="HUF">Hungarian Forint</option>
                                <option value="ISK">Icelandic KrÃ³na</option>
                                <option value="INR">Indian Rupee</option>
                                <option value="IDR">Indonesian Rupiah</option>
                                <option value="IRR">Iranian Rial</option>
                                <option value="IQD">Iraqi Dinar</option>
                                <option value="ILS">Israeli New Sheqel</option>
                                <option value="ITL">Italian Lira</option>
                                <option value="JMD">Jamaican Dollar</option>
                                <option value="JPY">Japanese Yen</option>
                                <option value="JOD">Jordanian Dinar</option>
                                <option value="KZT">Kazakhstani Tenge</option>
                                <option value="KES">Kenyan Shilling</option>
                                <option value="KWD">Kuwaiti Dinar</option>
                                <option value="KGS">Kyrgystani Som</option>
                                <option value="LAK">Laotian Kip</option>
                                <option value="LVL">Latvian Lats</option>
                                <option value="LBP">Lebanese Pound</option>
                                <option value="LSL">Lesotho Loti</option>
                                <option value="LRD">Liberian Dollar</option>
                                <option value="LYD">Libyan Dinar</option>
                                <option value="LTL">Lithuanian Litas</option>
                                <option value="MOP">Macanese Pataca</option>
                                <option value="MKD">Macedonian Denar</option>
                                <option value="MGA">Malagasy Ariary</option>
                                <option value="MWK">Malawian Kwacha</option>
                                <option value="MYR">Malaysian Ringgit</option>
                                <option value="MVR">Maldivian Rufiyaa</option>
                                <option value="MRO">Mauritanian Ouguiya</option>
                                <option value="MUR">Mauritian Rupee</option>
                                <option value="MXN">Mexican Peso</option>
                                <option value="MDL">Moldovan Leu</option>
                                <option value="MNT">Mongolian Tugrik</option>
                                <option value="MAD">Moroccan Dirham</option>
                                <option value="MZM">Mozambican Metical</option>
                                <option value="MMK">Myanmar Kyat</option>
                                <option value="NAD">Namibian Dollar</option>
                                <option value="NPR">Nepalese Rupee</option>
                                <option value="ANG">Netherlands Antillean Guilder</option>
                                <option value="TWD">New Taiwan Dollar</option>
                                <option value="NZD">New Zealand Dollar</option>
                                <option value="NIO">Nicaraguan CÃ³rdoba</option>
                                <option value="NGN">Nigerian Naira</option>
                                <option value="KPW">North Korean Won</option>
                                <option value="NOK">Norwegian Krone</option>
                                <option value="OMR">Omani Rial</option>
                                <option value="PKR">Pakistani Rupee</option>
                                <option value="PAB">Panamanian Balboa</option>
                                <option value="PGK">Papua New Guinean Kina</option>
                                <option value="PYG">Paraguayan Guarani</option>
                                <option value="PEN">Peruvian Nuevo Sol</option>
                                <option value="PHP">Philippine Peso</option>
                                <option value="PLN">Polish Zloty</option>
                                <option value="QAR">Qatari Rial</option>
                                <option value="RON">Romanian Leu</option>
                                <option value="RUB">Russian Ruble</option>
                                <option value="RWF">Rwandan Franc</option>
                                <option value="SVC">Salvadoran ColÃ³n</option>
                                <option value="WST">Samoan Tala</option>
                                <option value="SAR">Saudi Riyal</option>
                                <option value="RSD">Serbian Dinar</option>
                                <option value="SCR">Seychellois Rupee</option>
                                <option value="SLL">Sierra Leonean Leone</option>
                                <option value="SGD">Singapore Dollar</option>
                                <option value="SKK">Slovak Koruna</option>
                                <option value="SBD">Solomon Islands Dollar</option>
                                <option value="SOS">Somali Shilling</option>
                                <option value="ZAR">South African Rand</option>
                                <option value="KRW">South Korean Won</option>
                                <option value="XDR">Special Drawing Rights</option>
                                <option value="LKR">Sri Lankan Rupee</option>
                                <option value="SHP">St. Helena Pound</option>
                                <option value="SDG">Sudanese Pound</option>
                                <option value="SRD">Surinamese Dollar</option>
                                <option value="SZL">Swazi Lilangeni</option>
                                <option value="SEK">Swedish Krona</option>
                                <option value="CHF">Swiss Franc</option>
                                <option value="SYP">Syrian Pound</option>
                                <option value="STD">São Tomé and Príncipe Dobra</option>
                                <option value="TJS">Tajikistani Somoni</option>
                                <option value="TZS">Tanzanian Shilling</option>
                                <option value="THB">Thai Baht</option>
                                <option value="TOP">Tongan pa'anga</option>
                                <option value="TTD">Trinidad & Tobago Dollar</option>
                                <option value="TND">Tunisian Dinar</option>
                                <option value="TRY">Turkish Lira</option>
                                <option value="TMT">Turkmenistani Manat</option>
                                <option value="UGX">Ugandan Shilling</option>
                                <option value="UAH">Ukrainian Hryvnia</option>
                                <option value="AED">United Arab Emirates Dirham</option>
                                <option value="UYU">Uruguayan Peso</option>
                                <option value="USD">US Dollar</option>
                                <option value="UZS">Uzbekistan Som</option>
                                <option value="VUV">Vanuatu Vatu</option>
                                <option value="VEF">Venezuelan BolÃ­var</option>
                                <option value="VND">Vietnamese Dong</option>
                                <option value="YER">Yemeni Rial</option>
                                <option value="ZMK">Zambian Kwacha</option>
                            </select>
                            <span class="text-danger" id="currencyError"></span>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label> Product: <span class="text-danger">*</span></label>
                            <select id="part" name="part" class="form-control input-sm" style="width:100%" onchange="addSession()">
                            <option value=""> Product</option>
                                @foreach ($parts as $part)
                                    <option value="{{ $part->id }}"> {{ $part->name .' - '.$part->model.' - '.$part->product_code}} </option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-group col-md-12"><br>
                            <label>Parts Details: </label>
                            <table border="1" style="font-size: 13px; width:100%;" class="table-bordered" >
                                <thead >
                                    <tr>
                                        <th>SL</th>
                                        <th c>Product Info</th>
                                        <th class="text-center">Available</th>
                                        <th class="text-center" style="width: 10%;">Qty</th>
                                        <th class="text-right" style="width: 14%;">Unit Price</th>
                                        <th class="text-right" style="width: 14%;">Total</th>
                                        <th class="text-center" style="width: 6%;">Actions</th>
                                    </tr>
                                    
                                </thead>
                                <tbody id="managePartTable"></tbody>
                            </table>
                        </div>
                        <div class="container row col-md-12 p-2">
                            <div class="col-md-2 d-none"><span onclick="clearSession()" id ="clerSessionBtn" style="display:none;" class="btn btn-danger">Clear All Data</span></div>
                            <div class="col-md-3"></div>
                            <div class="col-md-4"><span class="text-danger" id="exceed"></span></div>
                            <div class="col-md-2"></div>
                            <div class="col-md-1 "><span class="btn btn-primary" onclick="submitFormOne()">Submit</span></div>
                        </div>
                    </div>
                </div>
                
                </div>
                
                <br>
            </div>
        </div>
    </div> 
    <br><br>
    
  
@endsection

@section('javascript')
<script>
    $(document).ready(function() {
        $('#currency').select2();
        $('#part').select2();
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
                   // alert(JSON.stringify(result));
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
    
   
    addSession();
    
    function addSession(){
        var claim_id =$('#claim_id').val();
        var part_id =$('#part').val();
        var qty =1;
         $.ajax({
                url:"{{route('edit.product.add.to.session')}}",
                method: "GET",
                data: {
                    "part_id":part_id,
                    "qty":qty,
                    "claim_id":claim_id
                },
                success: function (result){
                    //alert(JSON.stringify(result));
                    fetchCart();
                }, error: function(response){
                   //alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
    
    fetchCart();
    
     function fetchCart() {
            $.ajax({
                url: "{{ route('edit.claim.fetchSession') }}",
                method: "get",
                success: function(result) {
                    //alert(JSON.stringify(result));
                    $("#managePartTable").html(result.cart);
                    $("#totalAmount").text(result.totalAmount);
                    if(result != 'null'){
                        $("#clerSessionBtn").show();
                    }
                    //calculateTotal();
                },
                error: function(response) {
                    //alert(JSON.stringify(response));
                   
                }
            })
        }
        
    function loadCartandUpdate(id){
        var product_quantity = $('#quantity_' + id).val();
        var unitPrice = $('#unitPrice_' + id).val();
        $.ajax({
                url:"{{route('edit.claim.updateSession')}}",
                method: "GET",
                data: {
                    "id":id,
                    "quantity":product_quantity,
                    "unitPrice":unitPrice,
                },
                success: function (result){
                    //alert(JSON.stringify(result));
                    if(result == "exceed"){
                        $('#exceed').text('Stock unavailable');
                    }else if(result == "Success"){
                        $('#exceed').hide();
                        fetchCart();
                    }
                    
                }, error: function(response){
                   // alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
        
        
        
        function clearSession() {
            var clear="1";
            $.ajax({
                url: "{{ route('edit.claim.clearSession') }}",
                method: "GET",
                data: {"clear":clear},
                contentType: false,
                processData: false,
                datatype: "json",
                success: function(result) {
                   // alert(JSON.stringify(result));
                    if (result == "Success") {
                         fetchCart();
                    } else {
                        alert(JSON.stringify(result));
                    }
                },
                beforeSend: function() {
                    $('#loading').show();
                },
                complete: function() {
                    $('#loading').hide();
                },
                error: function(response) {
                    //$("#barcodeError").text("No such product available in your system");
                   // alert(JSON.stringify(response));
                }
            })
               
        }

    function removeSessionPart(id){
        $.ajax({
                url:"{{route('edit.claim.removePart')}}",
                method: "GET",
                data: {
                    "id":id
                },
                success: function (result){
                    //alert(JSON.stringify(result));
                    fetchCart();
                    //location.reload();
                }, error: function(response){
                    //alert(JSON.stringify(response));
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }


    

    

    function submitFormOne(){
        var claim_id=$('#claim_id').val();
        var customer_id=$('#customer_id').val();
        var claim_ref_no=$('#claim_ref_no').val();
        var model=$('#model').val();
        var run_hour=$('#run_hour').val();
        var operating_hours_last_service=$('#operating_hours_last_service').val();
        var service_by=$('#service_by').val();
        var comission_date=$('#comission_date').val();
        var failure_date=$('#failure_date').val();
        var work_done_date=$('#work_done_date').val();
        var defect_details=$('#defect_details').val();
        var defect_issue=$('#defect_issue').val();
        var action_taken=$('#action_taken').val();
        var currency=$('#currency').val();
        var oil_consumption=$('#oil_consumption').val();
        var ambient_temperature=$('#ambient_temperature').val();
        var grand_total=$('#totalAmount').text();
        var vat=$('#vat').text();
        var reg_id=$('#reg_id').val();
        var status=$('#status').val();
        
        $.ajax({
                url:"{{route('update.claims.info')}}",
                method: "GET",
                data: {
                    "claim_id":claim_id,
                    "customer_id":customer_id,
                    "claim_ref_no":claim_ref_no,
                    "model":model,
                    "run_hour":run_hour,
                    "operating_hours_last_service":operating_hours_last_service,
                    "service_by":service_by,
                    "comission_date":comission_date,
                    "failure_date":failure_date,
                    "work_done_date":work_done_date,
                    "defect_details":defect_details,
                    "defect_issue":defect_issue,
                    "oil_consumption":oil_consumption,
                    "ambient_temperature":ambient_temperature,
                    "action_taken":action_taken,
                    "currency":currency,
                    "grand_total":grand_total,
                    "vat":vat,
                    "reg_id":reg_id,
                    "status":status
                },
                success: function (result) {
                    //alert(JSON.stringify(result));
                   $('#alert').html(result.message);
                  window.location.href=("{{ route('allClaim') }}");
                }, error: function(response) {
                    //alert(JSON.stringify(response));
                    
                }, beforeSend: function () {
                    $('#loading').show();
                },complete: function () {
                    $('#loading').hide();
                }
            });
    }
    
    
    function redirect(id){
       // alert(id);
   
        window.open("{{ url('create/new/claim/page/Two') }}" + "/" + id);
    }
    
</script>
@endsection