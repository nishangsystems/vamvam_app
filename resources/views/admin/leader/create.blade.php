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
                            <div class="card-title">Add Leader</div>
                        </div>
                        <form action="{{ route('admin_leader_store') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body element-2">
                                <div class="row">
                                    

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Mobile-no">Mobile No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile No" onkeypress="return numbersonly(event)" maxlength="10" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email-id">Email Id<span class="text-danger">*</span></label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$" required>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email-id">Password<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                                        </div>
                                    </div> -->
                                    
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="aadhaar-id">Aadhaar No<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="aadhaar_card" name="aadhaar_card" placeholder="Enter Aadhaar No" onkeypress="return numbersonly(event)" maxlength="12" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="voter-id">Voter ID</label>
                                            <input type="text" class="form-control" id="voter_id" name="voter_id" placeholder="Enter Voter No" onkeypress="return IsAlphaNumeric(event)" maxlength="10">
                                        </div>
                                    </div>
                                   
                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_leader')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection

 