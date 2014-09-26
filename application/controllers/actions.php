<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 03.09.14
 * Time: 22:44
 */

include "cpagecontroller.php";
class Actions extends CPageController
{
    public $cPageName = 'Actions';

    public $aPagesToTabs = array(
                                    'tab_1' => 'web_design',
                                    'tab_2' => 'marketing',
                                    'tab_3' => 'brand_design'
                                );

    public function index()
    {
        // Get short preview text
        $aFullServices = $this->Page_model->GetPageContent('actions', 'general');
        // Bottom short preview text in column
        $this->data->aPreviewText = $this->Page_model->GetContentByDelimiter( $aFullServices[0]["pages_text"], '<!--TabDelimiter-->' );

        $this->data->aFullPage = array();

        // Render preview pages text on tabs
        foreach($this->aPagesToTabs as $cKey => $cValue)
        {
            $aPage = $this->Page_model->GetPageContent($cValue, 'actions');
            // All content of current page
            $this->data->aFullPages[] = $aPage[0];
        }

        $this->load->view("main/index.php");
    }

    public function fullInfo( $cActionPageID )
    {
        $this->cViewDIR = "singlepage";
        $nActionPageID = intval($cActionPageID);

        if( isset($nActionPageID) && !empty($nActionPageID) )
        {
            $this->data->aFullPageContent = $this->Page_model->GetDetailPage( $nActionPageID );

            $this->cTitle = $this->data->aFullPageContent[0]["pages_title"];

            $this->load->view('main/index.php');
        }

    }
}