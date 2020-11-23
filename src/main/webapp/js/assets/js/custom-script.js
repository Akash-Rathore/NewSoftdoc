$(document).on('click', '.create-modal', function () {
    create_modal($(this).data('url'), 'create-' + $(this).data('what') + '-modal');
});

function create_modal(url, what, id) {
    if (!id) {
        id = true;
    }
    $.ajax({
        url,
        type: 'post',
        dataType: 'json',
        data: {
            [what]: id
        },
        success: function (res) {
            console.log(res);

            if (res.modal) {
                $('#modal-container').append(res.modal);

                $(res.modal_id).modal('show');

                $(res.modal_id).on('hidden.bs.modal', function (e) {
                    $(res.modal_id).remove();
                });
            }
        },
        error: function (err) {
            console.log(err);
        }
    });
}

$(document).on('submit', '.form-submit', function (e) {
    e.preventDefault();
    var form = $(this);
    var formData = new FormData($(form)[0]);
    $.ajax({
        url: $(form).attr('action'),
        type: $(form).attr('method'),
        dataType: 'json',
        processData: false,
        contentType: false,
        data: formData,
        success: function (res) {
            console.log(res);

            if (res.swal) {
                swal.fire(res.swal);
            }

            if (res.modal_hide) {
                $(res.modal_hide).modal('hide');
            }

            if (res.data) {
                $(res.table).append(res.data);
            }
        },
        error: function (err) {
            console.log(err);
        }
    });
});

function get_results(url, what, table) {

    $.ajax({
        url,
        type: 'post',
        dataType: 'json',
        data: {
            [what]: true
        },
        success: function (res) {
            $(table).html(res.data);
            console.log(res);
        },
        error: function (err) {
            console.log(err);
        }
    });
}

$(document).on('click', '.edit', function () {
    var url = $(this).data('url');
    var what = 'edit-' + $(this).data('what') + '-modal';
    var id = $(this).data('id');
    create_modal(url, what, id);

    // $.ajax({
    //     url,
    //     type: 'post',
    //     dataType: 'json',
    //     data: {
    //         ['edit-' + what]: id
    //     },
    //     success: function (res) {
    //         console.log(res);
    //     },
    //     error: function (err) {
    //         console.log(err);
    //     }
    // })
});