<?foreach($aFullPage as $aPage):?>
    <div class="single-service web-design">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="<?=base_url('/images/'.$aPage["pages_preview_image"])?>" alt="..." class="img-rounded img-responsive">
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