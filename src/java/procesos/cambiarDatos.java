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
public class cambiarDatos {

    Connection conn;

    public cambiarDatos() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }

    //CAMBIO DE CONTRASEÑAS
    public int cambiarContraseñaEstudiante(String correo, String contraseña) {
        int valido = 0;
        try {
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM estudiante WHERE correo = '" + correo + "' AND contraseña = '" + contraseña + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                valido = 1;
            }
            return valido;
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valido;
    }

    public int cambiarContraseñaMaestro(String correo, String contraseña) {
        int valido = 0;
        try {
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM maestro WHERE correo = '" + correo + "' AND contraseña = '" + contraseña + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                valido = 2;
            }
            return valido;
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valido;
    }

    public int nuevaEstudiante(String correo, String contraseña) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE estudiante SET contraseña = '" + contraseña + "' WHERE correo = '" + correo + "'";
            int result = stmt.executeUpdate(query);
            if(result > 0){
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int nuevaMaestro(String correo, String contraseña) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE maestro SET contraseña = '" + contraseña + "' WHERE correo = '" + correo + "'";
            int result = stmt.executeUpdate(query);
            if(result > 0){
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //CAMBIAR CORREOS ELECTRONICOS
    public int ValidarCorreo(String correo) {
        int valido = 0;
        try {
            Statement stmt = conn.createStatement();
            String query = "select maestro.correo,estudiante.correo from maestro, estudiante \n"
                    + "where maestro.correo= '"+correo+"' or estudiante.correo ='"+correo+"'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                valido = 1;
            }
            return valido;
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valido;
    }
    
    public void CorreoEstudiante(String correo, String correoNuevo) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE estudiante SET correo = '" + correoNuevo + "' WHERE correo = '" + correo + "'";
            stmt.executeUpdate(query);
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void CorreoMaestro(String correo, String correoNuevo) {
        try {
            Statement stmt = conn.createStatement();
            String query = "UPDATE maestro SET correo = '" + correoNuevo + "' WHERE correo = '" + correo + "'";
            stmt.executeUpdate(query);
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int NuevoGrupo(String correo, String grupo) {
        try {
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO grupo (correo,nivel) VALUES ('" + correo + "', '" + grupo + "')";
            int result = stmt.executeUpdate(query);
            if(result > 0){
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int ValidarGrupo(String Grupo, String correo) {
        int valido = 0;
        try {
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM grupo WHERE correo = '"+correo+"' AND nivel = '"+Grupo+"'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                valido = 1;
            }
            return valido;
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valido;
    }
}
