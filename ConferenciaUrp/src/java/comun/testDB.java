/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comun;

import java.sql.SQLException;

/**
 *
 * @author Christian
 */
public class testDB {

    public static void main(String[] args) throws SQLException {

        ConectarDB conectarDB = new ConectarDB();
        if (conectarDB.getConnection() == null) {
            System.out.println(" no correcto");
        } else {
            System.out.println("correcto");
        }
    }
}
