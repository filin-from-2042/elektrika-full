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
     * Short kind of GetLimitNewsEx
     * @param integer $nStart - start number of limit
     * @param integer $nLimit - count, which is limit result
     * @return mixed - array with limited news rows
     */
    public function GetLimitNews($nStart, $nLimit)
    {
       return $this->GetLimitNewsEx($nStart, $nLimit);
    }
    //--------------------------------------------- GET ALL NEWS ------------------------------------------------------/
    /**
     * Function return limited number of rows with news
     * @param integer $nStart - start number of limit
     * @param integer $nLimit - count, which is limit result
     * @param integer $nCategoryID - id category, for which select news
     * @param string $cArchiveDate - date pattern, like '2014-09'
     * @return mixed - array with limited news rows
     */
    public function GetLimitNewsEx($nStart, $nLimit, $nCategoryID = 0, $cArchiveDate = '', $cOrder = 'ASC')
    {
        if($nCategoryID)
        {
            // Join with table with pare 'news - category' for getting news from necessary category
            $this->db->join('news2categories','news.id=news2categories.news_id','inner');
            $this->db->where('news2categories.category_id', $nCategoryID);
        }

        if($cArchiveDate)
        {
            // Filter news by year and month, example '2014-09'
            $this->db->like('news_create_date',$cArchiveDate,'after');
        }
        // Fields getting only from table 'news'
        $this->db->select('news.*');
        $this->db->from($this->cTableName);
        $this->db->limit($nLimit, $nStart);
        $this->db->order_by('id',$cOrder);

        $aResult = $this->db->get()->result_array();
        foreach($aResult as &$aRow)
        {
          //Divide the content of news, for preview in general list
          $aDelimitedContent = $this->GetContentByDelimiter($aRow["news_content"],'<!--PreviewDelimiter-->','');
          $aRow["news_content"] = $aDelimitedContent[1];
        }
        return $aResult;
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

    //-------------------------------------------- GET COUNT IN CATEGORY -----------------------------------------------/
    /**
     * Function return count of all news in current category
     * @param $nCategoryID - id of category, for which need count up
     * @return integer - news count
     */
    public function GetCategoryCount($nCategoryID)
    {
        $this->db->where('category_id', $nCategoryID);
        $nResult = $this->db->count_all_results('news2categories');

        return $nResult;
    }
    //-------------------------------------------- GET NEWS COUNT IN ARCHIVE -------------------------------------------/
    /**
     * Function getting count of news in needed archive part, from January 2014, February 2014 etc.
     * @param integer $nArchiveID - id of current archive in table 'archives'
     * @return mixed
     */
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
    //---------------------------------------- GET ALL ARCHIVES --------------------------------------------------------/
    public function GetAllArchives()
    {
        return $this->db->order_by('archive_date','ASC')->get('archives')->result_array();
    }

    //---------------------------------------- GET LAST COMMENTS -------------------------------------------------------/
    public function GetLastComments()
    {
        // TODO : find solution for query
        $oRes = $this->db->query('  SELECT t_c.comments_content,
                                           t_c.comments_author,
                                           t_n.id AS news_id,
                                           t_n.news_title,
                                           t_a.id AS archive_id,
                                           t_a.archive_name
                                    FROM el_comments AS t_c
                                      INNER JOIN el_news AS t_n
                                        ON t_c.comments_news_id = t_n.id
                                      LEFT JOIN el_archives AS t_a
                                        ON SUBSTR(t_n.news_create_date,1,7) = t_a.archive_date
                                       LIMIT 0,4');

        return $oRes->result_array();
    }

    //---------------------------------------- GET NEWS COMMENTS -------------------------------------------------------/
    public function GetNewsComments($nNewsID)
    {
        $this->db->where(
                         array(
                                'comments_news_id'=>$nNewsID,
                                'comments_status'=>'ENABLE',
                               )
                        );

        $oResult = $this->db->get('comments');

        return $oResult->result_array();
    }

}