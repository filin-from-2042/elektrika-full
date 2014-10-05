<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 03.09.14
 * Time: 22:44
 */

include "cpagecontroller.php";
class Job extends CPageController
{
    public $cPageName = 'job';

    public $cSingleJob = '';

    public $aPagesToTabs = array(
                                    'job_1'
                                );

    public function index()
    {
        // Get short preview text
        $aFullServices = $this->Page_model->GetPageContent('job', 'general');
        // Bottom short preview text in column
        $this->data->aPreviewText = $this->Page_model->GetContentByDelimiter( $aFullServices[0]["pages_text"], '<!--TabDelimiter-->' );

        $this->data->aFullPage = array();

        // Render preview pages text on tabs
        foreach($this->aPagesToTabs as $cValue)
        {
            $aPage = $this->Page_model->GetPageContent($cValue, 'job');
            if( !empty($aPage[0]) )
            {
                // All content of current page
                $this->data->aFullPage[] = $aPage[0];
            }
        }

        //Setting job view
        if( !empty($this->data->aFullPage) )
            $this->cSingleJob ="single_job";
        else
            $this->cSingleJob ="none";

        $this->load->view("main/index.php");
    }

}