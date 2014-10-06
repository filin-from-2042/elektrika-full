<?php
/**
 * Created by PhpStorm.
 * User: Set
 * Date: 06.10.14
 * Time: 20:27
 */
//---------------------------------------- CLEAR FORM DATA ------------------------------------------------------------/
function ClearData( $mData )
{
    if( is_array($mData) )
    {
        foreach($mData as &$cValue)
        {
               $cValue = htmlspecialchars( strip_tags( $cValue ) ) ;
        }
    }
    elseif( $mData )
    {
        $mData = htmlspecialchars( strip_tags( $mData ) );
    }

    return $mData;
}

//---------------------------------------- TAKING SERIALIZE FORM -------------------------------------------------------/
function FormatFormData( $aFormData)
{
    if( !$aFormData ) return false;
    $aData = '';
    foreach($aFormData as &$aInput)
    {
        $aInput["name"] = htmlspecialchars( strip_tags( $aInput["name"] ) );
        $aInput["value"] = htmlspecialchars( strip_tags( $aInput["value"] ) );

        $aData[$aInput["name"]] = $aInput["value"];
    }
    return $aData;

}

