<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 17.09.14
 * Time: 22:38
 */
function RenderCommentAnswer($nCommentID, $aAllComments)
{
    echo '<div class="sub-comment">';
    foreach($aAllComments as $aAnswer)
    {
        if($aAnswer["comments_parent_id"] == $nCommentID)
        {

            echo '<p>' . $aAnswer["comments_content"] . '</p>
                <button type="button" class="btn btn-info pull-right">Reply</button>
                <div class="answer-container clearfix">
                    <img class="answer avatar" src="' . base_url('images/icon-comment-avatar.png') . '" alt="" width="45" height="45"/>
                    <span class="answer nick">' . $aAnswer["comments_author"] . '</span>
                    <span class="answer date">' . $aAnswer["comments_create_time"] . '</span>
            </div>';

            RenderCommentAnswer($aAnswer["id"], $aAllComments);
        }
    }
    echo '</div>';
}
