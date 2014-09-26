<?php
    $this->load->view('main/top-title-panel.php');
?>
<div class="services-description">
<?foreach($aFullPages as $aPage):?>
    <div class="single-service web-design">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="<?=base_url('/images/'.$aPage["pages_preview_image"])?>" alt="..." class="img-rounded">
                </div>
                <div class="col-md-8">
                    <p>
                        <?=$aPage["pages_preview_text"]?>
                    </p>
                </div>
            </div>
            <div class="row buttons-container">
                <div class="col-md-6 col-sm-9">
                    <a href="<?=site_url('actions/fullInfo/' . $aPage["id"])?>">
                        <button type="button" class="btn btn-default readmore">
                            <span class="more">Читать полностью</span>
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
<?endforeach;?>
    <div class="container short-service-description">
        <div class="row">
            <div class="col-md-3">
                <span class="title">Get a gift with each service</span>
                <span class="short-service subtitle">This is a Subtittle</span>
                <p class="short-service text">
                    <?=$aPreviewText["tab_1"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">See how we work</span>
                <span class="short-service subtitle">This is a Subtittle</span>
                <p class="short-service text">
                    <?=$aPreviewText["tab_2"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">App Services</span>
                <span class="short-service subtitle">This is a Subtittle</span>
                <p class="short-service text">
                    <?=$aPreviewText["tab_3"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">Special Services</span>
                <span class="short-service subtitle">This is a Subtittle</span>
                <p class="short-service text">
                    <?=$aPreviewText["tab_4"]?>
                </p>
            </div>
        </div>
    </div>
</div>
<?php
    $this->load->view('main/tabs-images.php');
    $this->load->view('main/mail-panel.php');
?>