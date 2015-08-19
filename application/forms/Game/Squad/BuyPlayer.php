<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BuyPlayer
 *
 * @author Fernando Rodrigues
 */
class Form_Game_Squad_BuyPlayer extends Zend_Form {
    
    public function init() {
        
        $this->setAttribs(array(
            'id' => 'form-search-players',
            'class' => 'small'
        ));
        
        // name_player
        $this->addElement("text", "name_player", array(
            'label' => 'Jogador: ',
            'class' => 'input-sm form-control'
        ));
                
        // position
        $this->addElement('select', 'position_player', array(
            'label' => 'Posição: ',
            'class' => 'input-sm form-control',
            'multioptions'  => Form_Default::listPositionsPlayer()
        ));
        
        // foot
        $this->addElement('select', 'foot_player', array(
            'label' => 'Pé: ',
            'class' => 'input-sm form-control',
            'multioptions'  => Form_Default::listFootPlayer()
        ));
        
        // value
        $this->addElement("text", "value_player", array(
            'label' => 'Valor: ',
            'class' => 'input-sm form-control'
        ));
        
        // submit
        $this->addElement(Form_Submit::addSubmit("Buscar", "btn btn-sm btn-success", array('id' => 'btn-search-players')));
        
    }
    
}
