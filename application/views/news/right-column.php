<div class="right-column">
    <div class="btn-group rss-btns">
    </div>
    <div class="section-container categories-container">
        <div class="title-container">
            <span class="title">Категории</span>
        </div>
        <div class="content-container clearfix">
            <?php
                // Categories
                $nCategoryCounter = 1;
                echo '<div class="col-md-6  col-sm-6  col-xs-6 "><ul>';
                echo '<li><a href="' . site_url('news'). '">Все категории</a></li>';
                foreach($aCategories as $aCategory)
                {
                    if($nCategoryCounter > 5)
                    {
                        echo '</ul>
                            </div>
                            <div class="col-md-6  col-sm-6  col-xs-6 ">
                                <ul>';
                        $nCategoryCounter = 1;
                    }

                    echo '<li><a href="'. site_url("news/categories") . '/' . $aCategory["id"] . '">'. $aCategory["categories_name"] .'</a></li>';
                    $nCategoryCounter++;
                }
                echo '</ul></div>';
            ?>
        </div>
    </div>
    <div class="section-container archives-container clearfix">
        <div class="title-container">
            <span class="title">Архив</span>
        </div>
        <div class="content-container clearfix">
            <?php
                // Archives
                $nArchiveCounter = 1;
                echo '<div class="col-md-6 col-sm-6  col-xs-6"><ul>';
                foreach($aArchives as $aArchive)
                {
                    if($nArchiveCounter > 6)
                    {
                        echo '</ul>
                                </div>
                                <div class="col-md-6  col-sm-6  col-xs-6 ">
                                    <ul>';
                        $nArchiveCounter = 1;
                    }

                    echo '<li><a href="'. site_url("news/archives") . '/' . $aArchive["id"] . '">'. $aArchive["archive_name"] .'</a></li>';
                    $nArchiveCounter++;
                }
                echo '</ul></div>';

            ?>

        </div>
    </div>
    <div class="blog-activity">
        <div class="title-activity">
            <ul class="type-switcher clearfix" role="tablist">
                <li class="comments active"><a href="#comments" role="tab" data-toggle="tab">Последние комментарии</a></li>
                <li class="posts"><a href="#posts" role="tab" data-toggle="tab">Последние новости</a></li>
            </ul>
        </div>
        <div class="content-activity">
            <div class="tab-content">
                <div class="tab-pane active" id="comments">
                    <?php
                    if( $aLastComments != false)
                    {
                        foreach($aLastComments as $aComment)
                        {
                            echo " <div class=\"comment-container\">
                                    <div class=\"comment-text\">
                                        <span class=\"nic\"> $aComment[comments_author]</span> говорит:
                                                                    <span class=\"text\">
                                                                        $aComment[comments_content]
                                                                    </span>
                                    </div>
                                    <div class=\"comment-info\">
                                       в статье <a class=\"theme\" href=\"" . site_url('news/singlenews/'.$aComment['news_id']) . "\">$aComment[news_title]</a>
                                    </div>
                                </div>";
                        }
                    }
                    ?>
                </div>
                <div class="tab-pane" id="posts">
                    <?php
                    if( $aLastNews != false)
                    {
                        foreach($aLastNews as $aNews)
                        {
                            echo ' <div class="comment-container">
                                        <div class="comment-text">
                                            <span class="text">' .
                                                $aNews['news_preview_content'] .
                                           ' </span>
                                        </div>
                                        <div class="comment-info">
                                            <a class="theme" href="' . site_url('news/singlenews/'.$aNews['id']) . '">'.$aNews['news_title'].'</a>
                                        </div>
                                    </div>';
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>