<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 27.09.14
 * Time: 1:02
 */

class JsInterface extends CI_Controller
{
    //---------------------------------------- SUBSCRIBE ON ACTION MAIL ------------------------------------------------/
    public function __construct()
    {
        parent::__construct();
        $this->load->model('interface_model');
    }
    public function mail_panel_subscribe()
    {
        if( !empty($_POST["new_mail"]))
        {
            $cNewMail = '';
            if ( isset($_POST["new_mail"]) ) $cNewMail = $_POST["new_mail"];

            $cNewMail = strip_tags($cNewMail);
            $cNewMail = htmlspecialchars($cNewMail);

            $res = $this->interface_model->addSibscriber($cNewMail);
            if( $res === true )
                echo 'OK';
            else
                echo $res;
        }
    }
}