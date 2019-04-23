/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.implementacion.ODFactory;

/**
 *
 * @author Christian
 */
public abstract class DaoFactory {

    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;

public abstract DaoUsuario getDaoUsuario();
public abstract DaoTipoConferencia getDaoTipoConferencia();
    
    public static DaoFactory getDaoFactory(int whichFactory) {

        switch (whichFactory) {
            case MYSQL:
                return null;
            case ORACLE:
                return new ODFactory();
            default:
                return null;
        }

    }

}
