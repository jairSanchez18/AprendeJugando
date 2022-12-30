/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kenet
 */
public class login {

    Connection conn;

    public login() {
        conexion con = new conexion();
        this.conn = con.getcn();

    }

    public int LoginEstudiante(String user, String pass) {
        int id = 0;
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM estudiante WHERE correo = '" + user + "' AND contraseña = '" + pass + "'";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                id = 1;
            }
            return id;
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int LoginMaestro(String user, String pass) {
        int id = 0;
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM maestro WHERE correo = '" + user + "' AND contraseña = '" + pass + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                id = 2;
            }
            return id;
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
}
