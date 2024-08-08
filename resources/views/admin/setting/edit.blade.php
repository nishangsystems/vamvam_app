@extends('admin.layout.app')
@section('content')

<div class="main-panel">
         <div class="content">
            <div class="page-inner element-1">
               
               <div class="row">
                  <div class="col-md-12">
                     <div class="card">
                        <div class="card-header">
                           <div class="card-title">Website Setting</div>
                        </div>
                        <form action="{{route('stor_setting')}}" method="post" enctype="multipart/form-data" name="update_setting_page" id="update_setting_page">
                           @csrf
                        <input type="hidden" name="id" value="">
                        <div class="card-body element-2">
                           <div class="row">
                              <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Phone Number One</label>
                                     <input type="text" class="form-control" placeholder="Phone Number One" maxlength="15" name="phone_no_one" value="{{$settings->phone_no_one ?? ''}}" onkeypress="return numbersonly(event)">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Phone Number Two</label>
                                     <input type="text" class="form-control" placeholder="Phone Number 2" maxlength="15"  name="phone_no_two" value="{{$settings->phone_no_two ?? ''}}" onkeypress="return numbersonly(event)" >
                                 </div>
                             </div>

                             <!-- <div class="col-md-12">
                                 <div class="form-group">
                                     <label for="inlineinput">Description</label>
                                     <textarea class="summernote"  name="description" class="form-control" spellcheck="false">{{$settings->description ?? ''}}</textarea>
                                 </div>
                             </div> -->

                             <div class="col-md-12">
                                 <div class="form-group">
                                     <label for="inlineinput">Summary</label>
                                     <textarea  name="summary" class="form-control summernote" spellcheck="false">{{$settings->summary ?? ''}}</textarea>
                                 </div>
                             </div>

                             <div class="col-md-12">
                                 <div class="form-group">
                                     <label for="inlineinput">Email<span class="text-danger">*</span></label>
                                     <input type="text" class="form-control" placeholder="Email" name="email" value="{{$settings->email ?? ''}}" required>
                                 </div>
                             </div>
                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Website</label>
                                     <input type="text" class="form-control" placeholder="Website" name="website" value="{{$settings->website ?? ''}}">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Address<span class="text-danger">*</span></label>
                                     <input type="text" class="form-control" placeholder="Address" name="address" value="{{$settings->address ?? ''}}" required>
                                 </div>
                             </div>
                             <div class="col-md-12">
                                <div class="form-group">
                                    <label>Map Location (Please Insert Iframe Code)</label>
                                    <textarea type="text" class="form-control" placeholder="" name="map_code"  >{{$settings->map_code ?? ''}}</textarea>
                                </div>
                               </div>
                              <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Logo<span class="text-danger">*</span></label>
                                      <input type="file" class="form-control d-flex" accept="image/*" style="padding: 3.2px;" name="logo">
                                      <div class="col pt-10">
                                          <img src="{{asset($settings->logo ?? 'notImage.jpg')}}" width="200px" height="150px" style="padding:11px">
                                      </div> 
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Favicon Icon<span class="text-danger">*</span></label>
                                     <input type="file" class="form-control d-flex" accept="image/*" style="padding: 3.2px;" name="fevicon">
                                      <div class="col pt-10">
                                          <img src="{{asset($settings->fevicon ?? 'notImage.jpg')}}" width="200px" height="150px" style="padding:11px">
                                      </div> 
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Facebook Url</label>
                                     <input type="url" class="form-control" placeholder="Facebook" name="facebook_link" value="{{$settings->facebook_link ?? ''}}">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Instagram Link</label>
                                     <input type="text" class="form-control" placeholder="Instagram" name="instagram_link" value="{{$settings->instagram_link ?? ''}}">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Twitter Link</label>
                                     <input type="text" class="form-control" placeholder="Twitter" name="twitter_link" value="{{$settings->twitter_link ?? ''}}">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Linkedin Link</label>
                                     <input type="text" class="form-control" placeholder="Linkedin" name="linkedin_link" value="{{$settings->linkedin_link ?? ''}}">
                                 </div>
                             </div>
                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Youtube Link</label>
                                     <input type="text" class="form-control" placeholder="Youtube" name="youtube_link" value="{{$settings->youtube_link ?? ''}}">
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-group">
                                     <label for="inlineinput">Our Service Image<span class="text-danger">*</span></label>
                                      <input type="file" class="form-control d-flex" accept="image/*" style="padding: 3.2px;" name="our_service_image">
                                      <div class="col pt-10">
                                          <img src="{{asset($settings->our_service_image ?? 'notImage.jpg')}}" width="400px" height="150px" style="padding:11px">
                                      </div> 
                                 </div>
                             </div>

                             
                           </div>
                        </div>
                        <div class="card-action element-2 text-center">
                           <a href="{{url('admin/setting')}}" class="btn btn-light mr-2 btn-size-cus">Cancel</a>
                           {{-- <button class="btn btn-primary" type="submit">Update</button> --}}
                           <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
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


   // add modal
$(document).on('submit', 'form#update_setting_page', function(e) { 
      e.preventDefault();
      var data = new FormData(this);
         $('#loderIcon').show();
         $('#loderButton').prop("disabled", true);

              $.ajax({
                  cache:false,
                  contentType: false,
                  processData: false,
                  url: $(this).attr("action"),
                  method: $(this).attr("method"),
                  dataType: "json",
                  data: data,
                  success: function(response) { 
                     $('#loderIcon').hide();
                     $('#loderButton').prop("disabled", false);
                    
                    if (response.responseCode == 200) {
                        toastr.success(response.responseMessage); 
                      $('div.add_model').modal('hide');
                        location.reload();
                    } else {
                        toastr.error(response.responseMessage);
                    }
                  }
              }); 
        }); 
</script>
@endsection