<!-- Modal -->
<div class="modal fade edit_model" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content bg-dark">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit System User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <form  action="{{route('admin_update_system_user') }}" method="post"  enctype="multipart/form-data"  id="formSubmit">
            @csrf
               <input type="hidden" name="user_id" value="{{$user->id}}">
               

               <div class="form-group">
                  <label for="" class="text-white">Role<span style="color:red;">*</span></label>
                  <select class="form-control" name="role" required>
                     <option value="">Select Role</option>
                     @foreach($roles as $role)
                     <option value="{{ $role->name ?? '' }}" @if($role->name == $roleName) selected @endif>{{ $role->name ?? '' }}</option>
                     @endforeach
                  </select>
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Name<span style="color:red;">*</span></label>
                  <input type="text" class="form-control" name="name" placeholder="Name" required value="{{$user->name ?? ''}}">
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Email<span style="color:red;">*</span></label>
                  <input type="email" class="form-control" name="email" placeholder="Email" required value="{{$user->email ?? ''}}">
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Mobile</label>
                  <input type="text" class="form-control" name="mobile" placeholder="Mobile" onkeypress="return numbersonly(event)" maxlength="10" value="{{$user->phone ?? ''}}">
               </div>

               <div class="form-group">
                  <label for="" class="text-white">Password</label>
                  <input type="text" class="form-control" name="password" placeholder="Password">
               </div>
              
               <div class="float-right mt-2">
                  <button type="button btn-light" class="btn btn-light btn-size-cus" data-dismiss="modal">Close</button>
                  <button type="submit" name="Submit"  id="loderButton"  class="btn btn-primary px-5 rounded-0 btn-size-cus"><i class="fa fa-spinner fa-pulse fa-fw" id="loderIcon" style="display:none;"></i>Update</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>