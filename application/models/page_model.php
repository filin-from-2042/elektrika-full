<?php //if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 04.08.14
 * Time: 22:51
 */

class Page_model extends CBaseModel
{
    protected $cTableName = 'el_pages';
    protected $cPageType = 'general';

    public function __construct()
    {
        parent::__construct();
    }

}
