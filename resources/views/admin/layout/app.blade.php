<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BIAKA Admin</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport'>
    <meta property="og:url" content="" />
    <meta name="description" content="">
    <meta name="twitter:image" content="">
    <meta property="og:title" content="">
    <meta name="image" property="og:image" content=""/>
    <meta property="og:description" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:type" content="website" />
	<meta name="csrf-token" content="{{ csrf_token() }}" />
     @include("admin.layout.css") 
     @yield('css')
</head>
<body data-background-color="dark">
	<div class="wrapper">
    	 @include("admin.layout.header") 
     	 @include("admin.layout.sidebar") 
   	 	 @yield('content')

   	      <!--------modal-------->
          @include('admin.layout.modal_popup')
          <!--------end---------->
   	      @include("admin.layout.footer") 
    </div>

   	      @include("admin.layout.js") 
			<!--   Core JS Files   -->
          @yield('js')

</body>
</html>






