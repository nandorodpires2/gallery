<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeamFormation
 *
 * @author Fernando Rodrigues
 */
class Form_Game_TeamFormation extends Zend_Form {
    
    public function init() {
        parent::init();
        
        // team_formation
        $this->addElement('select', 'team_formation', array(
            'label' => 'Formação:',
            'class' => 'form-control input-sm',
            'multioptions' => $this->getFormations(),
            'decorators' => array(
                'ViewHelper',
                'Description',
                'Errors',                      
                array('Errors', array('class' => 'error padding-10px bg-danger text-danger')),
                array('HtmlTag', array('tag' => 'div', 'class' => 'form-group'))                
            )
        ));
        
    }
    
    protected function getFormations() {
        
        $multioptions = array('' => 'Selecione a formação');
        
        $modelFormation = new Model_Formation();
        $formations = $modelFormation->fetchAll("active_formation = 1");               
        
        foreach ($formations as $formation) {
            $multioptions[$formation->id_formation] = $formation->formation;
        }
        
        return $multioptions;
        
    }
    
}
