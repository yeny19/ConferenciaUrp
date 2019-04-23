/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Christian
 */
public class ConectarDB {

    public ConectarDB() {
    }

    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (ClassNotFoundException e) {
            System.out.println(
                    "Proyecto: "
                    + Parametros.S_APP_NOMBRE
                    + "; Clase: "
                    + "sagde.comun.OracleDBConn"
                    + "; Mensaje:"
                    + e);

        }
    }

    /**
     * Obtiene una conexión a la Base de Datos.
     *
     * @return
     */
    public Connection getConnection() {

        Connection connection = null;
        try {

            connection = DriverManager.getConnection(
                   
            "jdbc:oracle:thin:@10.64.3.24:1522:BDEP","EP_ANGULAR", "angular2019");

        } catch (SQLException e) {
            System.out.println(
                    "Proyecto: "
                    + Parametros.S_APP_NOMBRE
                    + "; Clase: "
                    + getClass().getName()
                    + "; Mensaje:"
                    + e);

        }
        return connection;
    }
}
