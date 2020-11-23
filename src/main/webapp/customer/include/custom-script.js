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

                //alert(res.modal);
                $(res.modal_id).modal('show');

                $(res.modal_id).on('hidden.bs.modal', function (e) {
                    $(res.modal_id).remove();
                });
            } 
           
        },
        error: function (err) {
            console.log("error");
        }
    });
}


function error(error)
{
		toastr.options = {
	    		  "closeButton":true,
	    		  "debug": false,
	    		  "newestOnTop": false,
	    		  "progressBar": false,
	    		  "positionClass": "toast-top-right",
	    		  "preventDuplicates": false,
	    		  "onclick": null,
	    		  "showDuration": "1200",
	    		  "hideDuration": "1500",
	    		  "timeOut": "5000",
	    		  "extendedTimeOut": "1500",
	    		  "showEasing": "swing",
	    		  "hideEasing": "linear",
	    		  "showMethod": "fadeIn",
	    		  "hideMethod": "fadeOut"
	    		},
		
		toastr["error"](error)
	     
}
