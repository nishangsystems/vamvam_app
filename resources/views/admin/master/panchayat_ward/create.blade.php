<div class="modal fade add_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document" >
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Add Panchayat/Ward</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form action="{{route('admin_panchayat_ward_store') }}" method="post" id="formSubmit" enctype="multipart/form-data" >
            @csrf
              
               <div class="form-group">
                  <label for="" class="text-white">State<span style="color:red;">*</span></label>
                  <select class="form-control state" name="state_id" required>
                     <option value="">Select State</option>
                     @foreach($states as $state)
                       <option value="{{$state->id}}">{{$state->name}}</option>
                     @endforeach
                  </select>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">District<span style="color:red;">*</span></label>
                  <select class="form-control district" name="district_id" required=""> 
                     <option value="">Select District</option>
                </select>
               </div>


               <div class="form-group">
                  <label for="" class="text-white">Tehsil<span style="color:red;">*</span></label>
                  <select class="form-control tehsil" name="tehsil_id" required=""> 
                     <option value="">Select Tehsil</option>
                </select>
               </div>

                <div class="form-group">
                  <label for="" class="text-white">Name<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="name" placeholder="Name" required>
               </div>


               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light" data-dismiss="modal">Close</button>
                  <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Save</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>

<script type="text/javascript">
    $(".state").change(function() {
        var state_id = $(this).val();
        $.ajax({
            type: 'post',
            url: "{{ route('jsonDistrict') }}",
            data: {
                state_id: state_id,
                _token: '{{ csrf_token() }}'
            },
            success: function(data) {
                $('.district').empty();
                if (data.length != 0) {
                    $('.district').html('<option value="">Select District</option>');
                    $.each(data.subDistrict, function(key, value) {
                        $(".district").append('<option value="' + value.id + '">' +
                            value.name + '</option>');
                    });
                } else {
                    $('.district').html('<option value="">Not Found</option>');
                }

            }
        });
    });
</script>

<script type="text/javascript">
    $(".district").change(function() {
        var district_id = $(this).val();
        $.ajax({
            type: 'post',
            url: "{{ route('jsonTehsil') }}",
            data: {
                district_id: district_id,
                _token: '{{ csrf_token() }}'
            },
            success: function(data) 
            {
                $('.tehsil').empty();
                if (data.subTehsil.length > 0) {
                    $('.tehsil').html('<option value="">Select Tehsil</option>');
                    $.each(data.subTehsil, function(key, value) {
                        $(".tehsil").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.tehsil').html('<option value="">Not Found</option>');
                }
            }
        });
    });
</script>
