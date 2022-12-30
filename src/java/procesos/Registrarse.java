/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kenet
 */
public class Registrarse {

    Connection conn;

    public Registrarse() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }

    public int RegistroMaestro(String Nombre, String Apellido, String Cedula, String Email, String Password, String estudios) {
        try {
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO maestro(contraseña, correo,nombre,apellido,cedula,estud_didact) VALUES\n"
                    + "('" + Password + "','" + Email + "','" + Nombre + "','" + Apellido + "','" + Cedula + "','" + estudios + "')";
            int result = stmt.executeUpdate(query);
            if(result > 0){
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int RegistroEstudiante(String Nombre, String Apellido, String Cedula, String Email, String Password, String codigo) {
        try {
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO estudiante(contraseña, correo,nombre,apellido,cedula,Cod_Grupo) VALUES\n"
                    + "('" + Password + "','" + Email + "','" + Nombre + "','" + Apellido + "','" + Cedula + "','" + codigo + "')";
            int result = stmt.executeUpdate(query);
            if(result > 0){
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(cambiarDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int ValidarCedula(String cedula) {
        int valido = 0;
        try {
            Statement stmt = conn.createStatement();
            String query = "select maestro.correo,estudiante.correo from maestro, estudiante \n"
                    + "where maestro.cedula= '"+cedula+"' or estudiante.cedula ='"+cedula+"'";
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
