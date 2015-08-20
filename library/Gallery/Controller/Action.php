<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Action
 *
 * @author Fernando Rodrigues
 */
class Gallery_Controller_Action extends Zend_Controller_Action {
    
    protected $has_auth;    

    public function init() {
        
        $this->has_auth = Zend_Auth::getInstance()->getIdentity();        
        parent::init();
    }
    
}
