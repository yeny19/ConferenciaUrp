/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.dtoUsuario;

/**
 *
 * @author Lenovo
 */
public interface DaoUsuario {

    public abstract boolean existeUsuario(String usuario) throws Exception;

    public abstract dtoUsuario verificaClave(String usuario, String clave) throws Exception;
}
