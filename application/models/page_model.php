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

    public function __construct()
    {
        parent::__construct();
    }

    //---------------------------------------- GET PAGE CONTENT ------------------------------------------------------------
    /** Function return page content by $cPageName
     * @param $cPageName - value for field 'page_name'
     * @return mixed
     */
    public function GetPageContent($cPageName)
    {
        $this->db->where('page_name',$cPageName);

        $this->oResult=$this->db->get('el_pages');

        $row = $this->oResult->row();

        return $row;
    }

    //------------------------------------ GET CONTENT BY  DELIMITER -------------------------------------------------------
    /** Function get information for home page tabs
     * @return array
     */
    public function GetContentByDelimiter()
    {
        $aRows = $this->oResult->result_array();
        $aTabs = explode('<!--TabDelimiter-->',$aRows[0]["pages_text"]);

        $aAssocTabs = array();

        foreach($aTabs as $key => $value)
        {
            $key++;
            $aAssocTabs["tab_".$key]=$value;
        }

        return $aAssocTabs;
    }
}
