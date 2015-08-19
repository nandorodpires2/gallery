<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Title
 *
 * @author Fernando Rodrigues
 */
class Plugin_Title extends Zend_Controller_Plugin_Abstract {
    
    public function preDispatch(Zend_Controller_Request_Abstract $request) {
        
        $module = $request->getModuleName();
        $controller = $request->getControllerName();
        $action = $request->getActionName();
        
        $flashMessenger = Zend_Controller_Action_HelperBroker::getExistingHelper('viewRenderer')->view;
        $flashMessenger->title = ucfirst($action);
        
    }
    
}
