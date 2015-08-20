<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Form
 *
 * @author Fernando Rodrigues
 */
class Gallery_Form_Form extends Zend_Form {
    
    protected $attribs = array(
        'class' => 'form-control'
    );

    public function init() {
        parent::init();
        
        // add submit
        $submit = new Zend_Form_Element_Submit("submit");
        $submit->setLabel("Enviar");
        $submit->setAttribs(array(
            'class' => 'btn btn-primary'
        ));
        
        $this->addElement($submit);
        $this->setElementsDefaultAttribs();
                        
    }
    
    protected function setElementsDefaultAttribs() {
        $elements = $this->getElements();
        foreach ($elements as $key => $element) {            
            if ($key !== 'submit') {
                $this->getElement($key)->setAttribs($this->attribs);
            }
        }
    }
    
}
