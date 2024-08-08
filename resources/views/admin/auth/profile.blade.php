@extends('admin.layout.app')
@section('content')
<div class="main-panel">
<div class="content">
   <div class="panel-header bg-primary-gradient">
      <div class="page-inner px-4 pt-1">
         <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
            <div>
               <h2 class="fw-bold">User Profile </h2>
            </div>
            <div class="ml-md-auto  py-md-5">
            </div>
         </div>
      </div>
   </div>
   <div class="page-inner mt--5 element-1">
      <!-- Demo header-->
      <section class="py-2 header">
         <div class="container py-4">
            
            <div class="row">
               <div class="col-md-3">
                  <!-- Tabs nav -->
                  <div class="nav flex-column nav-pills nav-pills-custom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                     <a class="nav-link mb-3 p-3 shadow active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                     <i class="fa fa-user mr-2"></i>
                     <span class="font-weight-bold small text-uppercase">Personal information</span></a>
                     <a class="nav-link mb-3 p-3 shadow" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                     <i class="fa fa-calendar-minus-o mr-2"></i>
                     <span class="font-weight-bold small text-uppercase">Edit Profile</span></a>
                     <a class="nav-link mb-3 p-3 shadow" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                     <i class="fa fa-star mr-2"></i>
                     <span class="font-weight-bold small text-uppercase">Change Password</span></a>

                     
                  </div>
               </div>
               <div class="col-md-9">
                  <!-- Tabs content -->
                  <div class="tab-content" id="v-pills-tabContent">
                     <div class="tab-pane fade shadow rounded bg-light show active p-5" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="mb-4">	
                          @if(!empty($user->image))
                           <img src="{{asset($user->image)}}" class="profile_img">
                          @else
                           <img src="{{asset('assets/img/no-image-2.png')}}" class="profile_img">
                          @endif
                        </div>

                        <div class="mb-4">
                           <h2 class="card-title">Personal information</h2>
                        </div>

                        <div class="row mb-2 borders" style="">
                           <div class="col-lg-3 col-md-4 label ">
                           <div class=" bolds"> Name</div>
                         </div>
                           <div class="col-lg-9 col-md-8">
                          <p class="fonts">:&emsp; {{$user->name ?? ''}}</p>
                         </div>
                        </div>
                       

                  
                        <div class="row mb-2 borders">
                           <div class="col-lg-3 col-md-4 label">
                              <div class=" bolds"> Phone</div>
                           </div>
                           <div class="col-lg-9 col-md-8">
                             <p class="fonts">:&emsp; {{$user->phone ?? ''}}</p>
                           </div>
                        </div>
                        
                        <div class="row mb-2 borders">
                           <div class="col-lg-3 col-md-4 label">
                             <div class=" bolds">  
                                Email ID
                              </div>
                           </div>
                           <div class="col-lg-9 col-md-8">
                            <p class="fonts">:&emsp; {{$user->email ?? ''}}</p>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane fade shadow rounded bg-light p-5" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                       
                  <form class="needs-validation" id="formSubmit" action="{{route('admin_update_profile')}}"  method="post">
                    @csrf
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label text-white">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                       <img src="{{asset($user->image)}}" class="profile_img">
                        <div class="py-3">
                          <input type="file" class="fa fa-upload" name="image" accept=".jpg,.jpeg,.png">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label text-white"> Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="name" type="text" class="form-control" id="fullName" onkeypress="return alphaonly(event)" placeholder="Name" value="{{$user->name ?? ''}}" required="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label text-white">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="mobile" type="text" class="form-control" id="Phone" minlength="10" maxlength="10" onkeypress="return numbersonly(event)" required="" value="{{$user->phone ?? ''}}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label text-white">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="email" class="form-control"   pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$" placeholder="Email" required name="email" value="{{$user->email ?? ''}}">
                      </div>
                    </div>


                    <div class="text-right">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form >
                  @csrf
                     </div>
                     <div class="tab-pane fade shadow rounded bg-light p-5" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                        <h4 class="card-title mb-4">Change Password</h4>
                        <form class="needs-validation formSubmit" novalidate=""  action="{{route('admin_update_password')}}"  method="post">
                          @csrf
                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label text-white">* Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="old_password" type="password" class="form-control" id="password" autocomplete="new-password" required=""> 
                        <i class="toggle-password fa fa-fw fa-eye-slash icone-eye"></i>

                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label text-white">* New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="new_password" type="password" class="form-control" id="password" autocomplete="new-password" required=""> 
                        <i class="toggle-password fa fa-fw fa-eye-slash icone-eye"></i>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label text-white">* Confirm Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="conf_password" type="password" class="form-control" id="password" autocomplete="new-password" required=""> 
                        <i class="toggle-password fa fa-fw fa-eye-slash icone-eye"></i>
                      </div>
                    </div>

                    <div class="text-right">
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                  </form>
                   </div>
                     
                  </div>
               </div>
            </div>
         </div>
     
   </div>
</div>
<!-- <script src="https://code.jquery.com/jquery.3.2.1.min.js"></script> -->

@endsection