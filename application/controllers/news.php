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
    //public $cViewDIR = 'news';
    public $nPageLimit = 2;

    public function __construct()
    {
        parent::__construct();

        $this->load->model("news_model");
        // Initialize pagination
        $this->load->library('pagination');
    }

    public function index($nStart = 0, $cCategoryID = '')
    {
        $config['base_url'] = site_url().'/news/index';
        $config['total_rows'] = $this->news_model->GetCount();
        $config['per_page'] = '2';
        $config['full_tag_open'] = '<ul class="pager">';
        $config['full_tag_close'] = '</ul>';
        $config['prev_tag_open'] = '<li class="previous">';
        $config['prev_tag_close'] = '</li>';
        $config['prev_link'] = 'На предыдущую';
        $config['next_tag_open'] = '<li class="next">';
        $config['next_tag_close'] = '</li>';
        $config['next_link'] = 'На следующую';

        $this->pagination->initialize($config);

        // All rows with news
        $this->data->aAllNews = $this->news_model->GetLimitNews(intval($nStart),$this->nPageLimit, (!empty($cCategoryID) ? $cCategoryID: '' ));
        // Adding categories for all news
        foreach($this->data->aAllNews as &$aNews)
        {
            $aNews["news_categories"]=$this->news_model->GetCurrentCategories($aNews["id"]);
        }
        // All categories for right column
        $this->data->aCategories = $this->news_model->GetAllCategories();
        $this->load->view('main/index.php');

    }

    public function categories($cCategoryID)
    {

        $config['base_url'] = site_url().'news/categories';
        $config['total_rows'] = $this->news_model->GetCount();
        $config['per_page'] = '2';
        $config['full_tag_open'] = '<ul class="pager">';
        $config['full_tag_close'] = '</ul>';
        $config['prev_tag_open'] = '<li class="previous">';
        $config['prev_tag_close'] = '</li>';
        $config['prev_link'] = 'На предыдущую';
        $config['next_tag_open'] = '<li class="next">';
        $config['next_tag_close'] = '</li>';
        $config['next_link'] = 'На следующую';

        $this->pagination->initialize($config);

        $this->index(0, intval($cCategoryID),'news/categories');
    }

    public function singlenews($cNewsId)
    {
        if( isset($cNewsId) && !empty($cNewsId) )
        {

        }
    }
}