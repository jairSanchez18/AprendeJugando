/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.DatosM;
import entidades.Temas;
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
public class ObtenerDatosMaestro {

    Connection conn;

    public ObtenerDatosMaestro() {
        conexion con = new conexion();
        this.conn = con.getcn();

    }

    public List<DatosM> DatosMaestro(String correo) {
        DatosM datosm = new DatosM();
        List<DatosM> listaDatos = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM maestro WHERE correo = '" + correo + "'";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                datosm.setCorreo(result.getString("correo"));
                datosm.setNombre(result.getString("nombre"));
                datosm.setApellido(result.getString("apellido"));
                datosm.setCedula(result.getString("cedula"));
                datosm.setEstu_didac(result.getString("estud_didact"));

                listaDatos.add(datosm);
            }
            return listaDatos;
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDatos;
    }
}
