<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeamStrategy
 *
 * @author Fernando Rodrigues
 */
class Form_Game_TeamStrategy extends Zend_Form {
    
    public function init() {
        parent::init();
        
        // team_formation
        $this->addElement('select', 'team_strategy', array(
            'label' => 'Tática:',
            'class' => 'form-control input-sm',
            'multioptions' => $this->getStrategies(),
            'decorators' => array(
                'ViewHelper',
                'Description',
                'Errors',                      
                array('Errors', array('class' => 'error padding-10px bg-danger text-danger')),
                array('HtmlTag', array('tag' => 'div', 'class' => 'form-group'))                
            )
        ));
        
    }
    
    protected function getStrategies() {
        $multioptions = array('' => 'Selecione a estratégia');
        
        $modelStrategy = new Model_Strategy();
        $strategies = $modelStrategy->fetchAll("active_strategy = 1");
        
        foreach ($strategies as $strategy) {
            $multioptions[$strategy->id_strategy] = $strategy->description_strategy;
        }
        
        return $multioptions;
    }
    
}
