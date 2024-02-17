<html>
    <head>
        <title>Claim Report</title>
<style>
          
    body{
    font-family: 'napoli-serial-heavy-regular', sans-serif;
}
#footer {
 position: fixed;
 right: 0px;
 bottom: 10px;
 text-align: center;
border-top: 1px solid black;
}
#footer .page:after {
 content: counter(1, decimal);
}
@page {
margin: 0.3cm 0.3cm 0.3cm 0.3cm;
}
/** Define now the real margins of every page in the PDF **/
body {
margin-top: 15%;
 margin-left: 0.3cm;
 margin-right: 0.3cm;
margin-bottom: 1cm;
}
/** Define the header rules **/
header {
 position: fixed;
 top:1cm;
left: 0cm;
 right: 0cm;
 text-align:center;
}
/** Define the footer rules **/
footer {
position: fixed;
 bottom: 1.2cm;
 left: 0cm;
 right: 0cm;
height: 1.8cm;
text-align:center;
}

/* Clear floats after the columns */
.row:after {
display: table;
clear: both;
}
.signatures{
padding-bottom:-500px;
}
.column {
float: left;
 width: 20%;
font-size:13px;
height:30px;

}

.columnCenter {
float: right;
width: 65%;
font-size:13px;
height:30px;

}
.columnCenter2 {
display:flex;
justify-content:center;
width: 100%;
font-size:13px;
height:30px;

}
.columnCenter2 img{
    height:65px;
    width:210px;
}
.columnRight {
float: right;
width: 20%;
font-size:13px;
height:30px;
}
.columnRight2 {
float: right;
width: 40%;
font-size:13px;
height:30px;
font-size:12px;

}
.columnLeft {
float:left;
width: 60%;
font-size:13px;
height:30px;
text-align:left;
padding-left:20px;
}
.citiestd13 {
text-align: center;
font-size: 20 px;
padding: 2px;
background-color:#fff;
color:#000;
}
.supAddressFont {
font-size:11px;
margin-top:-12px;
text-align:center;
}
.supAddressFontEmi {
font-size:13px;
}
.supAddressFont img{
height:80px;
width:400px;
}
.underAlignment {
text-align:right;
font-size:13px;
}
.underAlignmentLeft {
text-align:left;
font-size:13px;
}
.textLeft{
text-align: left;
font-size:12px;
}
.textRight{
text-align: right;
}
.textCenter{
text-align: center;
}
.waterMark{
position: relative;
z-index:99999;
}
table {
width:100%;
 border-collapse: collapse;
margin-top: 10px;
font-size: 0.8em;
 min-width: 400px;
box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.main-table{
    display:flex;
    justify-content:center;
}

thead tr {
text-align: left;
}
/* th, td {
 padding: 12px 15px;
}
*/
.overline {
text-decoration: overline;
}
.emi-table {
width:80%;
padding-left:10%;
}
.emi-table-title {
padding-left:10px;
margin-bottom:-5px;
padding-left:11%;
}
.text-center{
text-align:center;
}
h2 {
 display: block;
font-size: 2.5em;
 margin-top: 0.67em;
 margin-bottom: 0.1em;
 margin-left: 0;
 margin-right: 0;
 font-weight: bold;
}
p {
 display: block;
 margin-top: .5em;
 margin-bottom: 1em;
 margin-left: 0;
 margin-right: 0;
}
.reportLogo{
 width : 230px;
 height: 100px
}
.reportWatermark{
    display:flex;
    justify-content:center;
    width: 90%;
    height:29%;
    margin-top:35%;
    opacity: 0.07;
}
.background-color{
    background-color: #08143f;
}

.text-light{
    color:#fff;
}

</style>
       
    </head>
    <body>
        <!-- Content Wrapper. Contains page content -->
        <header>
            <!-- Content Header (Page header) -->
            <!---<div class="columnLeft">
                <p style="font-size:20px;"><b>{{$setting->name}}</b></p>
                <span>{{$setting->address}}</span><br>
                <span><b>Phone: </b> {{$setting->phone}}</span><br>
                <span><b>Email: </b> {{$setting->email}}</span><br>
                <span><b>Website: </b> {{$setting->fax}}</span><br>
            </div>---->
            <div class="columnCenter2">
                <img src="{{asset('backend/image/logo.png')}}" class="reportLogo">
            </div>
            <div>
                 <img src="{{asset('backend/image/logo.png')}}" class="reportWatermark"> 
            </div>
        </header>
       <!--- <footer>
            <div class="signatures">
                <div class="row">
                    <div class="columnRight">
                    {{ Session::get('userName') }}
                        <br>-----------------------<br>
                            Created By 
                    </div>
                    <div class="column"> 
                        <br>-----------------------<br>                 
                        Customer Signature            
                    </div>
                    <div class="columnCenter">
                        
                        <br>-----------------------<br>                       
                        Authorized Signature
                    </div>                 
                </div><br><br><br>
                <hr />
                <div class="supAddressFont"><br><br>{{@ $setting->report_footer}}</div>
            </div>    
        </footer>------>
        <main class="waterMark">
           
            <div>
                <div style="text-align: center;">
                    <div class="citiestd13">
                        @php 
                            $year=date("Y", strtotime($claim->created_at));
                        @endphp
                        <b> {{@$claim->claim_type}} Report : {{ @$claim->serial_key}}-{{ @$claim->year}}-{{ @$claim->claim_serial }}</b>
                    </div>
                </div>
                <table cellspacing="0"  cellpadding="3" border="1">
                    <tbody>
                        <tr class="background-color">
                            <td colspan="4" class="text-light textCenter"><b>{{@$claim->claim_type}} Details</b></td>
                        </tr>
                        <tr>
                            <td colspan="2" width="50%"><b>Claimant Details</b></td>
                            <td colspan="2" width="50%"><b>End User Details</b></td>
                        </tr>
                        <tr>
                            <td width="20%">Company Name:</td>
                            <td width="30%">{{@$setting->name}}</td>
                            <td width="20%">Company Name:</td>
                            <td width="30%">{{@ $customer->company_name}}</td>
                        </tr>
                        <tr>
                            <td width="20%">Company Address:</td>
                            <td width="30%">{{@$setting->address}}</td>
                            <td width="20%">Company Address:</td>
                            <td width="30%">{{ @$customer->address }}</td>
                        </tr>
                        <tr>
                            <td width="20%">City:</td>
                            <td width="30%">Dhaka</td>
                            <td width="20%">City:</td>
                            <td width="30%">{{ @$customer->city }}</td>
                        </tr>
                        <tr>
                            <td width="20%">Country:</td>
                            <td width="30%">Bangladesh</td>
                            <td width="20%">Country:</td>
                            <td width="30%">{{ @$customer->country }}</td>
                        </tr>
                        <tr>
                            <td width="20%">Phone:</td>
                            <td width="30%">{{@$setting->phone}}</td>
                            <td width="20%">Phone:</td>
                            <td width="30%">{{@$customer->phone }}</td>
                        </tr>
                        <tr>
                            <td width="20%">Email:</td>
                            <td width="30%">{{@$setting->email}}</td>
                            <td width="20%">Email:</td>
                            <td width="30%">{{ @$customer->email }}</td>
                        </tr>
                        <tr>
                            <td width="20%">Division :</td>
                            <td colspan="3">Industrials</td>
                        </tr>
                        <tr>
                            <td width="20%">Local Warranty Department :</td>
                            <td colspan="3">Trident</td>
                        </tr>
                        
                        <!--<tr>
                            <td width="50%" class="supAddress">
                                <div><strong>Company Name : </strong>{{ $customer->company_name}}</div>
                                <div><strong>Contact Person : </strong>{{ $customer->name}}</div>
                                <div><strong>Address: </strong>{{ $customer->address }}</div>
                                <div><strong>Phone: </strong>{{ $customer->phone }}</div>
                                <div><strong>Registration No : </strong>{{ $claim->registration_number }} <br> <strong>Installation Date : </strong>{{ $claim->instalation_date }}</div>
                            </td>
                            <td width="50%" class="supAddress">
                                <div><strong id="invoiceNo">Claim ID: #{{ $claim->claim_serial }}</strong></div>
                                <div><strong>Claim Ref: {{ $claim->claim_reference }}</strong></div>
                                <div><strong>Comission Date: </strong> {{ $claim->comission_date }}</div>
                                <div><strong>Service By: </strong> {{ $claim->service_by }}</div>
                            </td>
                        </tr>---->
                    </tbody>
                </table>
            </div>
            <br><br>
            <div>
                <table cellspacing="0"  cellpadding="3" border="1">
                    <tbody>
                        <tr class="background-color">
                            <td colspan="4" class="text-light textCenter"><b>Other Details</b></td>
                        </tr>
                        <tr>
                            <td width="15%">{{@$claim->claim_type}} Reference:</td>
                            <td width="35%">{{@$claim->claim_reference}}</td>
                            <td width="15%">Ambient Temperature:</td>
                            <td width="35%">{{@ $claim->ambient_temperature}}</td>
                        </tr>
                        <tr>
                            <td width="15%">Registration No:</td>
                            <td width="35%">{{@$claim->registration_number}}</td>
                            <td width="15%">Temperature Unit:</td>
                            <td width="35%">C</td>
                        </tr>
                        <tr>
                            <td width="15%">Serial No:</td>
                            <td width="35%">{{@$claim->serial_no}}</td>
                            <td width="15%">Oil Consumption:</td>
                            <td width="35%">{{@ $claim->oil_consumption}}</td>
                        </tr>
                        <tr>
                            <td width="15%">Model:</td>
                            <td width="35%">{{@$claim->model}}</td>
                            <td width="15%" rowspan="2">Defect Found:</td>
                            <td width="35%"rowspan="2">{{@ $claim->defect_details}}</td>
                        </tr>
                        <tr>
                            <td width="15%">Running Hours at services:</td>
                            <td width="35%">{{@$claim->run_hour}}</td>
                        </tr>
                        <tr> 
                            <td width="15%">Running hours when last serviced:</td>
                            <td width="35%">{{@$claim->operating_hours_last_service}}</td>
                             <td width="15%" rowspan="3">Defect Issue:</td>
                            <td width="35%" rowspan="3">{{@ $claim->defect_issue}}</td>
                            
                        </tr>
                        <tr> 
                            <td width="15%">Serviced By:</td>
                            @php 
                            $service='';
                            if($claim->claim_type == 'Claim'){
                                $service=$claim->service_by;
                            }elseif($claim->claim_type == 'Service'){
                                $service=$claim->serviceBy;
                            }
                            @endphp
                            <td width="35%">{{@$service}}</td>
                        </tr>
                        <tr> 
                            <td width="15%">Commissioning Date:</td>
                            <td width="35%">{{@$claim->instalation_date}}</td>
                            
                        </tr>
                        <tr> 
                            <td width="15%">Failure Date:</td>
                            <td width="35%">{{@$claim->failure_date}}</td>
                            <td width="15%" rowspan="2">Action Taken:</td>
                            <td width="35%" rowspan="2">{{@ $claim->action_taken}}</td>
                            
                        </tr>
                        <tr> 
                            <td width="15%">Date of Repair:</td>
                            <td width="35%">{{@$claim->work_done_date}}</td>
                            
                        </tr>
                        
                        <tr> 
                            <td width="15%">{{@$claim->claim_type}} Creation Date:</td>
                            <td width="35%">{{@$claim->created_at}}</td>
                            <td width="15%">Remarks:</td>
                            <td width="35%">{{@$claim->remarks}}</td>
                        </tr> 
                        <tr> 
                            <td colspan="4"><b>Warrenty Details:</b></td>
                        </tr> 
                        <tr> 
                            @php 
                                $expire_date=date('d-m-Y', strtotime($claim->instalation_date. ' + '.$claim->warrenty_type.' years'));
                            @endphp
                            <td colspan="4">
                                Expired Date:{{@$expire_date}}<br>
                                Hours Limited: {{$claim->annual_run_hour * $claim->warrenty_type}}
                            </td>
                        </tr> 
                    </tbody>
                </table>
            </div>
            <br><br>
            <div>
                <table border="1" class="invoice-info" cellspacing="0" cellpadding="3">
                    <thead>
                        <tr class="background-color">
                            <td colspan="7" class="text-light textCenter"><b>Parts Used</b></td>
                        </tr>
                        <tr>
                            <td colspan="7">{{@$claim->claim_type}} Currency: {{@$claim->currency}}</td>
                        </tr>
                        <tr>
                            <th>SL</th>
                            <th>Category</th>
                            <th>Parts Description</th>
                            <th>Model</th>
                            <th>Qty</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php 
                        $sl=1;
                        $grandTotal=0.00;
                        @endphp
                        @foreach($claimProducts as $part)
                        <tr>
                            <td class="textLeft">{{$sl++}}</td>
                            <td class="citiestd15">{{$part->category_name}} </td>
                            <td class="citiestd15">{{$part->name}}-{{$part->product_code}} </td>
                            <td class="citiestd15">{{$part->model}} </td>
                            <td class="text-center">{{$part->qty}}</td>
                            <td class="text-center">{{$part->unit_price}} {{@ $claim->currency}}</td>
                            <td class="textRight">{{$part->total_price}} {{@ $claim->currency}}</td>
                        </tr>
                        @php 
                        $grandTotal +=$part->total_price;
                        @endphp
                        @endforeach
                        <tr>
                            <td colspan="6" class="textRight">Total :  </td>
                            <td class="textRight">{{$claim->grand_total}} {{@ $claim->currency}}</td>
                        </tr>
                        <tr>
                            <td colspan="6" class="textRight">Vat : </td>
                            <td class="textRight">{{$claim->vat}} {{@ $claim->currency}}</td>
                        </tr>
                        <tr>
                            <td colspan="6" class="textRight">Grand Total : </td>
                            <td class="textRight">{{$claim->grand_total + $claim->vat}}.00  {{@ $claim->currency}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>


    </body>

</html>
