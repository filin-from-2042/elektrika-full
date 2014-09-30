<?php
include "cbasecontroller.php";
/**
 * Created by PhpStorm.
 * User: Алексей Вячеславович
 * Date: 08.09.14
 * Time: 20:58
 */

class News extends CBaseController
{
    public $cPageName = 'news';
    public $aPaginationConfig = array();

    public function __construct()
    {
        parent::__construct();

        $this->cJsFiles[] = 'news.js';
        // Initialize pagination
        $this->load->library('pagination');
        $this->load->model("news_model");

        // Initialize pagination config
        $this->config->load("news_pagination");
        // Initializing array with pagination config
        $this->aPaginationConfig["per_page"] = $this->config->item('per_page');
        $this->aPaginationConfig["full_tag_open"] = $this->config->item('full_tag_open');
        $this->aPaginationConfig["full_tag_close"] = $this->config->item('full_tag_close');
        $this->aPaginationConfig["prev_tag_open"] = $this->config->item('prev_tag_open');
        $this->aPaginationConfig["prev_tag_close"] = $this->config->item('prev_tag_close');
        $this->aPaginationConfig["prev_link"] = $this->config->item('prev_link');
        $this->aPaginationConfig["next_tag_open"] = $this->config->item('next_tag_open');
        $this->aPaginationConfig["next_tag_close"] = $this->config->item('next_tag_close');
        $this->aPaginationConfig["next_link"] = $this->config->item('next_link');

        // All categories for right column
        $this->data->aCategories = $this->news_model->GetAllCategories();
        // All archives for right column
        $this->data->aArchives = $this->news_model->GetAllArchives();
        // Last comment for right column
        $this->data->aLastComments = $this->news_model->GetLastComments();
        // Last news for right column
        $this->data->aLastNews = $this->news_model->GetLimitNewsEx(0,2,false,'','DESC');
    }

    public function index($nStart = 0)
    {
        // Adding pagination configuration and initializing
        $this->aPaginationConfig['base_url'] = site_url().'/news/index';
        $this->aPaginationConfig['total_rows'] = $this->news_model->GetAllCount();
        $this->pagination->initialize($this->aPaginationConfig);

        // All rows with news
        $this->data->aAllNews = $this->news_model->GetLimitNews(intval($nStart),$this->aPaginationConfig['per_page']);

        // Render all page, right column with getting categories and archives
        $this->RenderGeneralData();
    }

    public function categories($cCategoryID, $nStart = 0)
    {
        // Adding pagination configuration and initializing
        $this->aPaginationConfig['base_url'] = site_url().'/news/categories/'. $cCategoryID . '/';
        $this->aPaginationConfig['total_rows'] = $this->news_model->GetCategoryCount(intval($cCategoryID));
        $this->aPaginationConfig['uri_segment'] = 4;
        $this->pagination->initialize($this->aPaginationConfig);

        // All rows with news
        $this->data->aAllNews = $this->news_model->GetLimitNewsEx(intval($nStart),$this->aPaginationConfig['per_page'], intval($cCategoryID));

        // Render all page, right column with getting categories and archives
        $this->RenderGeneralData();
    }


    public function archives($cArchiveID, $nStart = 0)
    {
        $nArchiveID = intval($cArchiveID);

        // Adding pagination configuration and initializing
        $this->aPaginationConfig['base_url'] = site_url().'/news/archives/'. $cArchiveID . '/';
        $this->aPaginationConfig['total_rows'] = $this->news_model->GetArchiveCount(intval($cArchiveID));
        $this->aPaginationConfig['uri_segment'] = 4;
        $this->pagination->initialize($this->aPaginationConfig);

        // Archive date from col 'archive_date(ex. 2014-09)'
        $cArchiveDate = $this->news_model->GetArchiveDate($nArchiveID);

        // All rows with news
        $this->data->aAllNews = $this->news_model->GetLimitNewsEx(intval($nStart),$this->aPaginationConfig["per_page"], '',$cArchiveDate);

        // Render all page, right column with getting categories and archives
        $this->RenderGeneralData();

    }

    public function singlenews($cNewsId)
    {
        $this->cViewDIR = "singlenews";
        $nNewsId = intval($cNewsId);

        if( isset($nNewsId) && !empty($nNewsId) )
        {
           $this->data->aFullPage = $this->news_model->GetDetailPage($nNewsId);

            $this->data->aAllComments = $this->news_model->GetNewsComments($nNewsId);

            $this->load->view('main/index.php');
        }
    }

    //-------------------------------------------- RENDER WITH GENERAL DATA --------------------------------------------/

    public function RenderGeneralData()
    {
        // Adding categories for all news
        foreach($this->data->aAllNews as &$aNews)
        {
            $aNews["news_categories"] = $this->news_model->GetCurrentCategories($aNews["id"]);
        }

        $this->load->view('main/index.php');
    }

}