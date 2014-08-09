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

    //Name current page
    protected $cPageName='Home';

    public function __construct()
    {
        parent::__construct();
    }
    //Set Name of current page
    public function SetPageName($cPageName)
    {
        $this->cPageName=$cPageName;
    }

    public function GetPageContent()
    {
        $this->db->where('page_name',$this->cPageName);

        $this->oResult=$this->db->get('el_pages');

        $row=$this->oResult->row();


        return $row;
    }

    public function GetContentByDelimiter()
    {
        $aRows=$this->oResult->result_array();
        $aTabs=explode('<!--delimiter-->',$aRows[0]["pages_text"]);

        $aAssocTabs=array();

        foreach($aTabs as $key => $value)
        {
            $key++;
            $aAssocTabs["tab_".$key]=$value;
        }

        return $aAssocTabs;
    }
}
