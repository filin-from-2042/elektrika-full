<?php
/**
 * Created by PhpStorm.
 * User: Алексей Вячеславович
 * Date: 08.09.14
 * Time: 21:00
 */
class CBaseController extends CI_Controller
{
    // Name of page, same in field 'el_page.page_name'
    public $cPageName = '';
    // Directory of view 'index.php' for current controller
    public $cViewDIR = '';
    // Title of page, same in field 'el_page.pages_title'
    public $cTitle ='Электрика';
    // Subtitle of page, same in field 'el_page.pages_subtitle'
    public $cSubTitle ='';
    // Description of page, same in field 'el_page.pages_description'
    public $cDescription ='Магазин "Электрика"';
    // Keywords of page, same in field 'el_page.pages_keywords'
    public $cKeywords ='Лампочки, розетки, батарейки';
    // Object with full data of page
    public $data;

    public function __construct()
    {
        parent::__construct();
        $this->cViewDIR = $this->cPageName;
    }
}