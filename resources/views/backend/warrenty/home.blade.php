@extends('backend.layouts.master')
@section('content')
<div class="container">
        <div class="row ">
            @if (Auth::guard('web')->user()->can('Registration'))
            <div class="col-md-6  w-50 " >
                <div class="p-2" style="margin:2px;">
                    <p class="h5 text-white bg-dark w-100 p-3 d-flex justify-content-between">Registration <i class="fa-solid fa-address-card h2 text-light"></i></p>
                    @if (Auth::guard('web')->user()->can('Registration Create'))
                    <a class="m-3 text-decoration-none" href="{{route('warrenty.add.registration')}}">Start new registration</a> <br>
                    @endif
                    <hr>
                     @if (Auth::guard('web')->user()->can('Registration Create'))
                    <a class="m-3" href="{{ route('search.view') }}">Search / Edit registrations</a>
                    @endif
                    <hr>
                </div>
            </div>
            @endif
            @if (Auth::guard('web')->user()->can('Claim'))
            <div class="col-md-6   w-50 " >
                <div class="p-2" style="margin:2px;">
                    <p class="h5 text-white bg-dark w-100 p-3 d-flex justify-content-between">Claim <i class="fa-regular fa-id-card h2 text-light"></i></p>
                    <a class="m-3 text-decoration-none" href="{{route('newClaim')}}">New Claim</a> <br>
                    <hr>
                    <a class="m-3" href="{{route('allClaim')}}">All Claim</a>
                    <hr>
                </div>
            </div>
            @endif
            @if (Auth::guard('web')->user()->can('Service Create'))
            <div class="col-md-6 w-50">
                <div class="p-2" style="margin:2px;">
                    <p class="h5 text-white bg-dark w-100 p-3 d-flex justify-content-between">Service Create<i class="fa-solid fa-screwdriver-wrench h2 text-light"></i></p>
                    <a class="m-3 text-decoration-none" href="{{route('create_service')}}">Create Service</a> <br>
                    <hr>
                    <a href="#">&nbsp</a>
                    <hr>
                    <a href="#">&nbsp</a>
                    <hr>
                </div>
            </div>
            @endif
        
        </div>
    </div>
    @endsection
