/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.implementacion;

import comun.ConectarDB;
import comun.Parametros;
import dao.DaoUsuario;
import dto.dtoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Lenovo
 */
public class ODUsuario implements DaoUsuario {

    Connection cn = null;
    CallableStatement cs = null;
    ResultSet rs = null;

    private Connection getConnection() {
        ConectarDB dB = new ConectarDB();
        return dB.getConnection();
    }

    @Override
    public boolean existeUsuario(String usuario) throws Exception {

        boolean retorno = false;
        try {
            cn = getConnection();
            cs = cn.prepareCall("begin ? := SF_URP_GET_USUARIO(?,?,?,?,?,?); end;");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setString(2, "A");
            cs.setString(3, usuario);
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                int cantidad = rs.getInt(1);
                if (cantidad == 1) {
                    retorno = true;
                }
            }

        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
        } finally {
            rs.close();
            cs.close();
            cn.close();
        }
        return retorno;
    }

    @Override
    public dtoUsuario verificaClave(String usuario, String clave) throws Exception {
        dtoUsuario dtoUsuario = new dtoUsuario();
        try {
            cn = getConnection();
            cs = cn.prepareCall("begin ? := SF_URP_GET_USUARIO(?,?,?,?,?,?); end;");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setString(2, "B");
            cs.setString(3, usuario);
            cs.setString(4, clave);
            cs.setString(5, "");
            cs.setString(6, "");
            cs.setString(7, "");
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                dtoUsuario.setCU_CODIGO(rs.getString(1));
                dtoUsuario.setCU_PASSWORD(rs.getString(2));
                dtoUsuario.setCP_DNI(rs.getString(3));
                dtoUsuario.setDU_FECHA_ALTA(rs.getString(4));
                dtoUsuario.setCU_SITUACION(rs.getString(5));
                dtoUsuario.setCTU_CODIGO(rs.getString(6));
                dtoUsuario.setCU_USUARIO(rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
        } finally {
            rs.close();
            cs.close();
            cn.close();
        }
        return dtoUsuario;
    }

}
