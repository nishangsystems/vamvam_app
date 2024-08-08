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
                            <div class="card-title">Add Executive</div>
                        </div>
                        <form action="{{ route('admin_executive_store') }}" method="post" id="formSubmitBack" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="customer_id" id="customer_id" value="">
                            <div class="card-body element-2">
                                <div class="row">
                              
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
                                            <label for="district">District</label>
                                            <select class="form-control district" name="district_id" required id="district_id">
                                                <option value="">Select District</option>
                                            </select>
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="subdistrict">Taluk/Tehsil/Subdistrict</label>
                                            <select class="form-control tehsil" name="tehsil_id"  id="tehsil_id">
                                                <option value="">Select Taluk/Tehsil/Subdistrict</option>
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
                                            <label for="city-town-village">City / Twon / Village</label>
                                            <select class="form-control city_village" name="city_village_id" id="cityVillage">
                                                <option value="">Select City</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="city-town-village">Executive Name</label>
                                            <select class="form-control executive_info" name="executive_info" id="executive_info">
                                                <option value="">Select Executive</option>
                                            </select>
                                        </div>
                                    </div>
                                   

                                   

                                </div>                                
                            </div>
                            <div class="card-action element-2 text-center">
                                <a href="{{route('admin_user')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                                <button type="submit" name="Submit" id="loderButton" class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Assign</button>
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
    $("#cityVillage").change(function() {
        var city_id = $(this).val();
        $.ajax({
            type: 'post',
            url: "{{ route('jsonCityCustomer') }}",
            data: {
                city_id: city_id,
                _token: '{{ csrf_token() }}'
            },
            success: function(data) 
            {
                $('.executive_info').empty();
                if (data.customer.length > 0) {
                    $('.executive_info').html('<option value="">Select Executive</option>');
                    $.each(data.customer, function(key, value) {
                        $(".executive_info").append('<option value="' + value.id +
                            '">'+value.name+' ('+value.mobile+')</option>');
                    });
                } else {
                    $('.executive_info').html('<option value="">Not Found</option>');
                }

            }
        });
    });
</script>
@endsection
