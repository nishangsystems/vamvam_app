@extends('admin.layout.app')
@section('content')
@php
$dob = date('d.m.Y', strtotime($user->dob));
$bday = new \DateTime($dob); // Your date of birth
$today = new \Datetime(date('m.d.y'));
$diff = $today->diff($bday);
$age = $diff->y;

@endphp

<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Edit User</div>
                        </div>
                        <form action="{{ route('admin_user_update') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id" value="{{ base64_encode($user->id) }}">
                            <div class="card-body element-2">
                                <div class="row">
                                <div class="col-lg-12">
                                        <div class="address-details my-3">
                                            <h2>Personal Details</h2>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="name">Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" value="{{$user->name}}" required>
                                        </div>
                                    </div>
                                     <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="gender-id">Gender<span class="text-danger">*</span></label>
                                            <select class="form-control" name="gender" required id="gender-id">
                                                <option value="">Select Gender</option>
                                                <option value="Male" @if($user->gender == 'Male') selected @endif>Male</option>
                                                <option value="Female" @if($user->gender == 'Female') selected @endif>Female</option>
                                                <option value="Other" @if($user->gender == 'Other') selected @endif>Other</option>
                                            </select>
                                        </div>
                                    </div>
                                    @php
                                       $dob = date('Y-m-d', strtotime('-18 years'));
                                     @endphp
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="dob">DOB<span class="text-danger">*</span></label>
                                            <input type="date" max="{{$dob}}" class="form-control dob-cls" id="dob" name="dob" placeholder="Enter DOB" value="{{$user->dob}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="age">Age</label>
                                            <input type="text" class="form-control" id="age" name="age" placeholder="Age" value="{{$age ?? ''}}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="g-name">Guardian Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="g-name" name="guardian_name" placeholder="Enter Guardian Name" value="{{$user->guardian_name}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="relation">Relation<span class="text-danger">*</span></label>
                                            <select class="form-control" name="relation" required id="relation">
                                                <option value="">Select Relation</option>
                                                <option value="Father" @if($user->relation == 'Father') selected @endif>Father</option>
                                                <option value="Mother" @if($user->relation == 'Mother') selected @endif>Mother</option>
                                                <option value="Husband" @if($user->relation == 'Husband') selected @endif>Husband</option>
                                                <option value="Wife" @if($user->relation == 'Wife') selected @endif>Wife</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="Mobile-no">Mobile No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="Mobile-no" name="mobile" placeholder="Enter Mobile No" onkeypress="return numbersonly(event)" maxlength="10" value="{{$user->mobile}}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="email-id">Email Id</label>
                                            <input type="email" class="form-control" id="email-id" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$" value="{{$user->email}}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="voter-id">Voter ID</label>
                                            <input type="text" class="form-control" id="voter-id" name="voter_id" placeholder="Enter Voter No" onkeypress="return IsAlphaNumeric(event)" maxlength="10" value="{{$user->voter_id}}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="aadhaar-id">Aadhaar No</label>
                                            <input type="text" class="form-control" id="aadhaar-id" name="aadhaar_card" placeholder="Enter Aadhaar No" onkeypress="return numbersonly(event)" maxlength="12" value="{{$user->aadhaar_card}}">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="address-details my-3">
                                            <h2>Address Details</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="state">State</label>
                                            <select class="form-control state" name="state_id" id="state">
                                                <option value="">Select State / Union Territory</option>
                                                @foreach($states as $state)
                                                  <option value="{{$state->id}}" @if($user->addressInfo->state_id == $state->id) selected @endif>{{$state->name}}</option>
                                                @endforeach  
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="district">District</label>
                                            <select class="form-control district" name="district_id" id="district">
                                                <option value="">Select District</option>
                                                @foreach($districts as $district)
                                                  <option value="{{$district->id}}" @if($user->addressInfo->district_id == $district->id) selected @endif>{{$district->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="Parliamentary">Parliamentary Constituency</label>
                                            <select class="form-control parliamentary" name="parliamentary_id"  id="Parliamentary">
                                                <option value="">Select Parliamentary</option>
                                                @foreach($parliamentaries as $parliamentary)
                                                  <option value="{{$parliamentary->id}}" @if($user->addressInfo->parliamentary_id == $parliamentary->id) selected @endif>{{$parliamentary->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="assembly">Assembly Constituency</label>
                                            <select class="form-control assembly" name="assembly_id" id="assembly">
                                                <option value="">Select Assembly</option>
                                                @foreach($assemblies as $assembly)
                                                  <option value="{{$assembly->id}}" @if($user->addressInfo->assembly_id == $assembly->id) selected @endif>{{$assembly->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="area">Area</label>
                                            <select class="form-control" name="area" id="area">
                                                <option value="">Select Area</option>
                                                <option value="Urban" @if($user->addressInfo->area == 'Urban') selected @endif>Urban</option>
                                                <option value="Rural" @if($user->addressInfo->area == 'Rural') selected @endif>Rural</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="subdistrict">Tehsil</label>
                                            <select class="form-control tehsil" name="tehsil_id"  id="subdistrict">
                                                <option value="">Select Tehsil</option>
                                                @foreach($tehsils as $tehsil)
                                                  <option value="{{$tehsil->id}}" @if($user->addressInfo->tehsil_id == $tehsil->id) selected @endif>{{$tehsil->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="block">Town/Village</label>
                                            <select class="form-control town_village" name="town_village_id"  id="town_village">
                                                <option value="">Select Town/Village</option>
                                                @foreach($townVillages as $townVillage)
                                                  <option value="{{$townVillage->id}}" @if($user->addressInfo->town_village_id == $townVillage->id) selected @endif>{{$townVillage->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="city-town-village"> Panchayat/Ward</label>
                                            <select class="form-control panchayat_ward" name="panchayat_ward_id" id="panchayat_ward_id">
                                                <option value="">Select  Panchayat/Ward</option>
                                                @foreach($panchayatWards as $panchayatWard)
                                                  <option value="{{$panchayatWard->id}}" @if($user->addressInfo->panchayat_ward_id == $panchayatWard->id) selected @endif>{{$panchayatWard->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                               
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="block">Block</label>
                                            <select class="form-control block" name="block_id"  id="block_id">
                                                <option value="">Select Block</option>
                                                @foreach($blocks as $block)
                                                  <option value="{{$block->id}}" @if($user->addressInfo->block_id == $block->id) selected @endif>{{$block->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ward">Thana</label>
                                            <select class="form-control thana" name="thana_id" id="thana">
                                                <option value="">Select Thana</option>
                                                @foreach($thanas as $thana)
                                                  <option value="{{$thana->id}}" @if($user->addressInfo->thana_id == $thana->id) selected @endif>{{$panchayatWard->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ward">Post Office</label>
                                            <select class="form-control post_office" name="post_office_id" id="post_office">
                                                <option value="">Select Post Office</option>
                                                @foreach($postOffices as $postOffice)
                                                  <option value="{{$postOffice->id}}" @if($user->addressInfo->post_office_id == $postOffice->id) selected @endif>{{$postOffice->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                
                                   
                                    
                                           
                                        
                                           
                                    

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="street-area">Street / Area / Locality</label>
                                            <input type="text" class="form-control" id="street-area" name="locality" placeholder="Enter Street / Area / Locality" value="{{$user->addressInfo->locality}}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="building-house">Building / House No</label>
                                            <input type="text" class="form-control" id="building-house" name="house_no" placeholder="Enter Building / House No" value="{{$user->addressInfo->house_no}}">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="pin">Pin</label>
                                            <input type="text" class="form-control" id="pin" name="pincode" placeholder="Enter Pin" onkeypress="return numbersonly(event)" maxlength="6" value="{{$user->addressInfo->pincode}}">
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_user')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
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
