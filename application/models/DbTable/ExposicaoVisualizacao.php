<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ExposicaoVisualizacao
 *
 * @author Fernando Rodrigues
 */
class Model_DbTable_ExposicaoVisualizacao extends Gallery_Model_Rowset {
    
    protected $_name = "exposicao_vizualizacao";
    protected $_primary = "exposicao_vizualizacao_id";
 
    public function getVisualizacoesExposicao($exposicao_id) {        
        $select = $this->select()->where("exposicao_id = ?", $exposicao_id);
        $rowset = $this->execute($select);
        return $rowset->count();
    }
    
}
