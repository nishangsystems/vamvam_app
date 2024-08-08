@extends('admin.layout.app')
@section('css')
<style>
    .dob-cls {
    box-sizing: border-box;
    outline: 0;
    padding: .75rem;
    position: relative;
    width: 100%;
}

.dob-cls[type="date"]::-webkit-calendar-picker-indicator {
    background: transparent;
    bottom: 0;
    color: transparent;
    cursor: pointer;
    height: auto;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: auto;
}

 .search-by-dv {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: center;
        align-items: center;
    }
    .card-action-searchby {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: center;
        align-items: center;
        margin-top: 25px;
    }
</style>
@endsection

@section('content')
<div class="main-panel">
    <div class="content">
        <div class="page-inner element-1">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Add Complaint</div>
                        </div>
                        <form action="{{ route('admin_complaint_store') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="customer_id" id="customer_id" value="">
                            <div class="card-body element-2">
                                <div class="row">
                                
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="search-by-dv">
                                                <div class="form-group">
                                                <label for="voter-id">Search By Voter ID/Aadhaar No/Mobile/Email<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="check_customer_info" name="check_customer_info" placeholder="Enter Voter ID/Aadhaar No/Mobile/Email">
                                            </div>
                                            <div class="card-action-searchby element-2 text-center">
                                                <a href="{{url('admin/complaint/create')}}" class="btn btn-light mr-2 btn-size-cus">Clear</a>
                                                <button type="button" class="btn btn-primary px-5 rounded-0 btn-size-cus checkAlreadyCustomer">Search</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>

                                <div class="col-lg-12">
                                        <div class="address-details my-3">
                                            <h2>Personal Details</h2>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="name">Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required>
                                        </div>
                                    </div>
                                     <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="gender-id">Gender<span class="text-danger">*</span></label>
                                            <select class="form-control" name="gender" required id="gender">
                                                <option value="">Select Gender</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Other">Other</option>
                                            </select>
                                        </div>
                                    </div>
                                    @php
                                       $dob = date('Y-m-d', strtotime('-18 years'));
                                     @endphp
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="dob">DOB<span class="text-danger">*</span></label>
                                            <input type="date" max="{{$dob}}" class="form-control dob-cls" id="dob" name="dob" placeholder="Enter DOB" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="age">Age</label>
                                            <input type="text" class="form-control" id="age" name="age" placeholder="Age" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="g-name">Guardian Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="guardian_name" name="guardian_name" placeholder="Enter Guardian Name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="relation">Relation<span class="text-danger">*</span></label>
                                            <select class="form-control" name="relation" required id="relation">
                                                <option value="">Select Relation</option>
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Husband">Husband</option>
                                                <option value="Wife">Wife</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="Mobile-no">Mobile No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile No" onkeypress="return numbersonly(event)" maxlength="10" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="email-id">Email Id</label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="voter-id">Voter ID</label>
                                            <input type="text" class="form-control" id="voter_id" name="voter_id" placeholder="Enter Voter No" onkeypress="return IsAlphaNumeric(event)" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="aadhaar-id">Aadhaar No</label>
                                            <input type="text" class="form-control" id="aadhaar_card" name="aadhaar_card" placeholder="Enter Aadhaar No" onkeypress="return numbersonly(event)" maxlength="12">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="address-details my-3">
                                            <h2>Address Details</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="state">State<span class="text-danger">*</span></label>
                                            <select class="form-control state" name="state_id" id="state_id" required>
                                                <option value="">Select State / Union Territory</option>
                                                @foreach($states as $state)
                                                  <option value="{{$state->id}}">{{$state->name}}</option>
                                                @endforeach  
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="district">District<span class="text-danger">*</span></label>
                                            <select class="form-control district" name="district_id" required id="district_id">
                                                <option value="">Select District</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="Parliamentary">Parliamentary Constituency</label>
                                            <select class="form-control parliamentary" name="parliamentary_id"  id="parliamentary_id">
                                                <option value="">Select Parliamentary</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="assembly">Assembly Constituency</label>
                                            <select class="form-control assembly" name="assembly_id" id="assembly_id">
                                                <option value="">Select Assembly</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="area">Area</label>
                                            <select class="form-control" name="area" id="area">
                                                <option value="">Select Area</option>
                                                <option value="Urban">Urban</option>
                                                <option value="Rural">Rural</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="subdistrict">Tehsil</label>
                                            <select class="form-control tehsil" name="tehsil_id"  id="tehsil_id">
                                                <option value="">Select Tehsil</option>
                                            </select>
                                        </div>
                                    </div>
                                                                     
                                    
                                   <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="block">Town/Village</label>
                                            <select class="form-control town_village" name="town_village_id"  id="town_village">
                                                <option value="">Select Town/Village</option>
                                            </select>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="city-town-village"> Panchayat/Ward</label>
                                            <select class="form-control panchayat_ward" name="panchayat_ward_id" id="panchayat_ward_id">
                                                <option value="">Select  Panchayat/Ward</option>
                                            </select>
                                        </div>
                                    </div>
                               
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="block">Block</label>
                                            <select class="form-control block" name="block_id"  id="block_id">
                                                <option value="">Select Block</option>
                                            </select>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ward">Thana</label>
                                            <select class="form-control thana" name="thana_id" id="thana">
                                                <option value="">Select Thana</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ward">Post Office</label>
                                            <select class="form-control post_office" name="post_office_id" id="post_office">
                                                <option value="">Select Post Office</option>
                                            </select>
                                        </div>
                                    </div> 
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="street-area">Street / Area / Locality</label>
                                            <input type="text" class="form-control" id="locality" name="locality" placeholder="Enter Street / Area / Locality" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="building-house">Building / House No</label>
                                            <input type="text" class="form-control" id="house_no" name="house_no" placeholder="Enter Building / House No" >
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="pin">Pin</label>
                                            <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter Pin" onkeypress="return numbersonly(event)" maxlength="6">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="address-details my-3">
                                            <h2>Complaint Details</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="" class="text-white">Department<span style="color:red;">*</span></label>
                                            <select class="form-control" name="department_id" required>
                                               <option value="">Select Department</option>
                                               @foreach($departments as $department)
                                               <option value="{{$department->id}}">{{$department->name}}</option>
                                               @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="" class="text-white">Issue Type<span style="color:red;">*</span></label>
                                            <select class="form-control" name="issue_type_id" required>
                                               <option value="">Select Issue Type</option>
                                               @foreach($issueTypes as $issueType)
                                               <option value="{{$issueType->id}}">{{$issueType->name}}</option>
                                               @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                         <div class="form-group">
                                            <label for="" class="text-white">File</label>
                                            <input type="file" class="form-control" name="complaint_file[]" multiple>
                                         </div>
                                    </div>
                                    <div class="col-lg-12">
                                         <div class="form-group">
                                            <label for="" class="text-white">Message<span style="color:red;">*</span></label>
                                            <textarea class="form-control" name="message" required></textarea>
                                         </div>
                                    </div>


                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{url('admin/complaint/create')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>
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

