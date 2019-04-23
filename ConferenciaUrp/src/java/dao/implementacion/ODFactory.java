/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implementacion;


import dao.DaoFactory;
import dao.DaoSeccionConferencia;
import dao.DaoTipoConferencia;
import dao.DaoUsuario;


/**
 *
 * @author Christian
 */
public class ODFactory extends DaoFactory{

    @Override
    public DaoUsuario getDaoUsuario() {
        return new ODUsuario();
    }

    @Override
    public DaoTipoConferencia getDaoTipoConferencia() {
        return new ODTipoConferencia();
    }

    @Override
    public DaoSeccionConferencia getDaoSeccionConferencia() {
       return  new ODSeccionConferencia();
    }
    
    

  
    
}
