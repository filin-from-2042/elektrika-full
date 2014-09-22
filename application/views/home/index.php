<?php
    $this->load->view('main/carousel.php');
?>
<div class="short-info">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#who" data-toggle="tab">Кто мы<br><span class="sub-text">Немного о нас</span></a></li>
                    <li><a href="#why" data-toggle="tab">Почему мы<br><span class="sub-text">Наши преимущества</span></a></li>
                    <li><a href="#can" data-toggle="tab">Мы предлагаем <br><span class="sub-text">Товары магазина</span></a></li>
                    <li><a href="#test"data-toggle="tab">Отзывы<br><span class="sub-text">Отзывы покупателей</span></a></li>
                </ul>
            </div>
        </nav>
        <!-- Tab panes -->
        <div class="container">
            <div class="row">
                <div class="tab-content">
                    <?foreach($aTabs as $cTabKey => $cTabContent):?>
                    <div class="tab-pane <?=($cTabKey == 'tab_1')?'active':''?>" id="<?=$aTabsID[$cTabKey];?>">
                        <div class="row">
                            <div class="col-md-8 col-sm-8">
                                <?=$cTabContent["preview_text"];?><br>. . .
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <img src="/images/image-about.png" alt="image about us" class="img-responsive">
                            </div>
                        </div>
                        <div class="row buttons-full-info hidden-xs">
                            <div class="col-md-6 col-sm-8">
                                <a href="<?=site_url('home/fullpage/' . $cTabContent["page_id"])?>">
                                    <button type="button" class="btn btn-default">
                                        <span class="more">Читать полностью</span>
                                    </button>
                                </a>
                               <!-- <a href="#" >
                                    <button type="button" class="btn btn-info">
                                        <span class="follow">Follow Us</span>
                                    </button>
                                </a>
                                <a href="#">
                                    <button type="button" class="btn btn-primary">
                                        <span class="facebook">Facebook</span>
                                    </button>
                                </a>-->
                            </div>
                            <div class="col-md-6 col-sm-4">
                                <a href="#" class="pull-right">
                                    <button type="button" class="btn btn-default">
                                        <span class="get">Get in touch</span>
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                <? endforeach;?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
    $this->load->view('main/tabs-images.php');
    $this->load->view('main/mail-panel.php');
?>