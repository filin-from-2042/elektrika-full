<?php
    $this->load->view('main/top-title-panel.php');
?>
<div class="contact-content">
    <div class="container">
        <div class="row">
            <div class="main-column col-md-8 col-sm-8">
                <div class="short-text">
                    <div class="short-text header">
                        <span class="short-text title">Мы находимся</span>
                        <small class="short-text subtitle">Наши магазины находятся по следующим адресам</small>
                    </div>
                    <div class="short-text">
                        <p>
                            <?=$pages_text?>
                        </p>
                    </div>
                </div>
                <div class="form-contact-container">
                    <div class="form-contact header">
                        <span class="form-contact title">Форма обратной связи</span>
                        <small class="form-contact subtitle">Вы можете задать вопрос заполнив поля ниже</small>
                    </div>
                    <form class="form-contact">
                        <div class="row inline-inputs">
                            <div class="col-md-6">
                                <input class="form-control required" type="text" id="contactName" placeholder="Имя" required="required" name="contact_name"/><span class="required">*</span>
                                <input class="form-control" type="text" id="contactPhone" placeholder="Телефон" required="required" name="contact_phone"/><span class="required">*</span>
                            </div>
                            <div class="col-md-6">
                                <input class="form-control" type="text" id="contactEmail" placeholder="Email" required="required" name="email"/><span class="required">*</span>
<!--                                <input class="form-control" type="text" id="contactWebsite" placeholder="Сайт"/><span class="required">*</span>-->
                                 <input class="form-control" type="text" id="contactSubject" placeholder="Тема" required="required" name="subject"/><span class="required">*</span>

                            </div>
                        </div>
                        <div class="row block-inputs">
                            <div class="col-md-12">
<!--                                <input class="form-control" type="text" id="contactSubject" placeholder="Тема"/><span class="required">*</span>-->
                                <textarea placeholder="Текст письма" rows="6" id="contactMessage" class="form-control" required="required" name="message"></textarea><span class="required">*</span>
                            </div>
                        </div>
                        <div class="row btn-container">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-danger">Отправить</button>
                            </div>
                        </div>
                    </form>
                    <div class="modal fade" id="contact_modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <p class="modal-title"></p>
                                </div>
                                <div class="modal-body">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Закрыть</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
            </div>
            <div class="blocks-column col-md-4 col-sm-4">
                <div class="map-container hidden-xs">
                    <div class="map-wrap">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2344.2406401941926!2d38.
                        299147!3d54.01625299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x41369c0d9f62c
                        20f%3A0x55c4303bb1a588a6!2z0YPQuy4g0KHQsNC00L7QstGB0LrQvtCz0L4sIDM2LCDQndC-0LLQvtC80L7RgdC60
                        L7QstGB0LosINCi0YPQu9GM0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwsIDMwMTY1MA!5e0!3m2!1sru!2sru!4v1409942548122"
                        height="300" frameborder="0" style="border:0"></iframe>
                    </div>
                </div>
                <div class="contact-info-container">
                    <div class="contact-info title">Контактная информация</div>
                    <div class="contact-info email">
                        <span class="email-title">Email:</span><span class="email-text"><?=mailto($this->config->item('company_email'));?></span>
                    </div>
                    <div class="contact-info office">
                        <span class="office-title">Адрес:</span><span class="office-text"><?=$this->config->item('company_office');?></span>
                    </div>
                    <div class="contact-info phone">
                        <span class="phone-title">Телефон:</span><span class="phone-text"><?=$this->config->item('company_phone');?></span>
                    </div>
                    <div class="contact-info fax">
                        <span class="fax-title">Факс:</span><span class="fax-text"><?=$this->config->item('company_fax');?></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
    $this->load->view('main/tabs-images.php');
    $this->load->view('main/mail-panel.php');
?>