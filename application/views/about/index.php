<?php
    $this->load->view('main/top-title-panel.php');
?>
<div class="short-info">
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-8">
                    <?=$aGeneralPage["preview_text"]?>
                </div>
                <div class="col-md-4 col-sm-4">
                    <img src="<?=base_url('images/' . $aGeneralPage["preview_image"])?>" alt="image about us" class="img-responsive">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="columns-preview">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body">
                <p>
                    "Электрика"  - всегда низкие цены
                </p>
            </div>
        </div>
        <div class="columns clearfix">
            <div class="col-md-4 col-sm-4">
                <div>
                    <span id="people" href="#">Для строительных компаний</span>
                </div>
                <p><?=$aTabs["tab_1"]?></p>
            </div>
            <div class="col-md-4 col-sm-4">
                <div>
                    <span id="professionals" href="#">Монтажным организациям</span>
                </div>
                <p><?=$aTabs["tab_2"]?></p>
            </div>
            <div class="col-md-4 col-sm-4">
                <div>
                    <span id="quality" href="#">Поставщикам</span>
                </div>
                <p><?=$aTabs["tab_3"]?></p>
            </div>
        </div>
    </div>
</div>
<?php
    $this->load->view('main/tabs-images.php');
    $this->load->view('main/mail-panel.php');
?>