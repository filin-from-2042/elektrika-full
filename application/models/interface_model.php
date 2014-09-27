<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 27.09.14
 * Time: 14:18
 */

class Interface_Model extends CI_Model
{
    public $cTableName = '';
    //---------------------------------------- ADD NEW SUBSCRIBER ------------------------------------------------------/
    public function addSibscriber( $cEmail )
    {
        // Prepare data
        $this->cTableName = 'subscribers';
        $cEmail = $this->db->escape($cEmail);
        // Data, which will be inserted
        $aInsertData = array(
                                'email' => $cEmail
                            );
        // Check existance
        $this->db->where('email',$cEmail);
        $cExist = $this->db->get( $this->cTableName )->result_array();
        if( $cExist ) return 'Вы уже подписаны на рассылку!';

        $this->db->insert($this->cTableName, $aInsertData);

        return TRUE;
    }
}