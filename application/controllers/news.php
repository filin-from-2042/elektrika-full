<?php
/**
 * Created by PhpStorm.
 * User: Алексей Вячеславович
 * Date: 08.09.14
 * Time: 20:58
 */

class News extends CBaseController
{
    protected $cPageName = 'index';

    public function index()
    {

    }

    public function dateils($cNewsId)
    {
        if( isset($cNewsId) && !empty($cNewsId) )
        {

        }
    }
}