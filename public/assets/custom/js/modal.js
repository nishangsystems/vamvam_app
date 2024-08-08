// edit modal on button tag
$(document).on('click', 'button.edit_model', function () {
    $("div.edit_model").load($(this).data('href'), function () {
        $('div.edit_model').modal('show');
    });
});

// add modal on button tag
$(document).on('click', 'button.add_model', function () {
    $("div.add_model").load($(this).data('href'), function () {
        $('div.add_model').modal('show');
    });
});

// view modal on button tag
$(document).on('click', 'button.view_model', function () {
    $("div.view_model").load($(this).data('href'), function () {
        $('div.view_model').modal('show');
    });
});

$(document).on('click', '.close', function (e) {
    $('.modal-backdrop').remove();
});



// add modal
    $(document).on('submit', 'form#formSubmit', function(e) {
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
                if (response.code == 200) {
                    toastr.success(response.message);
                    location.reload();
                } else {
                    toastr.error(response.message);
                }
            }
        });
    });


    $(document).on('submit', 'form.formSubmit', function(e) {
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
                if (response.code == 200) {
                    toastr.success(response.message);
                    location.reload();
                } else {
                    toastr.error(response.message);
                }
            }
        });
    });

    //for redirect particular url
    $(document).on('submit', 'form#formSubmitUrl', function(e) {
        console.log(response, "formSubmitUrl");
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
                console.log(response, "formSubmitUrl");
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




