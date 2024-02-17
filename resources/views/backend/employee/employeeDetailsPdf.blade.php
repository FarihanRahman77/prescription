<html>
    <head>
        <title>Employee QR code</title>
       @include('backend.layouts.globalCss') 
    </head>
    <body>
        <!-- Content Wrapper. Contains page content -->
        <header>
            
            <div class="columnCenter2">
               <img src="{{asset('backend/image/logo.png')}}" class="reportLogo">
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
                       
                        <b>QR code for {{$employee->designation}}</b>
                    </div>
                </div>
                <div class="card-body">
                   <img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')->size(250)->generate($employee->token ?? ' ')) !!} " id="QrImage">
                </div>
                <br><br>
                <div class="citiestd13"> 
                    <b>Registration Number:</b>{{@$employee->name}}<br>
                    <b>Serial Number:</b>{{@$employee->serial_no}}
                </div>
            </div>
        </main>
    </body>

</html>
