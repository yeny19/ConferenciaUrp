/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implementacion;

import comun.ConectarDB;
import comun.Parametros;
import dao.DaoSeccionConferencia;
import dto.dtoSeccionConferencia;
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
public class ODSeccionConferencia implements DaoSeccionConferencia {

    Connection cn = null;
    CallableStatement cs = null;
    ResultSet rs = null;

    private Connection getConnection() {
        ConectarDB dB = new ConectarDB();
        return dB.getConnection();
    }

    @Override
    public Collection ListarSeccionConferencia(String codigoTC) throws SQLException {
        Collection listaTC = new ArrayList();
        try {
            cn = getConnection();
            cs = cn.prepareCall("begin ? := SF_URP_GET_SECCION_CONFERENCIA(?,?,?,?,?,?); end;");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setString(2, "B");
            cs.setString(3, codigoTC);
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                dtoSeccionConferencia dtoSC = new dtoSeccionConferencia();
                dtoSC.setCSCONF_CODIGO(rs.getString(1));
                dtoSC.setVSCONF_DESLARGA(rs.getString(2));
                dtoSC.setCTCONF_CODIGO(rs.getString(3));
                listaTC.add(dtoSC);
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
}
