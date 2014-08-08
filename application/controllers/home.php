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

        $oPage=$this->Page_model->GetPageContent('Home');

        $this->load->view('header.php',$oPage);
        $this->load->view('home.php',$oPage);
        $this->load->view('footer.php',$oPage);

       // var_dump($oPage);
    }
}