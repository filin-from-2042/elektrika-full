<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 09.08.14
 * Time: 14:39
 */

class About extends CI_Controller
{
    public function index()
    {
        $this->load->model('Page_model');

        $this->Page_model->SetPageName('About');

        $oAboutContent=$this->Page_model->GetPageContent();

        $this->load->view("main/header.php",$oAboutContent);
        $this->load->view("about.php",$oAboutContent);
        $this->load->view("main/tabs-images.php",$oAboutContent);
        $this->load->view('main/mail-panel.php',$oAboutContent);
        $this->load->view("main/footer.php",$oAboutContent);
    }
}