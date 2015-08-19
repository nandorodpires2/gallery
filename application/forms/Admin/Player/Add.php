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
class Form_Admin_Player_Add extends Zend_Form {
    
    public function init() {
        parent::init();
                
        // name_complete_player
        $this->addElement('text', 'name_complete_player', array(
            'label' => 'Nome Completo: ',
            'required' => true,
            'class' => 'form-control'
        ));
        
        // tiny_name_player
        $this->addElement('text', 'tiny_name_player', array(
            'label' => 'Nome Jogador: ',
            'required' => true,
            'class' => 'form-control'
        ));
        
        // star_player
        $this->addElement('radio', 'star_player', array(
            'label' => 'Jogador Craque?',
            'required' => true,
            'multioptions' => array(
                0 => ' Não',
                1 => ' Sim' 
            ),
            'value' => 0
        ));
        
        // id_country
        $this->addElement('select', 'id_country', array(
            'label' => 'País:',
            'multioptions' => Form_Default::listCountries(),
            'class' => 'form-control',
            'required' => true
        ));
        
        // id_professional_team
        $this->addElement('select', 'id_professional_team', array(
            'label' => 'Equipe:',
            'class' => 'form-control',            
            'required' => true,
            'multioptions' => Form_Default::listProfessionalTeams()
        ));
                
        // data_bithday_player
        $this->addElement('text', 'date_birthday_player', array(
            'label' => 'Data Nascimento: ',
            'required' => true,
            'class' => 'form-control'
        ));
        
        // id_position
        $this->addElement('select', 'id_position_player', array(
            'label' => 'Posição:',
            'class' => 'form-control',
            'required' => true,
            'multioptions' => Form_Default::listPositionsPlayer()
        ));
        
        // foot_player        
        $this->addElement('select', 'foot_player', array(
            'label' => 'Pé:',
            'class' => 'form-control',
            'required' => true,
            'multioptions' => Form_Default::listFootPlayer()
        ));
                
        // submit        
        $this->addElement(Form_Submit::addSubmit());
        
    }
    
}
