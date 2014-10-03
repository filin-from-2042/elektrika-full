/**
 * Created by Set on 28.09.14.
 */
var news_interface = location.origin + '/index.php/jsinterface/news_add_comment';

$(document).ready(function()
                {
                    news_ready();
                }
            );

function news_ready()
{
    news_AddAnswerButton();
    news_InitCommentButton();
    news_FormSubmit();
}

/---------------------------------------------------- ADD ANSWER SUBMIT BUTTON ----------------------------------------/
/**
 * Function add event listener to answer button. Event listener add another submit button with comment add, for which
 * will add current new comment
 */
function news_AddAnswerButton()
{
    $('body').delegate('.comments-container  .answer_button',
                        'click',
                        function(event)
                        {
                            event.preventDefault();

                            var nCommentID = parseInt( $(this).attr('comment-id') );

                            if( $('.add-comment-form .add_exist_button').length ) $('.add-comment-form .add_exist_button').remove();

                            var answerButton = $('.add-comment-form .add_new_button')
                                                .clone()
                                                .removeClass('add_new_button')
                                                .addClass('add_exist_button')
                                                .attr('parent-answer-id',nCommentID)
                                                .text('Ответить');

                            $('.add-comment-form .add_new_button').text('Добавить новый').before(answerButton);
                        }
             );
}

/---------------------------------------------------- COMMENT FORM SUBMIT ---------------------------------------------/
/**
 *  Function event listener to form add comment. Two case might, add new comment, or comment already exist comment.
 */
function news_FormSubmit()
{
    $('form.add-comment-form').submit(function()
                                    {
                                        event.preventDefault();
                                        // ID of comment, for which will be add current comment
                                        var nAnswerID = $(this).find('button.add_exist_button').attr('parent-answer-id');
                                        // Add loading background
                                        $('body').append('<div id="overlay"></div>');

                                        $.post(news_interface,
                                            {
                                                data:$(this).serializeArray(),
                                                answer_id: nAnswerID
                                            },
                                            function(responce)
                                            {
                                                // Object with new inserted data
                                                var aNewComment = JSON.parse(responce);

                                                var domAnswerContainer = $('<div class="answer-container clearfix"></div>')
                                                                            .append('<img class="answer avatar" src="http://elektrika/images/icon-comment-avatar.png" alt="" width="45" height="45">')
                                                                            .append('<span class="answer nick">' + aNewComment.comments_author + '</span>')
                                                                            .append('<span class="answer date">' + aNewComment.comments_create_time + '</span>');

                                                var domSubComment = $('<div class="sub-comment"></div>')
                                                                    .append('<p>' + aNewComment.comments_content + '</p>')
                                                                    .append('<button type="button" class="btn btn-info pull-right answer_button" comment-id="' + aNewComment.id + '">Ответить</button>')
                                                                    .append(domAnswerContainer);

                                                var domClickButton = $('button[comment-id="' + aNewComment.comments_parent_id + '"]');
                                                // if need add comment for subcomment, not 1st
                                                if(domClickButton.parent().hasClass('sub-comment'))
                                                {
                                                    domClickButton.parent().append(domSubComment);
                                                }
                                                // if sub-comment 1st
                                                else if( domClickButton.parent().hasClass('comment-text') )
                                                {
                                                    // if 1 answer already exist
                                                    if( domClickButton.closest('div.text').find('div.answer').length )
                                                    {
                                                        domClickButton.closest('div.text')
                                                            .find('div.answer')
                                                            .append(domSubComment);
                                                    }
                                                    else
                                                    {
                                                        domClickButton.closest('div.text')
                                                                        .append('<div class="comment-text answer clearfix"></div>')
                                                                        .find('div.answer')
                                                                        .append(domSubComment);
                                                    }
                                                }

                                                // New comment, not answer
                                                if( !aNewComment.comments_parent_id )
                                                {
                                                    var domAvatarContainer = $('<div class="col-md-3 avatar-container"></div>')
                                                                                .append('<div><img class="avatar image" src="http://elektrika/images/icon-comment-avatar.png" alt="" width="85" height="85"></div>')
                                                                                .append('<div><span class="avatar nick">' + aNewComment.comments_author + '</span></div>')
                                                                                .append('<div><span class="avatar date">' + aNewComment.comments_create_time + '</span></div>');

                                                    var domNewComment = $('<div class="col-md-9 text"></div>');

                                                         domNewComment.append('<div class="comment-text clearfix"></div>')
                                                                        .find('div.comment-text')
                                                                        .append('<p>' + aNewComment.comments_content + '</p>')
                                                                        .append('<button type="button" class="btn btn-info pull-right answer_button" comment-id="' + aNewComment.id + '">Ответить</button>')

                                                    var domTextContainer = $('<div class="single-comment clearfix"></div>').append(domAvatarContainer).append(domNewComment);

                                                    $('.comments-container').append(domTextContainer);
                                                }

                                                $('#overlay').remove();
                                            }

                                        );
                                    }
                                );
}
/---------------------------------------------------- ADD NEW COMMENT FOR NEWS ----------------------------------------/
/**
 * Function add new comment and remove exists answer button.
 */
function news_InitCommentButton()
{
    $('body').delegate('.add-comment-form .add_new_button',
                        'click',
                        function()
                        {
                            if( $('.add_exist_button').length )
                                $('.add_new_button').siblings('button').remove();
                        }
    );
}