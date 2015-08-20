<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ExposicaoController
 *
 * @author Fernando Rodrigues
 */
class Site_ExposicaoController extends Gallery_Controller_Action {
    
    public function init() {
        
    }
    
    public function indexAction() {
        
    }
    
    public function addAction() {
        
        if (!$this->has_auth) {
            //$this->_redirect("auth/");
        }
        
        $form = new Form_Exposicao_Add();
        $form->submit->setLabel("Cadastrar Exposição");
        $form->exposicao_capa->setAttrib('class', '');
        $this->view->form = $form;
        
        if ($this->getRequest()->isPost()) {
            if ($form->isValid($this->getRequest()->getPost())) {
                $post = $form->getValues();
              
                /** @todo retirar este trecho quando ja estiver autenticando **/
                $post['usuario_id'] = 1;
                
                try {
                    $modelExposicao = new Model_DbTable_Exposicao();
                    $exposicao_id = $modelExposicao->insert($post);
                    
                    $this->_redirect("/exposicao/add-item/exposicao/" . $exposicao_id);
                    
                } catch (Exception $ex) {
                    /**
                     * @todo Setar mensagem de erro
                     */
                    die($ex->getMessage());
                }
                
            }
        }
        
    }
    
    public function addItemAction() {
        $exposicao_id = $this->getRequest()->getParam('exposicao');
        $usuario_id = 1; //Zend_Auth::getInstance()->getIdentity()->usuario_id;
        
        // busca dados da exposicao
        $modelExposicao = new Model_DbTable_Exposicao();
        $exposicao = $modelExposicao->getById($exposicao_id);
        
        if (!$exposicao || $exposicao->usuario_id !== $usuario_id) {
            throw new Exception("Exposição não encontrada!");
        }        
        
    }

    public function openAction() {
        $exposicao_id = $this->getRequest()->getParam("exposicao");
        
        if (!$exposicao_id) {
            throw new Exception("Exposição não encontrada!");
        }
        
        // registra a visualizacao
        $this->registerView($exposicao_id);
        
    }
    
    protected function registerView($exposicao_id) {
        
        // busca dados da exposicao
        $modelExposicao = new Model_DbTable_Exposicao();
        $exposicao = $modelExposicao->getById($exposicao_id);
        
        $dados = array(
            'exposicao_id' => $exposicao_id,
            'usuario_id' => $exposicao->usuario_id
        );
        
        try {
            $modelExposicaoVisualizacao = new Model_DbTable_ExposicaoVisualizacao();        
            $modelExposicaoVisualizacao->insert($dados);
        } catch (Exception $ex) {
            die('nao registrou - ' . $ex->getMessage());
        }        
        
    }
    
}
