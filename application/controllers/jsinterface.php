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
        $this->load->helper('gen_functions');
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
        if($_POST["data"] == '' ) return false;
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

    //---------------------------------------- ADD NEW REVIEW ---------------------------------------------------------/
    public function reviews_add_comment()
    {
        if( !empty($_POST["data"]) )
            $aData = FormatFormData( $_POST["data"] );

        $res = $this->interface_model->addReview( $aData );

        if( $res === true )
            echo 'OK';
        else
            echo $res;

    }

    //---------------------------------------- CONTACT FORM ------------------------------------------------------------/
    public function contact_question()
    {
        if( !$_POST["contact_data"] ) return false;
        $aContact = FormatFormData( $_POST["contact_data"] );

        // Load library
        $this->load->library('email');

        $cMessage = "Имя отправителя: " . $aContact["contact_name"] . "\n".
                    "Телефон отправителя: " . $aContact["contact_phone"] . "\n".
                    "E-mail отправителя: " . $aContact["email"] . "\n".
                    "Содержание письма: " . $aContact["message"];

        $this->email->from('your@your-site.com', 'Elektrika');
        $this->email->to('filin2042@yandex.ru');
        $this->email->subject($aContact["subject"]);
        $this->email->message( $cMessage );
        if( !$this->email->send() )
        {
            // Debug info
            echo $this->email->print_debugger();
        }
        else
            echo 'OK';

    }


}