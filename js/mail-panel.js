/**
 * Created by Set on 26.09.14.
 */
// Location for mail action on server side
var mail_panel_interface = location.origin + '/index.php/jsinterface/mail_panel_subscribe';

jQuery(document).ready(function()
    {
        mail_panel_ActionSubscribe();
    }
);

/---------------------------------------------------- ACTION FOR SUBSCRIBE ON ACTIONS ----------------------------------/
/**
 *  Function subscribe by input email. For pattern of modal window using hidden in mail-panel.
 */
function mail_panel_ActionSubscribe()
{
    jQuery('#form_subscribe').unbind('submit')
                            .bind('submit',function(event)
                                            {
                                                event.preventDefault();
                                                // Input value
                                                var cSubscribeMail = $('#subscribe_input_mail').val();
                                                // Overlay background
                                                $('body').append('<div id="overlay"></div>')

                                                $.post(mail_panel_interface,
                                                        {
                                                            new_mail:cSubscribeMail
                                                        },
                                                        function(responce)
                                                        {
                                                            $('#overlay').remove();
                                                            if( responce != 'OK' )
                                                            {
                                                                // Show modal window
                                                                $('#mail_panel_modal').modal('show');
                                                                // Set title
                                                                $('#mail_panel_modal .modal-header p').text('Ошибка');
                                                                // Set body content
                                                                $('#mail_panel_modal .modal-body').append('<p>' + responce + '</p>');
                                                                // Clear fields of modal window after hiding
                                                                $('#mail_panel_modal').on('hidden.bs.modal',
                                                                                            function (event)
                                                                                            {
                                                                                                $('#overlay').remove();
                                                                                                $('#mail_panel_modal .modal-header p').text('');
                                                                                                $('#mail_panel_modal .modal-body p').remove();
                                                                                            }
                                                                                        );
                                                            }
                                                            else
                                                            {
                                                                // Show modal window
                                                                $('#mail_panel_modal').modal('show');
                                                                // Set body content
                                                                $('#mail_panel_modal .modal-body').append('<p>Вы успешно подписались на рассылку информации о наших акциях на указанный e-mail адрес</p>');
                                                                // Clear fields of modal window after hiding
                                                                $('#mail_panel_modal').on('hidden.bs.modal',
                                                                    function ()
                                                                    {
                                                                        $('#overlay').remove();
                                                                        $('#mail_panel_modal .modal-body p').remove();
                                                                    }
                                                                );
                                                            }
                                                        }
                                                    );

                                            }
                                )
}