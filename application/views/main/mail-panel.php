<div class="mail-panel">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="mail-icon clearfix">
                        <span class="icon mail-icon"></span>
                        <div class="col-md-11 content-panel clearfix">
                            <div class="col-md-7">
                                <p>
                                    <span >Подписка на рассылку</span>
                                    <span class="hidden-xs">Информацию о проводимых акциях</span>
                                </p>
                            </div>
                            <div class="col-md-5">
                                <form class="form-inline" role="form" id="form_subscribe">
                                    <button type="submit" class="btn btn-danger" id="action_subscribe">Подписка</button>
                                    <div class="form-group">
                                        <label class="sr-only" for="exampleInputEmail2">Email</label>
                                        <input type="email" pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="subscribe_input_mail" placeholder="Ваш Email" required="required">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="mail_panel_modal">
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