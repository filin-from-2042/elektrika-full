/**
 * Created by Set on 06.10.14.
 */
// Location for contact action on server side
var contact_interface = location.origin + '/index.php/jsinterface/contact_question';

jQuery(document).ready(function()
    {
        contact_Question();
    }
);

function contact_Question()
{
    jQuery('.form-contact').unbind('submit')
        .bind('submit',function(event)
        {
            event.preventDefault();

            // Overlay background
            $('body').append('<div id="overlay"></div>');

            $.post(contact_interface,
                {
                    contact_data:$(this).serializeArray()
                },
                function(responce)
                {
                    $('#overlay').remove();
                    if( responce != 'OK' )
                    {
                        // Show modal window
                        $('#contact_modal').modal('show');
                        // Set title
                        $('#contact_modal .modal-header p').text('Ошибка');
                        // Set body content
                        $('#contact_modal .modal-body').append('<p>' + responce + '</p>');
                        // Clear fields of modal window after hiding
                        $('#contact_modal').on('hidden.bs.modal',
                            function (event)
                            {
                                $('#overlay').remove();
                                $('#contact_modal .modal-header p').text('');
                                $('#contact_modal .modal-body p').remove();
                            }
                        );
                    }
                    else
                    {
                        // Show modal window
                        $('#contact_modal').modal('show');
                        // Set body content
                        $('#contact_modal .modal-body').append('<p>Ваш заявка успешно отправлена и скоро будет обработана!</p>');
                        // Clear fields of modal window after hiding
                        $('#contact_modal').on('hidden.bs.modal',
                            function ()
                            {
                                $('#overlay').remove();
                                $('#contact_modal .modal-body p').remove();
                            }
                        );
                    }
                }
            );

        }
    )
}