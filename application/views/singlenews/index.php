<?php
    $this->load->helper("el_news_helper");
?>
<div class="blog-columns">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="main-column clearfix">
                    <div class="post-full clearfix">
                        <div class="post-title clearfix">
                            <div class="col-md-9">
                                <h2><?=$aFullPage[0]["news_title"]?></h2>
<!--                                <small>Posted by <span class="author">--><?//=$aFullPage[0]["news_author"]?><!--</span> on <span-->
<!--                                        class="post-date">--><?//=$aFullPage[0]["news_create_date"]?><!--</span> | Категории:<span class="post-categories"> Tutorials, Networks</span>-->
<!--                                </small>-->
                            </div>
                            <div class="col-md-3 col-md-3 text-right">
                                <button class="btn btn-default" type="button">
                                    <span class="glyphicon glyphicon-comment"></span>
                                    <span class="post-numbers">175</span>
                                </button>
                            </div>
                        </div>
                        <div>
                            <img class="image-preview" src="<?=$aFullPage[0]["news_preview_image"]?>">
                        </div>
                        <div class="post-full-text">
                            <p>
                                <?=$aFullPage[0]["news_content"]?>
                            </p>
                        </div>
                    </div>
                   <!-- <div class="repost-panel clearfix">
                        <a id="twitter-repost" class="repost-icon col-md-3" href="#">Retweet this post</a>
                        <a id="bookmark-delicious" class="repost-icon col-md-3" href="#">Bookmark in Delicious</a>
                        <a id="save-digg" class="repost-icon col-md-3" href="#">Save in Digg</a>
                        <a id="like-facebook" class="repost-icon col-md-3" href="#"> Like It Facebook</a>
                    </div>-->
                    <div class="comment-panel clearfix">
                        <a href="#InputName" class="pull-right">
                            <button class="btn btn-default add-comment" type="button">
                                <span class="add">Комментировать</span>
                            </button>
                        </a>
                        <span class="title">Комментарий</span>
                        <small class="subtitle">Вы можете оставить свой комментарий ниже</small>
                    </div>
                    <div class="comments-container clearfix">
                        <?php
                            // TODO: refactor!!! to much 'foreach'
                            foreach($aAllComments as $aSingleComment)
                            {
                                $bHasChildren = false;
                                if($aSingleComment["comments_parent_id"] != null) continue;
                                echo '<div class="single-comment clearfix">
                                            <div class="col-md-3 avatar-container">
                                                <div>
                                                    <img class="avatar image" src="' . base_url('images/icon-comment-avatar.png') . '" alt="" width="85" height="85"/>
                                                </div>
                                                <div>
                                                    <span class="avatar nick">' . $aSingleComment["comments_author"] . '</span>
                                                </div>
                                                <div>
                                                    <span class="avatar date">' . $aSingleComment["comments_create_time"] . '</span>
                                                </div>
                                            </div>
                                            <div class="col-md-9 text">
                                                <div class="comment-text clearfix">
                                                    <p>' . $aSingleComment["comments_content"] . '</p>
                                                    <button type="button" class="btn btn-info pull-right answer_button" comment-id="' . $aSingleComment["id"] . '">Ответить</button>
                                                </div>';

                                foreach($aAllComments as $aCheckComment)
                                {
                                    if($aCheckComment["comments_parent_id"] == $aSingleComment["id"])
                                    $bHasChildren = true;
                                }

                                if($bHasChildren ===true )
                                {
                                            echo '<div class="comment-text answer clearfix">';

                                                        RenderCommentAnswer($aSingleComment["id"], $aAllComments);
                                             echo '</div>';
                                }

                                        echo '</div>';
                                echo '</div>';
                            }
                        ?>
                    </div>
                    <div class="add-comment-container">
                        <div class="add-comment header">
                            <span class="add-comment title">Добавьте комментарий</span>
<!--                            <small class="add-comment subtitle">This is a Subtittle</small>-->
                        </div>
                        <form class="add-comment-form clearfix" action="<?=site_url('news/addcomment/')?>">
                            <input type="hidden" name="news_id" value="<?=$aFullPage[0]["id"]?>">
                            <div class="row input-container">
                                <div class="col-md-5 left-group">
                                    <div class="add-comment-form name">
                                        <input type="text" class="form-control" id="InputName" placeholder="Имя" required="required" name="author_name">
                                        <span class="required">*</span>
                                    </div>
                                    <div class="add-comment-form email">
                                        <input type="email" class="form-control" id="InputEmail" placeholder="Email (не будет опубликован)" name="author_email">
                                        <span class="required">*</span>
                                    </div>
<!--                                    <div class="add-comment-form website">-->
<!--                                        <input type="email" class="form-control" id="InputWebsite" placeholder="Website">-->
<!--                                        <span class="required">*</span>-->
<!--                                    </div>-->
                                </div>
                                <div class="col-md-7 right-group">
                                    <textarea class="form-control" id="Message" rows="6" placeholder="Сообщение" required="required" name="comment_text"></textarea>
                                </div>
                            </div>
                            <div class="row btn-container">
                                <button class="btn btn-danger add_new_button" type="submit">Добавить</button></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <?php
                    $this->load->view("news/right-column.php");
                ?>
            </div>
        </div>
    </div>
</div>