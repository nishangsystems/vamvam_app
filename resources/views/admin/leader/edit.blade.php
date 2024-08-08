@extends('admin.layout.app')
@section('content')
<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Edit Leader</div>
                        </div>
                        <form action="{{ route('admin_leader_update') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id" value="{{ base64_encode($leader->id) }}">
                            <div class="card-body element-2">
                                <div class="row">
                                    
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" value="{{$leader->name}}" required>
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Mobile-no">Mobile No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="Mobile-no" name="mobile" placeholder="Enter Mobile No" onkeypress="return numbersonly(event)" maxlength="10" value="{{$leader->mobile}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email-id">Email Id<span class="text-danger">*</span></label>
                                            <input type="email" class="form-control" id="email-id" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$" value="{{$leader->email}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="aadhaar-id">Aadhaar No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="aadhaar-id" name="aadhaar_card" placeholder="Enter Aadhaar No" onkeypress="return numbersonly(event)" maxlength="12" value="{{$leader->aadhaar_card}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="voter-id">Voter ID</label>
                                            <input type="text" class="form-control" id="voter-id" name="voter_id" placeholder="Enter Voter No" onkeypress="return IsAlphaNumeric(event)" maxlength="10" value="{{$leader->voter_id}}">
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_leader')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection

@section('js')
    <script type="text/javascript">
        // Destroy on button
        $("#area").change(function(){  
          //e.preventDefault();
          var area_type = document.getElementById('area').value;
          
          $("#ruralForm").hide();
          $("#urbanForm").hide();

          if(area_type == 'Urban'){
            $("#urbanForm").show();
          }
          if(area_type == 'Rural'){
            $("#ruralForm").show();
          }
        }); // end Document.
    </script>

    @endsection
