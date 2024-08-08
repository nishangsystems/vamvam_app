<style>
    .sidebar.sidebar-style-2 .nav .nav-item .active a {
        background: rgba(199, 199, 199, .2);
    }
</style>
<div class="sidebar">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <ul class="nav nav-primary nav-js">
                <li class="nav-item ">
                    <a href="{{ route('admin_dashboard') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p>Dashboard</p>
                    </a>
                </li>
                
                @if(Auth::guard('admin')->user()->is_admin == '1')
                 <li class="nav-item">
                    <a data-toggle="collapse" href="#aclService">
                        <i class="fa fa-th-large" aria-hidden="true"></i>
                        <p>ACL Management</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="aclService">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="{{ route('admin.role') }}">
                                    <span class="sub-item">Role</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.system_user') }}">
                                    <span class="sub-item">System User</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif
                 
                @if(Auth::guard('admin')->user()->can('view_state') OR Auth::guard('admin')->user()->can('view_district') OR Auth::guard('admin')->user()->can('view_tehsil') OR Auth::guard('admin')->user()->can('view_block') OR Auth::guard('admin')->user()->can('view_city') OR Auth::guard('admin')->user()->can('view_assembly_constituency') OR Auth::guard('admin')->user()->can('view_parliamentary_constituency') OR Auth::guard('admin')->user()->can('view_department') OR Auth::guard('admin')->user()->can('view_issue_type'))                
                <li class="nav-item">
                    <a data-toggle="collapse" href="#masterService">
                        <i class="fa fa-th-large" aria-hidden="true"></i>
                        <p>Master Management</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="masterService">
                        <ul class="nav nav-collapse">
                            @if(Auth::guard('admin')->user()->can('view_state'))
                            <li>
                                <a href="{{ route('admin.state') }}">
                                    <span class="sub-item">State</span>
                                </a>
                            </li>
                            @endif

                            @if(Auth::guard('admin')->user()->can('view_district'))
                            <li>
                                <a href="{{ route('admin.district') }}">
                                    <span class="sub-item">District</span>
                                </a>
                            </li>
                            @endif

                             @if(Auth::guard('admin')->user()->can('view_assembly_constituency'))
                            <li>
                                <a href="{{ route('admin.assembly_constituency') }}">
                                    <span class="sub-item">Assembly Constituency</span>
                                </a>
                            </li>
                            @endif

                            @if(Auth::guard('admin')->user()->can('view_parliamentary_constituency'))
                            <li>
                                <a href="{{ route('admin.parliamentary_constituency') }}">
                                    <span class="sub-item">Parliamentary Constituency</span>
                                </a>
                            </li>
                            @endif

                            @if(Auth::guard('admin')->user()->can('view_tehsil'))
                            <li>
                                <a href="{{ route('admin.tehsil') }}">
                                    <span class="sub-item">Tehsil</span>
                                </a>
                            </li>
                            @endif

                            

                            <li>
                                <a href="{{ route('admin.townVillage') }}">
                                    <span class="sub-item">Town/Village</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.panchayat_ward') }}">
                                    <span class="sub-item">Panchayat/Ward</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.block') }}">
                                    <span class="sub-item">Block</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.thana') }}">
                                    <span class="sub-item">Thana</span>
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('admin.postOffice') }}">
                                    <span class="sub-item">Post Office</span>
                                </a>
                            </li>

                            

                           

                            @if(Auth::guard('admin')->user()->can('view_department'))
                             <li>
                                <a href="{{ route('admin.department') }}">
                                    <span class="sub-item">Department</span>
                                </a>
                            </li>
                            @endif

                            @if(Auth::guard('admin')->user()->can('view_issue_type'))
                             <li>
                                <a href="{{ route('admin.issue-type') }}">
                                    <span class="sub-item">Issue Type</span>
                                </a>
                            </li>
                            @endif

                            <li>
                                <a href="{{ route('admin.banner') }}">
                                    <span class="sub-item">Banner</span>
                                </a>
                            </li>


                            <!-- <li>
                                <a href="{{ route('admin.parliamentary_constituency') }}">
                                    <span class="sub-item">Parliamentary Constituency</span>
                                </a>
                                <div class="collapse" id="ourService1">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="{{ route('admin.our-service') }}">
                                                <span class="sub-item">Our Service</span>
                                            </a> 
                                        </li>
                                    </ul>
                                </div>
                            </li> -->

                        </ul>
                    </div>
                </li>
                @endif

                @if(Auth::guard('admin')->user()->can('view_user')) 
                <li class="nav-item ">
                    <a href="{{ route('admin_user') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">User</p>
                    </a>
                </li>
                @endif


                 <li class="nav-item ">
                    <a href="{{ route('admin_complaint') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Complaint Management</p>
                    </a>
                </li>


                <li class="nav-item ">
                    <a href="{{ route('admin_executive') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Executive Management</p>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="{{ route('admin_leader') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Leader Management</p>
                    </a>
                </li>

                 <li class="nav-item ">
                    <a href="{{ url('admin/request-approval') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Request Approval</p>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="{{ url('admin/survey') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Survey Management</p>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="{{ route('admin_event') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">Event Management</p>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="{{ route('admin_cms') }}">
                        <!-- <i class="fa fa-home" aria-hidden="true"></i> -->
                        <img src="{{asset('assets/custom-images/dashboard.png')}}" alt="">
                        <p class="sub-item">CMS Management</p>
                    </a>
                </li>

               <!--  <li class="nav-item ">
                    <a href="{{ route('admin_setting') }}">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <span class="sub-item">Setting</span>
                    </a>
                </li> -->
             
            </ul>
        </div>
    </div>
</div>
