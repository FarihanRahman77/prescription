<!-- First Section  -->
@extends('backend.layouts.master')
@section('content')
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-1 bg-dark hover_Ef">
                <p class="h3">BASE IT</p>
                <p class="h6">Select Brand</p>
            </div>
            <div class="col-md-4 offset-md-1 bg-dark w-50 d-flex justify-content-center align-items-center">

                <p class="text-white h6">Enter Model:
                    help ?</p>
                
                <div class="input-group ">
                    <input type="text" class="form-control" aria-label="Text input with dropdown button">
                    <div class="input-group-append">
                    <button class="btn btn-outline-info dropdown-toggle text-white" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Search <i class="fa-solid fa-magnifying-glass text-white"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <div role="separator" class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Section  -->

        <div class="row mt-4 ">
            <div class="col offset-md-1 w-25 h-25 bg-secondary">
            <p class="h5 text-center text-white p-2">Latest News</p>
            <hr class="text-white">
                <ul class="list-unstyled text-center text-white h6">
                    <li ><a class="text-decoration-none text-white" href="#"><i class="fa-solid fa-check"></i> Submit a Ticket</a></li>
                    <hr class="text-white">
                    <li ><a class="text-decoration-none text-white" href="#"><i class="fa-solid fa-cash-register"></i> New Frame 3 Launch</a></li>
                    <hr class="text-white">
                    <li ><a class="text-decoration-none text-white" href="#"> Elite Airstation launch <i class="fa-regular fa-hard-drive"></i></a></li>
                    <hr class="text-white">
                    <li ><a class="text-decoration-none text-white" href="#">Latest repsnet updates >></a></li>
                    <hr class="text-white">
                </ul>
            </div>



            <div class="col offset-md-1  ">
                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                    <i class="fa-solid fa-file-lines text-white h1"></i> <br>
                   <p class="text-white">Literature Ordering</p> 
                </a>
                </div> <br>

                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-solid fa-gears text-white h1"></i> <br>
                   <p class="text-white">Product Lunches</p> 
                </a>
                </div> <br>


                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-solid fa-magnifying-glass text-white h1"></i> <br>
                   <p class="text-white">Webinars & Training Videos</p> 
                </a>
                </div> <br>

                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                    <i class="fa-solid fa-download text-white h1"></i> <br>
                   <p class="text-white">Branding and Style Guide</p> 
                </a>
                </div> <br>

            </div>
            <div class="col offset-md-1 ">
                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                    <i class="fa-solid fa-star text-white h1"></i> <br>
                   <p class="text-white">Training Booking</p> 
                </a>
                </div> <br>
                
                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-solid fa-thumbtack fa-spin text-white h1"></i> <br>
                   <p class="text-white">Knowledge Base</p> 
                </a>
                </div> <br>

                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                    <i class="fa-solid fa-atom fa-spin text-white h1"></i> <br>
                   <p class="text-white">Iconn Analytics</p> 
                </a>
                </div> <br>

                <div class="m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-regular fa-file-lines fa-fade text-white h1"></i> <br>
                   <p class="text-white">Keyword Search Selector</p> 
                </a>
                </div>
            </div>

            <div class="col offset-md-1 ">
                <div class="bg-info m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="{{route('warrenty.home')}}">
                    <i class="fa-solid fa-umbrella fa-flip text-white h1"></i> <br>
                   <p class="text-white">Warranty </p> 
                </a>
                </div> <br>
                <div class="bg-info m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                    <i class="fa-solid fa-server fa-flip text-white h1"></i> <br>
                   <p class="text-white">Service Quotes</p> 
                </a>
                </div> <br>
                <div class="bg-info m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-brands fa-instalod fa-spin text-white h1"></i> <br>
                   <p class="text-white">airINSITE</p> 
                </a>
                </div> <br>
                <div class="bg-info m-auto mt-2 p-2 Size_box ">
                    <a class="text-decoration-none" href="#">
                        
                    <i class="fa-brands fa-artstation fa-beat-fade text-white h1"></i> <br>
                   <p class="text-white">ITS|Order Spare Parts</p> 
                </a>
                </div>
              </div>
    </div>
@endsection