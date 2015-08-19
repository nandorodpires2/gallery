<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Add
 *
 * @author Fernando
 */
class Form_Admin_PlayerAtribute_Add extends Zend_Form {
    
    public function init() {
        parent::init();
        
        // submit
        $this->addElement(Form_Submit::addSubmit());
        
    }
    
}
