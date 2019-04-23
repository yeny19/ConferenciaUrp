/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implementacion;

import comun.ConectarDB;
import comun.Parametros;
import dao.DaoTipoConferencia;
import dto.dtoTipoConferencia;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Lenovo
 */
public class ODTipoConferencia implements DaoTipoConferencia {

    Connection cn = null;
    CallableStatement cs = null;
    ResultSet rs = null;

    private Connection getConnection() {
        ConectarDB dB = new ConectarDB();
        return dB.getConnection();
    }

    @Override
    public Collection ListaTipoConferencia() throws Exception {

        Collection listaTC = new ArrayList();
        try {
            cn = getConnection();
            cs = cn.prepareCall("begin ? := SF_URP_GET_TIPO_CONFERENCIA(?,?,?,?,?,?); end;");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setString(2, "B");
            cs.setString(3, "");
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                dtoTipoConferencia dtoTC = new dtoTipoConferencia();
                dtoTC.setCTCONF_CODIGO(rs.getString(1));
                dtoTC.setVTCONF_DESLARGA(rs.getString(2));
                listaTC.add(dtoTC);
            }

        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
            
        } finally {
            rs.close();
            cs.close();
            cn.close();
        }
        return listaTC;
    }

    @Override
    public int CountTipoConferencia() throws Exception {
        int countTC = 0;
        try {
            cn = getConnection();
            cs = cn.prepareCall("begin ? := SF_URP_GET_TIPO_CONFERENCIA(?,?,?,?,?,?); end;");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setString(2, "A");
            cs.setString(3, "");
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                countTC = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
        } finally {
            rs.close();
            cs.close();
            cn.close();
        }
        return countTC;
    }

    @Override
    public int insertarTipoConferencia(dtoTipoConferencia dtoTC) throws SQLException {
        int retorno = 0;
        try {
            cn = getConnection();
            cs = cn.prepareCall("{call SP_URP_TIPO_CONFERENCIA(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, "A");
            cs.setString(2, dtoTC.getVTCONF_DESLARGA());
            cs.setString(3,"");
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.setString(8, "");
            cs.setString(9, "");
            cs.setString(10, "");
            cs.setString(11, "");
            retorno = cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
        } finally {
            cs.close();
            cn.close();
        }
        return retorno;

    }
}
