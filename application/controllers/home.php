<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 04.08.14
 * Time: 22:05
 */

class Home extends CI_Controller
{
    public function index()
    {
        $this->load->model('Page_model');

        $this->Page_model->SetPageName('Home');

        $oHomeContent=$this->Page_model->GetPageContent();
        $aTabs=$this->Page_model->GetContentByDelimiter();


        $this->load->view('main/header.php',$oHomeContent);
        $this->load->view('main/carousel.php',$oHomeContent);
        $this->load->view('home.php',$aTabs);
        $this->load->view('main/tabs-images.php',$oHomeContent);
        $this->load->view('main/mail-panel.php',$oHomeContent);
        $this->load->view('main/footer.php',$oHomeContent);

       // var_dump($oPage);
    }
}