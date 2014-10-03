/**
 * Created by Set on 28.09.14.
 */
var reviews_interface = location.origin + '/index.php/jsinterface/reviews_add_comment';

$(document).ready(function()
    {
        reviews_ready();
    }
);

function reviews_ready()
{
    reviews_FormSubmit();
}


/---------------------------------------------------- COMMENT FORM SUBMIT ---------------------------------------------/
/**
 *  Function event listener to form add comment. Two case might, add new comment, or comment already exist comment.
 */
function reviews_FormSubmit()
{
    $('.reviews-form').submit(function()
        {
            event.preventDefault();

            // Add loading bacground
            $('body').append('<div id="overlay"></div>');
            var data = $(this).serialize();

            jQuery.post( reviews_interface,
                {
                    data:$(this).serializeArray()
                },
                function(responce)
                {
                    $('#overlay').remove();
                    if( responce != 'OK' )
                    {
                        // Show modal window
                        $('#reviews_modal').modal('show');
                        // Set title
                        $('#reviews_modal .modal-header p').text('Ошибка');
                        // Set body content
                        $('#reviews_modal .modal-body').append('<p>' + responce + '</p>');
                        // Clear fields of modal window after hiding
                        $('#mail_panel_modal').on('hidden.bs.modal',
                            function (event)
                            {
                                $('#overlay').remove();
                                $('#reviews_modal .modal-header p').text('');
                                $('#reviews_modal .modal-body p').remove();
                            }
                        );
                    }
                    else
                    {
                        // Show modal window
                        $('#reviews_modal').modal('show');
                        // Set body content
                        $('#reviews_modal .modal-body').append('<p>Ваш комментарий успешно добавлен и будет отображен после предварительной проверки</p>');
                        // Clear fields of modal window after hiding
                        $('#reviews_modal').on('hidden.bs.modal',
                            function ()
                            {
                                $('#overlay').remove();
                                $('#reviews_modal .modal-body p').remove();
                            }
                        );
                    }
                }

            );
        }
    );
}