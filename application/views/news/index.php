<div class="blog-columns">
    <div class="container">
        <div class="row">
        <div class="col-md-8">
            <div class="main-column clearfix">

                <?php
                    foreach($this->data->aAllNews as $aNews)
                    {
                        // String with link on categories
                        $cCurrentCategories = '';
                        // Last array with category
                        $aLastCategory = end($aNews["news_categories"]);
                        foreach($aNews["news_categories"] as $aCategory)
                        {
                            $cCurrentCategories.='<a href="'.site_url('news/categories').'/'.$aCategory["id"].'">'.$aCategory["categories_name"].'</a>';
                            // If last don't concatenate
                            if($aCategory["id"] != $aLastCategory["id"]) $cCurrentCategories.=', ';
                        }
                        echo '<div class="post-preview clearfix">
                                <div class="post-title clearfix">
                                    <div class="col-md-9">
                                        <h2>'. $aNews["news_title"] .'</h2>
                                        <small>Posted by <span class="author">'. $aNews["news_author"] .'</span> on
                                        <span class="post-date">'. $aNews["news_create_date"] .'</span> | Categories:

                                        <span class="post-categories">
                                        ' . $cCurrentCategories . '

                                         </span></small>

                                    </div>
                                    <div class="col-md-3 col-md-3 text-right">
                                        <button class="btn btn-default" type="button">
                                            <span class="glyphicon glyphicon-comment"></span>
                                            <span class="post-numbers">175</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <img class="image-preview" src="'. base_url('/images/' . $aNews["news_preview_image"]) .'">
                                </div>
                                <div class="col-md-12 post-preview-text">
                                    <p>'. $aNews["news_content"] .'</p>
                                </div>
                                <div class="col-md-12 post-bottom-panel">
                                    <a href="' . site_url('/news/singlenews/'.$aNews["id"]) . '">
                                        <button class="btn btn-default readmore" type="button">
                                            <span class="more">Читать полностью</span>
                                        </button>
                                    </a>
                                    <!--<a href="#">
                                        <button class="btn btn-default share-this" type="button">
                                            <span class="share">Share this <span class="glyphicon glyphicon-heart"></span></span>
                                        </button>
                                    </a>-->
                                </div>
                            </div>';
                    }
                ?>
            </div>
            <div class="posts-navigation">
                    <?=$this->pagination->create_links();?>
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

