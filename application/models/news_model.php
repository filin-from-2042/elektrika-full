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
    public function GetLimitNews($nStart, $nLimit)
    {
       return $this->GetLimitNewsEx($nStart, $nLimit);
    }
    //--------------------------------------------- GET ALL NEWS ------------------------------------------------------/
    /**
     * @param $nStart
     * @param $nLimit
     * @return mixed
     */
    public function GetLimitNewsEx($nStart, $nLimit, $nCategoryID = '', $cArchiveDate = '')
    {

        if($nCategoryID)
        {
            $this->db->join('news2categories','news.id=news2categories.news_id','inner');
            $this->db->where('news2categories.category_id', $nCategoryID);
        }

        if($cArchiveDate)
        {
            $this->db->like('news_create_date',$cArchiveDate,'after');
        }

        $this->db->select('news.*');
        $this->db->from($this->cTableName);
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
        //var_dump($nNewsID);
        $this->db->select('categories.categories_name, categories.id');
        $this->db->from('news2categories');
        $this->db->join('categories', 'news2categories.category_id=categories.id','inner');
        $this->db->where('news2categories.news_id', $nNewsID);

        return $this->db->get()->result_array();
        //var_dump($this->db->get()->result_array());
    }

    //-------------------------------------------- GET COUNT IN CATEGORY -----------------------------------------------/
    public function GetCategoryCount($nCategoryID)
    {
        $this->db->where('category_id', $nCategoryID);
        $nResult = $this->db->count_all_results('news2categories');

        return $nResult;
    }
    //-------------------------------------------- GET NEWS COUNT IN ARCHIVE -------------------------------------------/
    public function GetArchiveCount($nArchiveID)
    {
        $this->db->where('id', $nArchiveID);
        $aArchive = $this->db->get('archives')->result_array();

        $this->db->like('news_create_date',$aArchive[0]["archive_date"],'after');
        return $this->db->count_all_results("news");
    }
    //-------------------------------------------- GET ARCHIVE DATE ----------------------------------------------------/
    public function GetArchiveDate($nArchiveID)
    {
        $this->db->where('id', $nArchiveID);
        $oArchive = $this->db->get('archives');
        $aArchive = $oArchive->result_array();

        return $aArchive[0]["archive_date"];
    }
}