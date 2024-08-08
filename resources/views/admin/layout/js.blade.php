<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="{{ asset('assets/custom/js/active_deactive.js') }}"></script>
<script src="{{ asset('assets/summernote/summernote-bs4.min.js') }}"></script>
<script src="{{ asset('assets/js/core/popper.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<link href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css" rel="stylesheet" />

<script src="{{ asset('assets/js/plugin/chart-circle/circles.min.js') }}"></script>

<!-- Fonts and icons -->
<script src="{{ asset('assets/js/plugin/webfont/webfont.min.js') }}"></script>
<script src="{{ asset('assets/js/fonticon5.js') }}" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function() {
	  $('.tag_input').on('change', function(event) {

	    var $element = $(event.target);
	    var $container = $element.closest('.example');

	    if (!$element.data('tagsinput'))
	      return;

	    var val = $element.val();
	    if (val === null)
	      val = "null";
	    var items = $element.tagsinput('items');
	    console.log(items[items.length - 1]);

	    $('code', $('pre.val', $container)).html(($.isArray(val) ? JSON.stringify(val) : "\"" + val.replace('"', '\\"') + "\""));
	    $('code', $('pre.items', $container)).html(JSON.stringify($element.tagsinput('items')));

	    console.log(val);
	    console.log(items);
	    console.log(JSON.stringify(val));
	    console.log(JSON.stringify(items));

	    console.log(items[items.length - 1]);

	  }).trigger('change');
	});

</script>

<script>
    $(".toggle-password").click(function() {
        $(this).toggleClass("fa-eye fa-eye-slash");
        input = $(this).parent().find("input");
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
</script>

<script>
    $('#exampleModalCenter').on('hidden.bs.modal', function() {
        $(this).find('form').trigger('reset');
    })
</script>
<script>
    $('#exampleModalCenter1').on('hidden.bs.modal', function() {
        $(this).find('form').trigger('reset');
    })
</script>
<script>
    WebFont.load({
        google: {
            "families": ["Lato:300,400,700,900"]
        },
        custom: {
            "families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands",
                "simple-line-icons"
            ],
            // urls: ['../assets/css/fonts.min.css']
        },
        active: function() {
            sessionStorage.fonts = true;
        }
    });
</script>



<script src="{{ asset('assets/select2/select2.min.js') }}"></script>


<!-- jQuery UI -->
<script src="{{ asset('assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js') }}"></script>
<script src="{{ asset('assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') }}"></script>

<!-- jQuery Scrollbar -->
<script src="{{ asset('assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js') }}"></script>



<!-- jQuery Sparkline -->
<script src="{{ asset('assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js') }}"></script>

<!-- Datatables -->
<script src="{{ asset('assets/js/plugin/datatables/datatables.min.js') }}"></script>
<script src="https://cdn.datatables.net/buttons/2.3.4/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.html5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.print.min.js"></script>

<!-- Bootstrap Notify -->
<script src="{{ asset('assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js') }}"></script>

<!-- jQuery Vector Maps -->
<script src="{{ asset('assets/js/plugin/jqvmap/jquery.vmap.min.js') }}"></script>
<script src="{{ asset('assets/js/plugin/jqvmap/maps/jquery.vmap.world.js') }}"></script>

<!-- Sweet Alert -->
<script src="{{ asset('assets/js/plugin/sweetalert/sweetalert.min.js') }}"></script>

<!-- Atlantis JS -->
<script src="{{ asset('assets/js/atlantis.min.js') }}"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.3/toastr.min.js"></script>
<script src="{{ asset('assets/custom/js/sweetalert.min.js') }}"></script>
<script src="{{ asset('assets/custom/js/active_deactive.js') }}"></script>
<script src="{{ asset('assets/custom/js/validations.js') }}"></script>
<script src="{{ asset('assets/custom/js/modal.js') }}"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.js-multiple').select2();
    });
</script>

<script>
    jQuery(function($) {
        var path = window.location.href;
        $('.sidebar-content ul.nav-primary li a').each(function() {
            if (this.href === path) {
                $('.sidebar-content ul.nav-primary li').find('li').removeClass('active');
                $(this).parents('li').addClass('active');
                $('.active .collapse').addClass('show');

            }
        });
    });
</script>

