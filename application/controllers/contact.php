<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
include "cpagecontroller.php";
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 01.09.14
 * Time: 20:40
 */

class Contact extends CPageController
{
    public $cPageName = 'contact';

    public function index()
    {
        $this->cJsFiles[] = 'contact.js';
        $this->load->view('main/index.php');
    }
}