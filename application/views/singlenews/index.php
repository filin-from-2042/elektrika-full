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
                                <?php
                                    // String with link on categories
                                    $cCurrentCategories = '';
                                    // Last array with category
                                    $aLastCategory = end($aAllNews[0]["news_categories"]);
                                    foreach($aAllNews[0]["news_categories"] as $aCategory)
                                    {
                                        $cCurrentCategories.='<a href="'.site_url('news/categories').'/'.$aCategory["id"].'">'.$aCategory["categories_name"].'</a>';
                                        // If last don't concatenate
                                        if($aCategory["id"] != $aLastCategory["id"]) $cCurrentCategories.=', ';
                                    }
                                ?>
                                <h2><?=$aAllNews[0]["news_title"]?></h2>
                                <small>Опубликовано <span class="post-date"><?=$aAllNews[0]["news_create_date"]?></span>
                                    пользователем <span class="author"><?=$aAllNews[0]["news_author"]?></span>
                                    | Категории: <span class="post-categories"><?=$cCurrentCategories?></span>
                                </small>
                            </div>
                            <div class="col-md-3 col-md-3 text-right">
                                <button class="btn btn-default" type="button">
                                    <span class="glyphicon glyphicon-comment"></span>
                                    <span class="post-numbers"><?=$aAllNews[0]["comments_count"]?></span>
                                </button>
                            </div>
                        </div>
                        <div>
                            <img class="image-preview" src="<?= base_url('/images/' . $aAllNews[0]["news_image"])?>">
                        </div>
                        <div class="post-full-text">
                            <p>
                                <?=$aAllNews[0]["news_content"]?>
                            </p>
                        </div>
                    </div>
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
                        </div>
                        <form class="add-comment-form clearfix" action="<?=site_url('news/addcomment/')?>">
                            <input type="hidden" name="news_id" value="<?=$aAllNews[0]["id"]?>">
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