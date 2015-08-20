<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Exposicao
 *
 * @author Fernando Rodrigues
 */
class Model_Exposicao {
    
    public $usuario;
    public $tipo_exposicao;

    public $exposicao_data_criacao;
    
    protected $visualizacoes = 0;

    public function __construct(Zend_Db_Table_Row $row) {
        
        if (!$row instanceof Zend_Db_Table_Row) {
            throw new Exception("Row must be an instance of Zend_Db_Table_Row");
        }
                 
        foreach ($row as $key => $value) {
            $this->$key = $value;
        }
        
        $this->set_exposicao_data_criacao($this->exposicao_data_criacao);
        
        $this->set_usuario($this->usuario_id);
        $this->set_tipo_exposicao($this->tipo_exposicao_id);
        
    }
        
    public function set_exposicao_data_criacao($exposicao_data_criacao, $format = Zend_Date::DATE_MEDIUM) {
        
        $zendDate = new Zend_Date($exposicao_data_criacao);
        
        $this->exposicao_data_criacao = $zendDate->get($format);
        return $this;
    }
        
    public function set_usuario($usuario_id) {
        
        $modelUsuario = new Model_DbTable_Usuario();
        $usuario = $modelUsuario->getById($usuario_id);
        
        $this->usuario = $usuario;
        return $this;
    }

    public function set_tipo_exposicao($tipo_exposicao_id) {
        
        $modelTipoExposicao = new Model_DbTable_TipoExposicao();
        $tipo_exposicao = $modelTipoExposicao->getById($tipo_exposicao_id);
        
        $this->tipo_exposicao = $tipo_exposicao;
        return $this;
    }

    public function get_visualizacoes() {
        
        $modelExposicaoVisualizacao = new Model_DbTable_ExposicaoVisualizacao();        
        $visualizacoes = $modelExposicaoVisualizacao->getVisualizacoesExposicao($this->exposicao_id);   
        
        $text = $visualizacoes == 1 ? $visualizacoes . ' Visualização' : $visualizacoes . ' Visualizações';
        
        $this->visualizacoes = $text;
        return $this->visualizacoes;
    }
    
}
