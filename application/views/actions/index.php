<?php
    $this->load->view('main/top-title-panel.php');
?>
<div class="services-description">
    <?php
    $this->load->view('actions/' . $this->cSingleAction . '.php');
    ?>
    <div class="container short-service-description">
        <div class="row">
            <div class="col-md-3">
                <span class="title">Свобода выбора</span>
<!--                <span class="short-service subtitle">This is a Subtittle</span>-->
                <p class="short-service text">
                    <?=$aPreviewText["tab_1"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">Широкие возможности применения</span>
<!--                <span class="short-service subtitle">This is a Subtittle</span>-->
                <p class="short-service text">
                    <?=$aPreviewText["tab_2"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">Профессиональная консультация</span>
<!--                <span class="short-service subtitle">This is a Subtittle</span>-->
                <p class="short-service text">
                    <?=$aPreviewText["tab_3"]?>
                </p>
            </div>
            <div class="col-md-3">
                <span class="title">Выгодная система скидок</span>
<!--                <span class="short-service subtitle">This is a Subtittle</span>-->
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