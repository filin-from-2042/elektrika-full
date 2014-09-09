<?php
/**
 * Created by PhpStorm.
 * User: Алексей Вячеславович
 * Date: 08.09.14
 * Time: 22:16
 */
class News_Model extends CBaseModel
{
    protected $cTableName = 'el_news';
    protected $cPageType = 'news';

    //--------------------------------------------- GET ALL NEWS ------------------------------------------------------/
    /**
     * @param $nStart
     * @param $nLimit
     * @return mixed
     */
    public function GetLimitNews($nStart, $nLimit, $nCategoryID = '')
    {
        $this->db->select('*');
        $this->db->from($this->cTableName);

        if($nCategoryID)
        {
            $this->db->join('news2categories','news.id=news2categories.news_id','inner');
            $this->db->where('news2categories.news_id', $nCategoryID);
        }

        $this->db->limit($nLimit, $nStart);

        $aResult = $this->db->get()->result_array();
        foreach($aResult as &$aRow)
        {
          $aDelimitedContent = $this->GetContentByDelimiter($aRow["news_content"],'<!--PreviewDelimiter-->','');
          $aRow["news_content"] = $aDelimitedContent[1];
        }

        return $aResult;
    }

    //-------------------------------------------- GET ALL CATEGORIES --------------------------------------------------/
    public function GetAllCategories()
    {
        return $this->db->get("categories")->result_array();
    }

    //-------------------------------------------- GET CATEGORIES FOR CURRENT NEWS ------------------------------------/
    public function GetCurrentCategories($nNewsID)
    {
        $this->db->select('categories.categories_name, categories.id');
        $this->db->from('news2categories');
        $this->db->join('categories', 'news2categories.category_id=categories.id','inner');
        $this->db->where('news2categories.news_id', $nNewsID);

        return $this->db->get()->result_array();
    }
}