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
class Form_Exposicao_Add extends Gallery_Form_Form {
    
    public function init() {
        
        $this->setAttribs(array(
            'id' => 'form-exposicao-add'
        ));
        
        // exposicao_nome
        $exposicao_nome = new Zend_Form_Element_Text("exposicao_nome");        
        $exposicao_nome->setLabel("Nome da Exposição:");
        $exposicao_nome->setAttrib('placeholder', 'Digite o nome de sua exposição');
        $exposicao_nome->setRequired();
        
        //exposicao_descricao        
        $exposicao_descricao = new Zend_Form_Element_Textarea("exposicao_descricao");        
        $exposicao_descricao->setLabel("Descrição da Exposição:");
        $exposicao_descricao->setAttrib('placeholder', 'Conte aos usuários sobre sua exposição');
        $exposicao_descricao->setAttrib('rows', 10);
        $exposicao_descricao->setRequired();
        
        // tipo_exposicao_id
        $tipo_exposicao_id = new Zend_Form_Element_Select("tipo_exposicao_id");
        $tipo_exposicao_id->setLabel("Categoria da Exposição:");
        $tipo_exposicao_id->setMultiOptions($this->getTipoExposicao());
        
        //exposicao_capa
        $exposicao_capa = new Zend_Form_Element_File("exposicao_capa");
        $exposicao_capa->setLabel("Selecione a capa:");
                
        // add elements
        $this->addElement($exposicao_nome);        
        $this->addElement($exposicao_descricao);   
        $this->addElement($tipo_exposicao_id);
        $this->addElement($exposicao_capa);                
        
        parent::init();
        
    }
    
    protected function getTipoExposicao() {
        
        $options = array('' => 'Selecione a categoria');
        
        $modelTipoExposicao = new Model_DbTable_TipoExposicao();        
        $tipos = $modelTipoExposicao->fetchAll(null, "tipo_exposicao ASC");                
        
        foreach ($tipos as $tipo) {
            $options[$tipo->tipo_exposicao_id] = $tipo->tipo_exposicao;
        }
        
        return $options;
    }
    
}
