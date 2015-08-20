<?php

class Site_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        
    }

    public function indexAction()
    {
        $modelExposicao = new Model_DbTable_Exposicao();
        $where = "exposicao_ativo = 1";
        $order = "exposicao_data_criacao desc";
        $limit = 3;
        $exposicoes = $modelExposicao->fetchAll($where, $order, $limit);        
        $this->view->exposicoes = $exposicoes;
    }

}

