/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.dtoTipoConferencia;
import java.sql.SQLException;
import java.util.Collection;

/**
 *
 * @author Lenovo
 */
public interface DaoTipoConferencia {

    public abstract Collection ListaTipoConferencia() throws Exception;
    public abstract int CountTipoConferencia() throws Exception;
    public abstract int insertarTipoEncuesta(dtoTipoConferencia dtoTC) throws SQLException;

    //public abstract dtoUsuario verificaClave(String usuario, String clave) throws Exception;
}
