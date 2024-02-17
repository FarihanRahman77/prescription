@extends('backend.layouts.master')


@section('content')
 <div class="container">
        <div class="row">
            <div class=" col-md-12 content border border-secondary w-75 h-auto m-auto">
                    @if(session()->has('message'))
                        <div class="alert alert-success">
                            {{ session()->get('message') }} 
                        </div>
                    @endif
                <h3 class="text-center text-dark text-decoration-underline ">Claim Attachment List</h3>
                <form action="{{ route('save.claim.attachment') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="claim_id" value="{{$id}}">
                    <div class="row">
                        <h5 class="text-center text-dark text-decoration-underline m-2">UPLOAD REQUIRED ATTACHMENT</h5>
                        <div class="col-md-6 mb-3 d-flex justify-content-center" >
                            <input class="form-control" type="file" id="claim_attachment" name="claim_attachment" required>
                            <button type="submit" class="btn btn-primary ml-1">Save</button>
                        </div>
                    </div>

                </form>
                <div class="table-responsive">
                        <table id="manageClaimAttachmentTable" width="70%" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td width="5%" class="text-center">SL#</td>
                                    <td width="20%" class="text-center">Date</td>
                                    <td width="70%" class="text-center">Attachment</td>
                                    <td width="5%" class="text-center">Actions</td>
                                </tr>
                            </thead>
                            <tbody style="font-size:12px;">
                                @php 
                                    $i=1;
                                @endphp
                                @foreach($attachments as $attachment)
                                <tr >
                                    <td>{{$i++}}</td>
                                    <td>{{$attachment->date}}</td>
                                    <td>{{$attachment->claim_attachment}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                <i class="fas fa-cog"></i><span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" style="border: 1px solid gray;" role="menu">
                                                
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/details/claim/attachment',$attachment->id)}}"><i class="fas fa-file-pdf"></i> Details </a></li>
                                                <li class="action liDropDown"><a  class="btn" href="{{url('/delete/claim/attachment',$attachment->id)}}"><i class="fas fa-trash-alt"></i> Delete </a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
    </div> 
    <br><br>
    
  

<script>
    $(document).ready( function () {
        $('#manageClaimAttachmentTable').DataTable();
    } );
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

@endsection