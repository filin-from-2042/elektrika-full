<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 09.08.14
 * Time: 14:39
 */
include "cpagecontroller.php";
class About extends CPageController
{
    public $cPageName = 'About';

    public function index()
    {
        $this->load->view("main/index.php");
    }
}