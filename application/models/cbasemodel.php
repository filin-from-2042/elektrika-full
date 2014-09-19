<?php
/**
 * Created by PhpStorm.
 * User: Алексей Вячеславович
 * Date: 08.09.14
 * Time: 21:25
 */
class CBaseModel extends CI_Model
{
    // Name of current table
    protected $cTableName;
    // Type of page
    protected $cPageType;

    public function __construct()
    {
        parent::__construct();
    }
//------------------------------------ GET CONTENT BY ID ------------------------------------------/
    /**
     * Function return content by input id
     * @param $cID - 'id' in table
     * @param bool $bTypeResult - if TRUE result - like array, false - object
     * @return mixed - array or object
     */
    protected function GetContentByID($cID, $bTypeResult = true)
    {
        $this->db->where(
                            array('id' => $cID)
                        );

        $oResult = $this->db->get($this->cTableName);

        if($bTypeResult)
            return  $oResult->result_array();
        else
            return  $oResult->row();
    }
    //---------------------------------------- GET PAGE CONTENT  ------------------------------------------------------------
    /**
     *  Function return rage row like array or like object
     * @param $cPageName - Page name, contained in 'page_name'
     * @param string $cPageType - Type of page in 'page_type'
     * @param bool $bTypeResult - if TRUE result - like array, false - object
     * @return mixed - array or object
     */
    public function GetPageContent($cPageName, $cPageType = '', $bTypeResult = true)
    {
        if(empty($cPageType))
        {
            $cPageType = $this->cPageType;
        }

        $this->db->where(
            array(
                'page_name' => $cPageName,
                'page_type' => $cPageType
            )
        );

        $oResult = $this->db->get($this->cTableName);

        if($bTypeResult)
            return  $oResult->result_array();
        else
            return  $oResult->row();

    }

    //------------------------------------ GET CONTENT BY DELIMITER -------------------------------------------------------
    /**Function return content exploded on tabs by specify delimiter
     * @param $cRows
     * @param string $delimiter
     * @param string $cTabPrefix
     * @return array
     */
    public function GetContentByDelimiter($cRows,  $delimiter = '<!--TabDelimiter-->', $cTabPrefix = 'tab_' )
    {
        $aTabs = explode($delimiter, $cRows);

        $aAssocTabs = array();

        foreach($aTabs as $key => $value)
        {
            $key++;
            $aAssocTabs[$cTabPrefix.$key]=$value;
        }

        return $aAssocTabs;
    }

    //-------------------------------------------- GET ALL COUNT ------------------------------------------------------/
    /**
     * Function return count of all record in current model
     * @return mixed
     */
    public function GetAllCount()
    {
        return $this->db->count_all_results($this->cTableName);
    }

    //-------------------------------------------- GET ALL CATEGORIES --------------------------------------------------/
    /**
     * Function return all of news categories
     * @return mixed - array with categories
     */
    public function GetAllCategories()
    {
        return $this->db->get("categories")->result_array();
    }

    //---------------------------------------- GET DETAIL BY ID --------------------------------------------------------/
    public function GetDetailPage($id)
    {
        $this->db->where('id',$id);

        return $this->db->get($this->cTableName)->result_array();
    }
}