<?php //if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 04.08.14
 * Time: 22:51
 */

class Page_model extends CI_Model
{
    // MysqlResult
    protected $oResult='';
    protected $cTableName = 'el_pages';

    public function __construct()
    {
        parent::__construct();
    }

    //---------------------------------------- GET PAGE CONTENT  ------------------------------------------------------------
    /**
     *  Function return rage row like array or like object
     * @param $cPageName - Page name, contained in 'page_name'
     * @param string $cPageType - Type of page in 'page_type'
     * @param bool $bTypeResult - if TRUE result - like array, false - object
     * @return mixed - array or object
     */
    public function GetPageContent($cPageName, $cPageType = 'general', $bTypeResult = true)
    {
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
    /**
     * Function return content exploded on tabs by specify delimiter
     * @param $cRows - string with text fo explode
     * @param string $delimiter - delimiter, by which string will be explode
     * @return array - array with tabs content
     */
    public function GetContentByDelimiter($cRows,  $delimiter = '<!--TabDelimiter-->' )
    {
        $aTabs = explode($delimiter, $cRows);

        $aAssocTabs = array();

        foreach($aTabs as $key => $value)
        {
            $key++;
            $aAssocTabs["tab_".$key]=$value;
        }

        return $aAssocTabs;
    }
}
