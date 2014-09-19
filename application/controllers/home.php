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

    public $aPagesToTabs = array(
                                    'tab_1' => 'who_we',
                                    'tab_2' => 'why_us',
                                    'tab_3' => 'we_offer',
                                    'tab_4' => 'testimonials'
                                );
    public $aTabsID = array(
                                'tab_1' =>  'who',
                                'tab_2' =>  'why',
                                'tab_3' =>  'can',
                                'tab_4' =>  'test',
                            );
    public function index()
    {
        $this->data->aTabs = array();
        foreach($this->aPagesToTabs as $cTab => $cPageName)
        {
            // Full content of home page
            $aTabData = $this->Page_model->GetPageContent($cPageName, 'home');
            // Separated full content
            $aPreview = $this->Page_model->GetContentByDelimiter($aTabData[0]["pages_text"], '<!--PreviewDelimiter-->' );
            // Add preview content to general array of home page
            $this->data->aTabs[$cTab]["preview_text"] = $aPreview["tab_1"];
            $this->data->aTabs[$cTab]["page_id"] = $aTabData[0]["id"];
        }
        $this->data->aTabsID = $this->aTabsID;
        $this->load->view('main/index.php');
    }

    public function fullpage($cHomePageID)
    {
        $this->cViewDIR = "singlepage";
        $nHomePageID = intval($cHomePageID);

        if( isset($nHomePageID) && !empty($nHomePageID) )
        {
            $this->data->aFullPageContent = $this->Page_model->GetDetailPage($nHomePageID);

            $this->cTitle = $this->data->aFullPageContent[0]["pages_title"];

            $this->load->view('main/index.php');
        }
    }
}