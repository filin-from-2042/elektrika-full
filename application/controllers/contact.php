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
        $this->cJsFiles[] = base_url('/js/contact.js');
        $this->cJsFiles[] = "http://api-maps.yandex.ru/1.1/index.xml?key=ABgaOVQBAAAAWMuVJgIAIKnxNWcoI1CeGT_ciJYEYmc76jEAAAAAAAAAAAC58F_xJGNelQXwF2v4ePyBMvPbFQ==&modules=pmap";
        $this->cJsFiles[] = base_url('/js/ya_map.js');

        $this->load->view('main/index.php');
    }
}