/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.sql.Connection;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kenet
 */
public class CrearSesion {
    
    Connection conn;

    public CrearSesion() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }
    
    public void CrearSesionMaestro(String correo, String contraseña) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE maestro SET contraseña = '" + contraseña + "' WHERE correo = '" + correo + "'";
            stmt.executeUpdate(query);
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void CrearSesionEstudiante(String correo, String contraseña) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE estudiante SET contraseña = '" + contraseña + "' WHERE correo = '" + correo + "'";
            stmt.executeUpdate(query);
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
