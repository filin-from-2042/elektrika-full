<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 03.09.14
 * Time: 22:44
 */

include "cpagecontroller.php";
class Services extends CPageController
{
    public $cPageName = 'Services';

    public $aPagesToTabs = array(
                                    'tab_1' => 'web_design',
                                    'tab_2' => 'marketing',
                                    'tab_3' => 'brand_design'
                                );

    public function index()
    {
        // Get preview text
        $aFullServices = $this->Page_model->GetPageContent('services', 'general');
        $this->data->aPreviewText = $this->Page_model->GetContentByDelimiter( $aFullServices[0]["pages_text"], '<!--TabDelimiter-->' );

        // Render preview pages text on tabs
        foreach($this->aPagesToTabs as $cKey => $cValue)
        {
            // All content of current page
            $cTabContent = $this->Page_model->GetPageContent($cValue, 'services');
            // Preview separated text
            $aPreview = $this->Page_model->GetContentByDelimiter( $cTabContent[0]["pages_text"], '<!--PreviewDelimiter-->' );
            // Add text to general array
            $this->data->aTabs[$cKey] = $aPreview["tab_1"];
        }

        $this->load->view("main/index.php");
    }

    public function fullInfo()
    {
        echo '1';
    }
}