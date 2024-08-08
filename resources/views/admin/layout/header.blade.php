<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				@php
                  $user =  Auth::guard('admin')->user();
                  
                @endphp
				<a href="{{route('admin_dashboard')}}" class="logo">
	                 	<div class="logo-cus-css">
						 <img src="{{asset('assets/custom-images/logo1.png')}}" alt="navbar brand" class="navbar-brand" style="">
				<!--<img src="{{asset('assets/custom-images/logo2.png')}}" alt="navbar brand" class="navbar-brand" style="">-->
						</div>
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="fa fa-bars"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="fa fa-user"></i></button>
				<!-- <div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="fa fa-bars"></i>
					</button>
				</div> -->
			</div>
			<!-- End Logo Header -->


			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
			<div class="nav-toggle nav-toggle-again">
					<button class="btn btn-toggle toggle-sidebar">
						<!-- <i class="fa fa-bars"></i> -->
						<img src="{{asset('assets/custom-images/toggle.png')}}" alt="">
					</button>
				</div>
				<div class="container-fluid">
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center admin-top-cus">
						
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
								<div class="avatar-sm avatar-sm-js d-flex align-items-center">
									@if(!empty($user->image))
									<h4 class="mb-0">{{$user->name ?? 'Admin'}}</h4>
									<img src="{{asset($user->image)}}" alt="..." class="avatar-img rounded-circle">
									@else
									<h4 class="mb-0">{{$user->name ?? 'Admin'}}</h4>
									<img src="{{asset('assets/img/no-image-2.png')}}" alt="image profile" class="avatar-img rounded-circle">
									@endif
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
									<li>
										<div class="user-box">
											@if($user)
											<div class="avatar-lg">
												@if(!empty($user->image))
												<img src="{{asset($user->image)}}" alt="image profile" class="avatar-img rounded">
												@else
												<img src="{{asset('assets/img/profile.jpg')}}" alt="image profile" class="avatar-img rounded">
												@endif
											</div>
											<div class="u-text">
												<h4>{{$user->name}}</h4>
												<h5 class="">{{$user->email}}</h5>
											</div>
											@endif
										</div>
									</li>
									<li>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="{{route('admin_profile')}}"><i class="fa fa-user"></i>&emsp; My Profile</a>
										<div class="dropdown-divider"></div>
										
										
										<a class="dropdown-item" href="{{route('admin_logout')}}"><i class="fa fa-hand-o-right"  aria-hidden="true"></i>&emsp; Logout</a>
									</li>
								</div>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>
