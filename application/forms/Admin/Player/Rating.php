<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Rating
 *
 * @author Fernando Rodrigues
 */
class Form_Admin_Player_Rating extends Zend_Form {
    
    public function init() {
        parent::init();
        
        // force_player
        $this->addElement('text', 'force_player_rating', array(
            'label' => 'Força: ',
            'required' => true,
            'class' => 'form-control'
        ));
        
        // value_player
        $this->addElement('text', 'value_player_rating', array(
            'label' => 'Valor: ',
            'required' => true,
            'class' => 'form-control'
        ));
        
        // submit
        $this->addElement(Form_Submit::addSubmit());
        
        // id_player
        $this->addElement('hidden', 'id_player');
        
    }
    
}
