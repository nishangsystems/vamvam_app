// Login form validate
$('#loginForm').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});

// Registeration Form Validation
$('#registerForm').validate({
    rules: {
      first_name: {
        required: true,
      },
      
    },
    messages: {

    },
    errorElement: 'span',
    errorPlacement: function (error, element) {
      error.addClass('invalid-feedback');
      element.closest('.form-group').append(error);
    },
    highlight: function (element) {
      $(element).addClass('is-invalid');
    },
    unhighlight: function (element) {
      $(element).removeClass('is-invalid');
    }
  });

// publish with us form validation
$('#formSubmitBulk').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});


// specimen form validate 
$('#formSubmitBulk').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});

// edit profile form 
$('#formSubmit12').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});

// edit address on profile page
$('#EditAddres').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});

// bulk upload validation
$('#bulkModal').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});

// checkout form validation
$('#formSubmit').validate({
  rules: {
    first_name: {
      required: true,
    },
    
  },
  messages: {

  },
  errorElement: 'span',
  errorPlacement: function (error, element) {
    error.addClass('invalid-feedback');
    element.closest('.form-group').append(error);
  },
  highlight: function (element) {
    $(element).addClass('is-invalid');
  },
  unhighlight: function (element) {
    $(element).removeClass('is-invalid');
  }
});