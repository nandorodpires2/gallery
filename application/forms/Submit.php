<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Submit
 *
 * @author Fernando Rodrigues
 */
class Form_Submit extends Zend_Form {
    
    public function init() {
        parent::init();
    }
    
    public static function addSubmit($label = 'Cadastrar', $class = 'btn btn-success', $attribs = array()) {
        $elementSubmit = new Zend_Form_Element_Submit('submit');
        $elementSubmit->setLabel($label);
        $elementSubmit->setAttrib("class", $class);
        
        if (count($attribs) > 0) {            
            $elementSubmit->setAttribs($attribs);            
        }
        
        return $elementSubmit;
    }
    
}
