<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Atribute
 *
 * @author Fernando Rodrigues
 */
class Form_Admin_Player_Atribute extends Zend_Form {
    
    public function init() {
        parent::init();
        
        // id_atribute
        $this->addElement('multiCheckbox', 'id_atribute', array(
            'label' => 'Atributos',
            'multioptions' => Form_Default::getAtributes(),
            'separator' => "<p>",
            'required' => true
        )); 
        
        //submit
        $this->addElement(Form_Submit::addSubmit());
        
    }
    
}
