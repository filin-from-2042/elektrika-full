<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 01.10.14
 * Time: 22:33
 */
class Reviews_model extends CBaseModel
{
    protected $cTableName = 'el_reviews';

    public function __construct()
    {
        parent::__construct();
    }

    public function GetAllReviews()
    {
        $this->db->where(
                            array('reviews_status' =>  'ENABLE')
                        );
        return $this->db->get($this->cTableName)->result_array();
    }
}