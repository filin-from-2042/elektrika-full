<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 31.08.14
 * Time: 20:20
 */
require "cbasecontroller.php";

class CPageController extends CBaseController
{
    public function __construct()
    {
        parent::__construct();
        // Initializing of page
        $this->load->model('Page_model');
        $this->data = $this->Page_model->GetPageContent($this->cPageName, 'general', false);

        // All categories for top header and right column
        $this->data->aCategories = $this->Page_model->GetAllCategories();

        $this->cTitle = $this->data->pages_title;
        $this->cDescription = $this->data->pages_description;
        $this->cKeywords = $this->data->pages_keywords;
    }
}