/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

/**
 *
 * @author Lenovo
 */
public interface DaoSeccionConferencia {
    public abstract Collection ListarSeccionConferencia(String codigoTC) throws SQLException;
    
}
