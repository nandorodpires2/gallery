<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cadastro
 *
 * @author Fernando
 */
class Form_Admin_ProfessionalTeam_Cadastro extends Zend_Form {
    
    public function init() {
        
        $this->setAttribs(array(
            'id' => 'formProfessionalTeamCadastro'
        ));
        
        // team_name_complete
        $this->addElement("text", "name_professional_team", array(
            'label' => 'Nome completo:',
            'class' => 'form-control',
            'required' => true
        ));
        
        // team_name_short
        $this->addElement("text", "tiny_name_professional_team", array(
            'label' => 'Nome:',
            'class' => 'form-control',
            'required' => true
        ));
        
        // slug_professional_team
        $this->addElement("text", "slug_professional_team", array(
            'label' => 'Slug:',
            'class' => 'form-control',
            'required' => true
        ));
        
        // team_name_short
        $this->addElement("select", "division_professional_team", array(
            'label' => 'Divisão atual:',
            'class' => 'form-control',
            'required' => true,
            'multioptions' => array(
                1 => 1,
                2 => 2,
                3 => 3,
                4 => 4,
                5 => 5
            )
        ));
        
        // id_country
        $this->addElement('select', 'id_country', array(
            'label' => 'País:',
            'multioptions' => Form_Default::listCountries(),
            'class' => 'form-control',
            'required' => true
        ));
                   
        // submit
        $this->addElement(Form_Submit::addSubmit());
        
    }
    
}
