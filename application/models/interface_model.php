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

    //---------------------------------------- ADD COMMENT ------------------------------------------------------------/
    public function addComment($aData, $nParentComment = null)
    {
        $aInputData = array(
                                'comments_news_id'  =>  $aData["news_id"],
                                'comments_content'  =>  $aData["comment_text"],
                                'comments_author'  =>  $aData["author_name"],
                                'comments_email'  =>  $aData["author_email"],
                            );
        if( !empty($nParentComment) )
            $aInputData['comments_parent_id'] = $nParentComment;

        $this->db->insert('comments',$aInputData );

        $aInputData['comments_create_time'] = date('Y-m-d H:i:s');
        $aInputData['id'] = $this->db->insert_id();

        return $aInputData;
    }
}