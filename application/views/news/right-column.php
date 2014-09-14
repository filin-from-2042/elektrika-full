<div class="right-column">
    <div class="btn-group rss-btns">
        <button type="button" class="btn btn-default">Subscribe via RSS</button>
        <button type="button" class="btn btn-default icon-rss-btn"><span class="icon-rss"></span></button>
    </div>
    <div class="side-mail-wrap">
        <form role="form" class="form-inline side-mail-form clearfix" >
            <div class="form-group  col-md-8 col-md-offset-2  col-sm-8 col-sm-offset-1 col-xs-8 col-xs-offset-1">
                <label for="exampleInputEmail2" class="sr-only">Email</label>
                <input type="email"  id="side-InputEmail" class="form-control" placeholder="You email address">
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
            </div>
        </form>
    </div>
    <div class="counters-container clearfix">
        <div class="col-md-6  col-sm-6  col-xs-6  feed">
            <span id="feed-icon"></span><span class="count">12564</span><span class="text">Readers</span>
        </div>
        <div class="col-md-6  col-sm-6  col-xs-6 twitter">
            <span id="twitter-icon"></span><span class="count">12568</span><span class="text">Followers</span>
        </div>
    </div>
    <div class="section-container categories-container">
        <div class="title-container">
            <span class="title">Categories</span>
        </div>
        <div class="content-container clearfix">
            <?php
                $nCategoryCounter = 1;
                echo '<div class="col-md-6  col-sm-6  col-xs-6 "><ul>';
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
            <span class="title">Archives</span>
        </div>
        <div class="content-container clearfix">
            <?php
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
                <li class="comments active"><a href="#comments" role="tab" data-toggle="tab">Resent Comments</a></li>
                <li class="posts"><a href="#posts" role="tab" data-toggle="tab">Popular posts</a></li>
            </ul>
        </div>
        <div class="content-activity">
            <div class="tab-content">
                <div class="tab-pane active" id="comments">
                    <div class="comment-container">
                        <div class="comment-text">
                            <span class="nic">Nuok</span> says:
                                                        <span class="text">
                                                            Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore.
                                                        </span>
                        </div>
                        <div class="comment-info">
                            <a class="topic" href="#">January 2010 </a> in <a class="theme" href="#">How to make a good site</a>
                        </div>
                    </div>
                    <div class="comment-container">
                        <div class="comment-text">
                            <span class="nic">Nuok</span> says:
                                                        <span class="text">
                                                            Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore.
                                                        </span>
                        </div>
                        <div class="comment-info">
                            <a class="topic" href="#">January 2010 </a> in <a class="theme" href="#">How to make a good site</a>
                        </div>
                    </div>
                    <div class="comment-container">
                        <div class="comment-text">
                            <span class="nic">Nuok</span> says:
                                                        <span class="text">
                                                            Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore.
                                                        </span>
                        </div>
                        <div class="comment-info">
                            <a class="topic" href="#">January 2010 </a> in <a class="theme" href="#">How to make a good site</a>
                        </div>
                    </div>
                    <div class="comment-container">
                        <div class="comment-text">
                            <span class="nic">Nuok</span> says:
                                                        <span class="text">
                                                            Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore.
                                                        </span>
                        </div>
                        <div class="comment-info">
                            <a class="topic" href="#">January 2010 </a> in <a class="theme" href="#">How to make a good site</a>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="posts">posts</div>
            </div>
        </div>
    </div>
</div>