<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Login
 *
 * @author Fernando Rodrigues
 */
class Form_Site_Login extends Zend_Form {
    
    public function init() {
        parent::init();
        
        $this->setAttribs(array(
            'id' => 'form-login',
            'method' => 'post',
            'action' => 'game/auth'
        ));
        
        // mail_user
        $this->addElement("text", "mail_user", array(
            'placeholder' => 'Digite seu e-mail',
            'class' => 'form-control',
            'required' => true
        ));
        
        // pass_user
        $this->addElement("password", "pass_user", array(
            'placeholder' => 'Digite sua senha',
            'class' => 'form-control',
            'required' => true
        ));
        
        // submit
        $this->addElement(Form_Submit::addSubmit("Acessar"));  
        
    }
    
}
