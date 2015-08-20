<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Rowset
 *
 * @author Fernando Rodrigues
 */
class Gallery_Model_Rowset extends Zend_Db_Table_Abstract {
    
    protected $row = array();

    public function fetchAll($where = null, $order = null, $count = null, $offset = null) {                
        $rowset = parent::fetchAll($where, $order, $count, $offset);                
        return $this->setInstanceOf($rowset);
    }
    
    public function getById($id) {
        $where = $this->getAdapter()->quoteInto($this->_primary . " = ?", $id);
        return $this->fetchRow($where);
    }
    
    public function execute($select) {        
        return parent::fetchAll($select);        
    }

    protected function setInstanceOf(Zend_Db_Table_Rowset $rowset) {
        
        if (!$rowset instanceof Zend_Db_Table_Rowset) {
            throw new Exception("Rowset must be an instance of Zend_Db_Table_Rowset");
        }
        
        $tableClass = $rowset->getTableClass();
        $tableClass = str_replace('_DbTable_', '_', $tableClass);
        
        foreach ($rowset as $row) {       
            
            if (!class_exists($tableClass)) {
                throw new Exception("Class {$tableClass} not existis!");
            }
            
            $this->row[] = new $tableClass($row);
        }
        
        return $this->row;
        
    }
    
}
