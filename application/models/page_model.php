<?php //if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 04.08.14
 * Time: 22:51
 */

class Page_model extends CI_Model
{
    public function GetPageContent($sPageName)
    {
        $this->db->where('page_name',$sPageName);
        $result=$this->db->get('el_pages');
        $row=$result->row();

        return $row;
    }
}
