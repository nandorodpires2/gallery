<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * Description of Default
 *
 * @author Fernando
 */
class Form_Default extends Zend_Form {

    public function init() {
        parent::init();              
        
    }
    
    /**
     * 
     * @return type
     */
    public static function listCountries() {
        $populate = array('' => 'Selecione...');
        
        $modelCountry = new Model_Country();
        $countries = $modelCountry->fetchAll(null, "name_country asc");        
        foreach ($countries as $country) {
            $populate[$country->id_country] = $country->name_country;
        }
        
        return $populate;
    }
    
    /**
     * 
     */
    public static function listProfessionalTeams() {
        $populate = array('' => 'Selecione...');
        
        $modelProfessionalTeam = new Model_ProfessionalTeam();
        $order = array("tiny_name_professional_team asc");
        $teams = $modelProfessionalTeam->fetchAll(null, $order);
        
        if ($teams->count() > 0) {
            foreach ($teams as $team) {
                $populate[$team->id_professional_team] = $team->tiny_name_professional_team . " ( " . $team->name_country . " )";
            }
        } else {
            $populate[''] = "Nenhuma equipe";
        }
                
        return $populate;
    }

    /**
     * 
     * @return array
     */
    public static function listPositionsPlayer() {
        $populate = array('' => 'Selecione...');
                
        $modelPositionPlayer = new Model_PositionPlayer();
        $positions = $modelPositionPlayer->fetchAll();
        
        foreach ($positions as $position) {
            $populate[$position->id_position_player] = $position->description_position_player;
        }
        
        return $populate;
    }
    
    /**
     * 
     * @return array
     */
    public static function listFootPlayer() {
        $populate = array('' => 'Selecione...');
                
        $populate['D'] = "Direito";
        $populate['E'] = "Esquerdo";
        $populate['A'] = "Ambi-destro";
        
        return $populate;
    }
    
    public static function getAtributes() {
        $populate = array('' => 'Selecione...');
                        
        $modelAtribute = new Model_Atribute();
        $where = $modelAtribute->getAdapter()->quoteInto("active_atribute = ?", 1);
        $order = array("name_atribute asc");
        $atributes = $modelAtribute->fetchAll($where, $order);
        
        foreach ($atributes as $atribute) {
            $populate[$atribute->id_atribute] = " " . $atribute->name_atribute;
        }
        
        return $populate;
    }
        
}