<!-- js of datatabel -->
<script>
    $(document).ready(function() {
        $('#basic-datatables').DataTable({});
    });
</script>
<!-- js datatabel end -->

<script>
    $(function() {
        $('.summernote').summernote()
    })
</script>

<script type = "text/javascript">
        $(document).ready(function () {
            $('#dob').change(function () {
                        var now = new Date();   //Current Date
                        var past = new Date($('#dob').val());  //Date of Birth
                        var empDate = $('#dob').val();
                        if (empDate == '') {
                            $('#age').val('');
                            return false;
                        }

                        if (past > now) {
                            alert('Entered Date is Greater than Current Date');
                            return false;
                        }
                        var nowYear = now.getFullYear();  //Get current year
                        var pastYear = past.getFullYear();//Get Date of Birth year
                        var age = nowYear - pastYear;  //calculate the difference
                        
                        $('#age').val(age);


                    })
            })
    </script>




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
                $('.parliamentary').empty();
                if (data.subDistrict.length != 0) {
                    $('.district').html('<option value="">Select District</option>');
                    $.each(data.subDistrict, function(key, value) {
                        $(".district").append('<option value="' + value.id + '">' +
                            value.name + '</option>');
                    });
                } else {
                    $('.district').html('<option value="">Not Found</option>');
                }

                if (data.subParliamentaryConstituency.length != 0) {
                    $('.parliamentary').html('<option value="">Select Parliamentary</option>');
                    $.each(data.subParliamentaryConstituency, function(key, value1) {
                        $(".parliamentary").append('<option value="' + value1.id + '">' +
                            value1.name + '</option>');
                    });
                } else {
                    $('.parliamentary').html('<option value="">Not Found</option>');
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


                $('.assembly').empty();
                if (data.subAssemblyConstituency.length > 0) {
                    $('.assembly').html('<option value="">Select Assembly</option>');
                    $.each(data.subAssemblyConstituency, function(key, value1) {
                        $(".assembly").append('<option value="' + value1.id +
                            '">' + value1.name + '</option>');
                    });
                } else {
                    $('.assembly').html('<option value="">Not Found</option>');
                }
            }
        });
    });
</script>



