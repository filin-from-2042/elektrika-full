<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 31.08.14
 * Time: 20:20
 */

class CPageController extends CI_Controller
{
    // Name of page, same in field 'el_page.page_name'
    public $cPageName = '';
    // Title of page, same in field 'el_page.pages_title'
    public $cTitle ='Электрика';
    // Description of page, same in field 'el_page.pages_description'
    public $cDescription ='Магазин "Электрика"';
    // Keywords of page, same in field 'el_page.pages_keywords'
    public $cKeywords ='Лампочки, розетки, батарейки';
    // Array with full data of page
    public $data;

    public function __construct()
    {
        parent::__construct();
        // Initializing of page
        $this->load->model('Page_model');
        $this->data = $this->Page_model->GetPageContent($this->cPageName);
        $this->cTitle = $this->data->pages_title;
        $this->cDescription = $this->data->pages_description;
        $this->cKeywords = $this->data->pages_keywords;
    }
}