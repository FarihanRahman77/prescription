<html>
    <head>
        <title>CERTIFICATE OF REGISTRATION</title>
       @include('backend.layouts.globalCss') 
    </head>
    <body>
       
        <header>
           
            <div class="columnCenter2">
                <img src="{{asset('backend/image/logo.png')}}" class="reportLogo">
            </div>
            <div>
                 <img src="{{asset('backend/image/logo.png')}}" class="reportWatermark"> 
            </div>
        </header>
        <footer>
            <div class="signatures">
                <div class="row">
                    <div class="columnRight">
                        Signed<br>{{@$setting->name}}
                    </div>
                    <div class="column"> 
                    <br>{{ @$serviceWarrenty->created_at}}  
                    </div>
                                     
                </div><br><br><br>
                <hr />
                <div class="supAddressFont"><br><br>{{@$setting->report_footer}}</div>
            </div>    
        </footer>
        <main class="waterMark">
            
            <div>
                <div style="text-align: center;">
                    <div class="citiestd13">
                        <b>CERTIFICATE OF REGISTRATION</b>
                    </div>
                </div>
                <div style="text-align: center;">
                    <p>This is to certify that the compressor detailed below has been registered as <br> a part of the Trident Agency Ltd Warranty Programme</p>
                </div>
                
               
            </div>
            
            <div class="main-table">
                <table border="1" class="custom-table" cellspacing="0" cellpadding="3">
                    <tbody>
                        <tr>
                            <td class="textLeft" width="50%">Registration Number:</td>
                            <td>{{@$serviceWarrenty->registration_number}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Registered Owner:</td>
                            <td>{{ @$customer->company_name}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Address</td>
                            <td>{{ @$customer->address }}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Service Provider:</td>
                            <td>{{@$setting->name}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Provider Address:</td>
                            <td>{{@$setting->address}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Registered By:</td>
                            <td>{{@$serviceWarrenty->registered_by}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Serial Number:</td>
                            <td>{{@$product->serial_no}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Model:</td>
                            <td>{{@$product->model}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Warranty:</td>
                            <td>{{@$warrentyType->type}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Commissioned:</td>
                            <td>{{@$serviceWarrenty->instalation_date}}</td>
                        </tr>
                        <tr>
                            <td class="textLeft">Warranty Expiry Date:</td>
                            <td>{{@$serviceWarrenty->expire_date}}</td>
                        </tr>
                        
                        
                    </tbody>
                </table>
            </div>
        </main>


    </body>

</html>
