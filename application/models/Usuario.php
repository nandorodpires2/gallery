<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Usuario
 *
 * @author Fernando Rodrigues
 */
class Model_Usuario {

    public function __construct($row) {
        if (!$row instanceof Zend_Db_Table_Row) {
            throw new Exception("Row must be an instance of Zend_Db_Table_Row");
        }
        
        foreach ($row as $key => $value) {
            $this->$key = $value;
        }
    }
    
}