<script type="text/javascript">
    $(".tehsil").change(function() {
        var tehsil_id = $(this).val();
        $.ajax({
            type: 'post',
            url: "{{ route('jsonTehsilRelation') }}",
            data: {
                tehsil_id: tehsil_id,
                _token: '{{ csrf_token() }}'
            },
            success: function(data) 
            {
                $('.town_village').empty();
                if (data.townVillage.length > 0) {
                    $('.town_village').html('<option value="">Select Gram Panchayat</option>');
                    $.each(data.townVillage, function(key, value) {
                        $(".town_village").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.town_village').html('<option value="">Not Found</option>');
                }

                $('.panchayat_ward').empty();
                if (data.panchayatWard.length > 0) {
                    $('.panchayat_ward').html('<option value="">Select Panchayat/Ward</option>');
                    $.each(data.panchayatWard, function(key, value) {
                        $(".panchayat_ward").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.panchayat_ward').html('<option value="">Not Found</option>');
                }

                $('.block').empty();
                if (data.block.length > 0) {
                    $('.block').html('<option value="">Select Block</option>');
                    $.each(data.block, function(key, value) {
                        $(".block").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.block').html('<option value="">Not Found</option>');
                }

                $('.thana').empty();
                if (data.thana.length > 0) {
                    $('.thana').html('<option value="">Select Thana</option>');
                    $.each(data.thana, function(key, value) {
                        $(".thana").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.thana').html('<option value="">Not Found</option>');
                }


                $('.post_office').empty();
                if (data.postOffice.length > 0) {
                    $('.post_office').html('<option value="">Select Post Office</option>');
                    $.each(data.postOffice, function(key, value) {
                        $(".post_office").append('<option value="' + value.id +
                            '">' + value.name + '</option>');
                    });
                } else {
                    $('.post_office').html('<option value="">Not Found</option>');
                }

            }
        });
    });
</script>






<script type="text/javascript">
    //for redirect particular url
    $(document).on('submit', 'form#formSubmitBack', function(e) {
        e.preventDefault();
        var data = new FormData(this);
        $('#loderIcon').show();
        $('#loderButton').prop("disabled", true);

        $.ajax({
            cache: false,
            contentType: false,
            processData: false,
            url: $(this).attr("action"),
            method: $(this).attr("method"),
            dataType: "json",
            data: data,
            success: function(response) {
                $('#loderIcon').hide();
                $('#loderButton').prop("disabled", false);
                if (response.code == 200) 
                {
                    toastr.success(response.message);
                    if (response.responseUrl != '') 
                    {
                       window.location.replace(response.responseUrl);
                    }
                    //location.reload();
                } else {
                    toastr.error(response.message);
                }
            }
        });
    });
</script>



<script type="text/javascript">
$('.checkAlreadyCustomer').on("click",function() {
       //alert('456');
       var check_customer_info =  $('#check_customer_info').val();
         $.ajax({
             url: "{{url('admin/jsonCustomerInfo/')}}",
             method: 'POST',
             dataType: "json",
             data: {
                "_token": "{{ csrf_token() }}",
               "check_customer_info" : check_customer_info
             },
             success: function(response) {
             if(response.customer) 
             {
               var customer = '';
               customer = response.customer;
               $('#customer_id').val(customer.id);
               $('#voter_id').val(customer.voter_id);
               $('#aadhaar_card').val(customer.aadhaar_card);
               $('#name').val(customer.name);
                
               $('#gender').html('<option value="">Select Gender</option>');
               $('#gender').append('<option value="Male">Male</option><option value="Female">Female</option><option value="Other">Other</option>');
               $('#gender').val(customer.gender)




               $('#dob').val(customer.dob);
               $('#age').val(response.age);
               $('#guardian_name').val(customer.guardian_name);

               $('#relation').html('<option value="">Select Relation</option>');
               $('#relation').append('<option value="Father">Father</option><option value="Mother">Mother</option><option value="Husband">Husband</option><option value="Wife">Wife</option>');
               $('#relation').val(customer.relation);

               $('#mobile').val(customer.mobile);
               $('#email').val(customer.email);

               $('#state_id').html('<option value="">Select State</option>');
               $.each(response.states, function(key, value) {
                  $("#state_id").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('#state_id').val(customer.address_info.state_id);

               $('#district_id').html('<option value="">Select District</option>');
               $.each(response.districts, function(key, value) {
                  $("#district_id").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('#district_id').val(customer.address_info.district_id);

               $('#parliamentary_id').html('<option value="">Select Parliamentary Constituency</option>');
               $.each(response.parliamentaries, function(key, value) {
                  $("#parliamentary_id").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('#parliamentary_id').val(customer.address_info.parliamentary_id);



               $('#assembly_id').html('<option value="">Select Assembly Constituency</option>');
               $.each(response.assemblies, function(key, value) {
                  $("#assembly_id").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('#assembly_id').val(customer.address_info.assembly_id);

               $('#area').html('<option value="">Select Area</option>');
               $('#area').append('<option value="Urban">Urban</option><option value="Rural">Rural</option>');
               $('#area').val(customer.address_info.area)


               $('#tehsil_id').html('<option value="">Select Taluk/Tehsil/Subdistrict</option>');
               $.each(response.tehsils, function(key, value) {
                  $("#tehsil_id").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('#tehsil_id').val(customer.address_info.tehsil_id);

                              
               //town village
               $('.town_village').html('<option value="">Select Town/Village</option>');
               $.each(response.townVillages, function(key, value) {
                  $(".town_village").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('.town_village').val(customer.address_info.town_village_id);            
               
               // panchayat ward
               $('.panchayat_ward').html('<option value="">Select Panchayat/Ward</option>');
               $.each(response.panchayatWards, function(key, value) {
                  $(".panchayat_ward").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('.panchayat_ward').val(customer.address_info.panchayat_ward_id);


               //blocks
               $('.block').html('<option value="">Select Block</option>');
               $.each(response.blocks, function(key, value) {
                  $(".block").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('.block').val(customer.address_info.block_id);            
               
               //Thana
               $('.thana').html('<option value="">Select Thana</option>');
               $.each(response.thanas, function(key, value) {
                  $(".thana").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('.thana').val(customer.address_info.thana_id);

               //postOffices
               $('.post_office').html('<option value="">Select Post Office</option>');
               $.each(response.postOffices, function(key, value) {
                  $(".post_office").append('<option value="' + value.id + '">' + value.name + '</option>');
               });
               $('.post_office').val(customer.address_info.post_office_id);


               $('#locality').val(customer.address_info.locality);
               $('#house_no').val(customer.address_info.house_no);
               $('#land_mark').val(customer.address_info.land_mark);
               $('#pincode').val(customer.address_info.pincode);



               $('#customer_id').attr("readonly",true);
               // $('#voter_id').attr("readonly",true);
               // $('#aadhaar_card').attr("readonly",true);
               // $('#name').attr("readonly",true);
               // $('#gender').attr("readonly",true);
               // $('#dob').attr("readonly",true);
               // $('#guardian_name').attr("readonly",true);
               // $('#relation').attr("readonly",true);
               // $('#mobile').attr("readonly",true);
               // $('#email').attr("readonly",true);
               // $('#state_id').attr("readonly",true);
               // $('#district_id').attr("readonly",true);
               // $('#area').attr("readonly",true);
               // $('#tehsil_id').attr("readonly",true);  
               // $('#block_id').attr("readonly",true);            
               // $('#parliamentary_id').attr("readonly",true);
               // $('#assembly_id').attr("readonly",true);
               // $('#city_village').attr("readonly",true);
               // $('#ward').attr("readonly",true);
               // $('#locality').attr("readonly",true);
               // $('#house_no').attr("readonly",true);
               // $('#land_mark').attr("readonly",true);
               // $('#pincode').attr("readonly",true);



             }else{
                   
                   $('#aadhaar_card').val('');
                   $('#name').val('');                   
                   $('#gender').html('<option value="">Select Gender</option>');

                   $('#dob').val('');
                   $('#guardian_name').val('');

                   $('#relation').html('<option value="">Select Relation</option>');

                   $('#mobile').val('');
                   $('#email').val('');

                   $('#state_id').html('<option value="">Select State</option>');
                   $('#district_id').html('<option value="">Select District</option>');
                   $('#area').html('<option value="">Select Area</option>');
                   $('#area').append('<option value="Urban">Urban</option><option value="Rural">Rural</option>');
                   
                   $('#tehsil_id').html('<option value="">Select Taluk/Tehsil/Subdistrict</option>');
                   $('#parliamentary_id').html('<option value="">Select Parliamentary Constituency</option>');
                   $('#assembly_id').html('<option value="">Select Assembly Constituency</option>');
                   $('#town_village').html('<option value="">Select Town/Village</option>');
                   $('#panchayat_ward_id').html('<option value="">Select Panchayat/Ward</option>');
                   $('#block_id').html('<option value="">Select Block</option>');
                   $('#thana').html('<option value="">Select Thana</option>');
                   $('#post_office').html('<option value="">Select Post Office</option>');
                   $('#locality').val('');
                   $('#house_no').val('');
                   $('#land_mark').val('');
                   $('#pincode').val('');


                   $('#customer_id').val("");
                   // $('#customer_id').attr("readonly",false);
                   // $('#voter_id').attr("readonly",false);
                   // $('#aadhaar_card').attr("readonly",false);
                   // $('#name').attr("readonly",false);
                   // $('#gender').attr("readonly",false);
                   // $('#dob').attr("readonly",false);
                   // $('#guardian_name').attr("readonly",false);
                   // $('#relation').attr("readonly",false);
                   // $('#mobile').attr("readonly",false);
                   // $('#email').attr("readonly",false);
                   // $('#state_id').attr("readonly",false);
                   // $('#district_id').attr("readonly",false);
                   // $('#area').attr("readonly",false);
                   // $('#tehsil_id').attr("readonly",false);  
                   // $('#block_id').attr("readonly",false);            
                   // $('#parliamentary_id').attr("readonly",false);
                   // $('#assembly_id').attr("readonly",false);
                   // $('#city_village').attr("readonly",false);
                   // $('#ward').attr("readonly",false);
                   // $('#locality').attr("readonly",false);
                   // $('#house_no').attr("readonly",false);
                   // $('#land_mark').attr("readonly",false);
                   // $('#pincode').attr("readonly",false);
             }
             }
           })
         })
   
 </script>  
