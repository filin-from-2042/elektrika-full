<div class="slider">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <?
            // Counter
            $i=0;
            if ($aImagesCarousel!=false)
            {
                foreach ($aImagesCarousel as $Image)
                {
                    echo '<li data-target="#myCarousel" data-slide-to="' . $i . '"'. ($i==0?' class="active" ':'') .'></li>';
                    $i++;
                }
            }
            ?>
        </ol>
        <div class="container slider-wrap">
            <div class="carousel-inner">
                <?
                // Counter
                $i=1;
                if ($aImagesCarousel!=false)
                {
                    foreach ($aImagesCarousel as $Image)
                    {
                        echo '<div class="item '. ( ( $i == 1 ) ? 'active' : '' ) .'">';
                            echo '<img src="' . base_url($Image['src']) . '">';
                        echo '</div>';
                        $i++;
                    }
                }
                ?>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
</div>