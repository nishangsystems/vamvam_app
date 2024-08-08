@extends('admin.layout.app')
@section('content')
<!-- Content -->
<div class="main-panel">
<div class="content">
   <div class="panel-header bg-primary-gradient">
      <div class="page-inner pb-5">
         <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
            <div>
               <h2 class="text-dk fw-bold">Dashboard</h2>
               <h5 class="text-dk op-7 mb-2">BUIB Dashboard</h5>
            </div>
            <div class="ml-md-auto py-2 py-md-0">
            </div>
         </div>
      </div>
   </div>
   <div class="page-inner mt--5 element-1">
      <div class="row">
         <div class="col-sm-6 col-md-4">
            <div class="card card-stats card-primary card-round user-card">
               <div class="card-body">
                  <div class="row">
                     <div class="col-3">
                        <a href="#">
                           <div
                              class="icon-big text-center icon-big text-center icon-primary bubble-shadow-small">
                              <img src="{{ asset('assets/img/executive.png') }}" class="w-100" alt="dashboard images">
                           </div>
                        </a>
                     </div>
                     <div class="col-9 col-stats">
                        <div class="numbers">
                           <p class="card-category">Total No of Complaints</p>
                           <h4 class="card-title"></h4>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-sm-6 col-md-4">
            <div class="card card-stats card-primary card-round user-card">
               <div class="card-body">
                  <div class="row">
                     <div class="col-3">
                        <a href="">
                           <div
                              class="icon-big text-center icon-big text-center icon-secondary bubble-shadow-small">
                              <img src="{{ asset('assets/img/delivery.png') }}" class="w-100">
                           </div>
                        </a>
                     </div>
                     <div class="col-9 col-stats">
                        <div class="numbers">
                           <p class="card-category">Total No of Open Complaints </p>
                           <h4 class="card-title"></h4>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-sm-6 col-md-4">
            <div class="card card-stats card-primary card-round user-card">
               <div class="card-body ">
                  <div class="row">
                     <div class="col-3">
                        <a href="#">
                           <div
                              class="icon-big text-center icon-big text-center icon-success bubble-shadow-small">
                              <img src="{{ asset('assets/img/checklists.png') }}" class="w-100">
                           </div>
                        </a>
                     </div>
                     <div class="col-9 col-stats">
                        <div class="numbers">
                           <p class="card-category">Total No of Closed Complaints</p>
                           <h4 class="card-title"></h4>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
@endsection
