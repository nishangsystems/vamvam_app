<div class="modal fade add_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document" >
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Add Complaint</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form action="{{route('admin_user_complaint_store') }}" method="post" id="formSubmit" enctype="multipart/form-data" >
               @csrf
               <input type="hidden" name="customer_id" value="{{$id}}" required>
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label for="" class="text-white">User ID</label>
                        <input type="text" class="form-control" value="{{$user->customer_unique_id}}" readonly>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label for="" class="text-white">Name</label>
                        <input type="text" class="form-control" value="{{$user->name}}" readonly>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label for="" class="text-white">Mobile</label>
                        <input type="text" class="form-control" value="{{$user->mobile}}" readonly>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label for="" class="text-white">Voter ID</label>
                        <input type="text" class="form-control" value="{{$user->voter_id}}" readonly>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label for="" class="text-white">Aadhaar Card</label>
                        <input type="text" class="form-control" value="{{$user->aadhaar_card}}" readonly>
                     </div>
                  </div>
                  <div class="col-lg-6">
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
                  <div class="col-lg-6">
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
                  <div class="col-lg-6">
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
               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light" data-dismiss="modal">Close</button>
                  <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Save</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>