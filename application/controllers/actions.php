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
    public $cPageName = 'actions';
    // Name of view for rendering. Defined according existing actions
    public $cSingleAction = '';

    // Actions names for rendering
    /*public $aPagesToTabs = array(
                                    'web_design',
                                    'marketing',
                                    'brand_design'
                                );*/
    public $aPagesToTabs = array();

    public function index()
    {
        // Get short preview text
        $aFullServices = $this->Page_model->GetPageContent('actions', 'general');
        // Bottom short preview text in column
        $this->data->aPreviewText = $this->Page_model->GetContentByDelimiter( $aFullServices[0]["pages_text"], '<!--TabDelimiter-->' );

        $this->data->aFullPage = array();

        // Render preview pages text on tabs
        foreach($this->aPagesToTabs as $cValue)
        {
            $aPage = $this->Page_model->GetPageContent($cValue, 'actions');
            if( $aPage )
            {
                // All content of current page
                $this->data->aFullPage[] = $aPage[0];
            }
        }

        //Setting job view
        if( !empty($this->data->aFullPage) )
            $this->cSingleAction ="single_action";
        else
            $this->cSingleAction ="none";

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