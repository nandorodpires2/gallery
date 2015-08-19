<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Add
 *
 * @author Fernando Rodrigues
 */
class Form_Game_Team_Create extends Zend_Form {
    
    public function init() {
        parent::init();
        
        $this->setAttribs(array(
            'id' => 'form-login',
            'method' => 'post',
            'action' => 'game/create-team'
        ));
        
        // name_team
        $this->addElement("text", "name_team", array(
            'placeholder' => 'Digite o nome da sua equipe',
            'class' => 'form-control',
            'required' => true
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
        $this->addElement(Form_Submit::addSubmit());        
        
    }
    
}
