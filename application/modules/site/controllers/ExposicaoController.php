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
        
        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery.blockUI.js'));
        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery-ui.js'));
        //$this->view->headScript()->appendFile($this->view->baseUrl('/javascripts/jquery.maskedinput.js'));
        $this->view->headScript()->appendFile($this->view->baseUrl('views/js/site/exposicao/add.js'));        
        
    }
    
    public function indexAction() {
        
    }
    
    public function addAction() {
        
        if (!$this->has_auth) {
            //$this->_redirect("auth/");
        }
        
        $crop_width = Zend_Registry::get("config")->images->exposicao->capa->crop->width;
        $crop_height = Zend_Registry::get("config")->images->exposicao->capa->crop->height;
        
        $form = new Form_Exposicao_Add();
        
        /* hidden */
        $form->addElement('hidden', 'exposicao_capa_temp', array(
            'id' => 'exposicao_capa_temp',
            'decorators'=>array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'span')),
            )
        ));
        $form->addElement('hidden', 'x', array(
            'decorators'=>array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'span')),
            )
        ));
        
        $form->addElement('hidden', 'y', array(
            'decorators'=>array(
            'ViewHelper',
            array('HtmlTag', array('tag' => 'span')),
            )
        ));

        $form->addElement('hidden', 'scale', array(
            'decorators'=>array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'span')),
            )
        ));        
        
        $form->submit->setLabel("Cadastrar Exposição");        
        $this->view->form = $form;
        
        if ($this->getRequest()->isPost()) {            
            $dadosForm = $this->getRequest()->getPost();            
            if ($form->isValid($this->getRequest()->getPost())) {                
              
                $this->upload($dadosForm['exposicao_capa_pre'], $dadosForm['x'], $dadosForm['y'], $dadosForm['scale'], $crop_width, $crop_height);
                
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
        
        $this->view->headLink()->appendStylesheet('/views/css/jquery.guillotine/jquery.guillotine.css');
        $this->view->headLink()->appendStylesheet('/views/css/jquery.fileupload/jquery.fileupload.css');
        $this->view->headLink()->appendStylesheet('/views/css/exposicao/exposicao.css');

        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery.fileupload/vendor/jquery.ui.widget.js'));
        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery.fileupload/jquery.iframe-transport.js'));
        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery.fileupload/jquery.fileupload.js'));
        $this->view->headScript()->appendFile($this->view->baseUrl('/views/js/jquery.guillotine/jquery.guillotine.js'));
        
        
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
    
    private function upload($arquivo, $x, $y, $scale, $w = 300, $h = 170) { 
        $fonte = Zend_Registry::get('config')->path->images->exposicao->capa->temp . $arquivo;
        $saida = Zend_Registry::get('config')->path->images->exposicao->capa . $arquivo;

        $options = array("resizeUp" => true, "jpegQuality" => 100);
        $thumb = PhpThumb_PhpThumbFactory::create($fonte, $options);
        $dimensions = $thumb->getCurrentDimensions();
        $cw = $dimensions["width"];
        $ch = $dimensions["height"];
        $fw = $scale * $cw;
        $fh = $scale * $ch;
        
        $thumb->resize($fw, $fh);
        $thumb->crop($x, $y, $w, $h);
        $thumb->save($saida);
    }
    
    /**
     * upload 
     */
    public function uploadCapaTempAction() {
        
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        
        //Zend_Debug::dump(); die();
        
        $patharquivo = Zend_Registry::get('config')->path->images->exposicao->temp;
        
        try { 
            $upload = new Plugin_UploadHash("files", $patharquivo);
            if ($upload->upload()) {                
                echo json_encode(array("arquivo" => $upload->filehash));
                exit;
            } else {
                echo json_encode(array("error" => $upload->filename));
            }
        } catch (Exception $e) {
            echo json_encode(array("error" => $e->getMessage()));
        }
        
    }
    
    
}
