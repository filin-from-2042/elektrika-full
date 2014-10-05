<?php
$this->load->view('main/top-title-panel.php');
?>
    <div class="services-description">
        <div class="single-service web-design">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <img src="<?=base_url('/images/'.$aFullPageContent[0]["pages_preview_image"])?>" alt="..." class="img-responsive">
                    </div>
                    <div class="col-md-8">
                        <p>
                                <?=$aFullPageContent[0]["pages_text"]?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container short-service-description">
            <div class="row">
                <div class="col-md-3">
                    <span class="title">Свобода выбора</span>
<!--                    <span class="short-service subtitle">This is a Subtittle</span>-->
                    <p class="short-service text">
                        <?=$aPreviewActions["tab_1"]?>
                    </p>
                </div>
                <div class="col-md-3">
                    <span class="title">Широкие возможности применения</span>
<!--                    <span class="short-service subtitle">This is a Subtittle</span>-->
                    <p class="short-service text">
                        <?=$aPreviewActions["tab_2"]?>
                    </p>
                </div>
                <div class="col-md-3">
                    <span class="title">Профессиональная консультация</span>
<!--                    <span class="short-service subtitle">This is a Subtittle</span>-->
                    <p class="short-service text">
                        <?=$aPreviewActions["tab_3"]?>
                    </p>
                </div>
                <div class="col-md-3">
                    <span class="title">Выгодная система скидок</span>
<!--                    <span class="short-service subtitle">This is a Subtittle</span>-->
                    <p class="short-service text">
                        <?=$aPreviewActions["tab_4"]?>
                    </p>
                </div>
            </div>
        </div>
    </div>
<?php
$this->load->view('main/tabs-images.php');
$this->load->view('main/mail-panel.php');
?>