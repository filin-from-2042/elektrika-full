<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
include "cpagecontroller.php";
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 04.08.14
 * Time: 22:05
 */

class Home extends CPageController
{
    public $cPageName = 'Home';

    public function index()
    {
        $this->data = $this->Page_model->GetContentByDelimiter();

        $this->load->view('main/index.php');
    }
}