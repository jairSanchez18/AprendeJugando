/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.DatosE;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kenet
 */
public class ObtenerDatosEstudiante {
    Connection conn;

    public ObtenerDatosEstudiante() {
        conexion con = new conexion();
        this.conn = con.getcn();

    }

    public List<DatosE> DatosEstudiante(String correo) {
        DatosE datose = new DatosE();
        List<DatosE> listaDatos = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM estudiante WHERE correo = '" + correo + "'";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                datose.setCorreo(result.getString("correo"));
                datose.setNombre(result.getString("nombre"));
                datose.setApellido(result.getString("apellido"));
                datose.setCedula(result.getString("cedula"));

                listaDatos.add(datose);
            }
            return listaDatos;
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDatos;
    }
    
    public List<DatosE> OtrosDatosEstudiante(String correo) {
        DatosE datose = new DatosE();
        List<DatosE> listaDatos = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "EXEC GrupoEstudiante @correo = '"+correo+"'";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                datose.setNombreMaestro(result.getString("nombre"));
                datose.setApellidoMaestro(result.getString("apellido"));
                datose.setGrupoEstudiante(result.getString("nivel"));

                listaDatos.add(datose);
            }
            return listaDatos;
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDatos;
    }
}
