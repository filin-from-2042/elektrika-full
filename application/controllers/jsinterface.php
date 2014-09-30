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
//---------------------------------------- SUBSCRIBING ON ACTIONS MAIL -------------------------------------------------/
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
//---------------------------------------- ADDING NEW COMMENT ----------------------------------------------------------/
    public function news_add_comment()
    {
        $aData = '';
        if($_POST["data"] = '' ) return false;
        if( isset($_POST["answer_id"]) ) $nParentComment = intval( $_POST["answer_id"] );
        foreach($_POST["data"] as $cKey => &$aInput)
        {
            $aInput["name"] = htmlspecialchars( strip_tags( $aInput["name"] ) );
            $aInput["value"] = htmlspecialchars( strip_tags( $aInput["value"] ) );

            $aData[$aInput["name"]] = $aInput["value"];
        }

        $aResult = $this->interface_model->addComment( $aData, ( (isset($nParentComment)) ?  $nParentComment : '' ) );

        echo json_encode($aResult);
    }
}