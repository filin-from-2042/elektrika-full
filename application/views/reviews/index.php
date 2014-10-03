
<?php
    $this->load->helper("el_news_helper");
?>
<?php
$this->load->view('main/top-title-panel.php');
?>
<div class="blog-columns">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main-column clearfix">
                    <div class="post-full clearfix">
                        <div class="post-title clearfix">
                            <div class="col-md-9">
                                <h2><?=$aFullPageContent[0]["pages_title"]?></h2>
                            </div>
                        </div>
                       <div class="reviews_preview clearfix">
                            <div class="col-md-5 preview_image">
                                <img class="image-preview" width=300 src="<?=base_url('/images/'.$aFullPageContent[0]["pages_preview_image"])?>">
                            </div>
                            <div class="col-md-7 post-full-text">
                                <p>
                                    <?=$aFullPageContent[0]["pages_text"]?>
                                </p>
                            </div>
                       </div>
                    </div>
                    <div class="comment-panel clearfix">
                        <a href="#InputName" class="pull-right">
                            <button class="btn btn-default add-comment" type="button">
                                <span class="add">Оставить отзыв</span>
                            </button>
                        </a>
                        <span class="title">Отзыв</span>
                        <small class="subtitle">Вы можете оставить свой отзыв ниже</small>
                    </div>
                    <div class="comments-container clearfix">
                        <?php
                        // TODO: refactor!!! to much 'foreach'
                        foreach($aReviews as $aSingleReview)
                        {
                            echo '<div class="single-comment clearfix">
                                            <div class="col-md-3 avatar-container">
                                                <div>
                                                    <img class="avatar image" src="' . base_url('images/icon-comment-avatar.png') . '" alt="" width="85" height="85"/>
                                                </div>
                                                <div>
                                                    <span class="avatar nick">' . $aSingleReview["reviews_author"] . '</span>
                                                </div>
                                                <div>
                                                    <span class="avatar date">' . $aSingleReview["reviews_create_time"] . '</span>
                                                </div>
                                            </div>
                                            <div class="col-md-9 text">
                                                <div class="comment-text clearfix">
                                                    <p>' . $aSingleReview["reviews_content"] . '</p>
                                                </div>';

                                            echo '</div>';
                            echo '</div>';
                        }
                        ?>
                    </div>
                    <div class="add-comment-container">
                        <div class="add-comment header">
                            <span class="add-comment title">Добавьте отзыв</span>
                        </div>
                        <form class="add-comment-form reviews-form clearfix" action="<?=site_url('news/reviews_add_comment')?>">
                            <div class="row input-container">
                                <div class="col-md-12 left-group">
                                    <div class="add-comment-form name">
                                        <input type="text" class="form-control" id="InputName" placeholder="Имя" required="required" name="author_name">
                                        <span class="required">*</span>
                                    </div>
                                    <div class="add-comment-form">
                                        <textarea class="form-control" id="Message" rows="6" placeholder="Сообщение" required="required" name="review_text"></textarea>
                                        <span class="required">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row btn-container">
                                <button class="btn btn-danger add_new_button" type="submit">Добавить</button></div>
                        </form>
                        <div class="modal fade" id="reviews_modal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <p class="modal-title"></p>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Закрыть</button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>