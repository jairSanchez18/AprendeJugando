/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.DatosJugabilidad;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kenet
 */
public class Jugabilidad {

    Connection conn;

    public Jugabilidad() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }

    public List<DatosJugabilidad> Preguntas(String cod_tema, int numpregunta) {
        List<DatosJugabilidad> pregunta = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM pregunta WHERE cod_tema = '" + cod_tema + "' AND contador = '" + numpregunta + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                DatosJugabilidad datos = new DatosJugabilidad();
                datos.setCod_pregunta(result.getString("cod_pregunta"));
                datos.setPregunta(result.getString("pregunta"));
                datos.setCod_tema(result.getString("cod_tema"));

                pregunta.add(datos);
            }
            return pregunta;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pregunta;
    }

    public List<DatosJugabilidad> Respuestas(String cod_tema, String cod_preg) {
        List<DatosJugabilidad> respuesta = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "select respuesta.cod_pregunta,opcion_resp, respuesta from respuesta \n"
                    + "join pregunta on respuesta.cod_pregunta = pregunta.cod_pregunta \n"
                    + "where pregunta.cod_tema = '" + cod_tema + "' and respuesta.cod_pregunta='" + cod_preg + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                DatosJugabilidad datos = new DatosJugabilidad();
                datos.setOpcion_resp(result.getString("opcion_resp"));
                datos.setCod_pregunta_resp(result.getString("cod_pregunta"));
                respuesta.add(datos);
            }
            return respuesta;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return respuesta;
    }

    public int ValidarRespuesta(String respuesta) {
        int correcta = 0;
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM respuesta WHERE opcion_resp = '" + respuesta + "' AND respuesta = 'Correcta'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                correcta = 1;
            }
            return correcta;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return correcta;
    }

    public String RetroAlimentacion(String respuesta) {
        DatosJugabilidad datos = new DatosJugabilidad();
        String retro = " ";
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM respuesta WHERE opcion_resp = '" + respuesta + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                datos.setRetroalimentacion(result.getString("retroalimentacion"));
            }
            retro = datos.getRetroalimentacion();
            return retro;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retro;
    }

    public String Cod_preg(String respuesta) {
        DatosJugabilidad datos = new DatosJugabilidad();
        String codigo = " ";
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT cod_pregunta FROM respuesta WHERE opcion_resp = '" + respuesta + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                datos.setCod_pregunta(result.getString("cod_pregunta"));
            }
            codigo = datos.getCod_pregunta();
            return codigo;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return codigo;
    }

    public void Puntos(int puntos, String correo, String cod_preg) {
        try {
            Statement stmt = this.conn.createStatement();
            String query = "INSERT INTO contestan (correo, cod_pregunta, puntos_obtenidos, fecha)\n"
                    + "VALUES('" + correo + "','" + cod_preg + "','" + puntos + "',SYSDATETIME())";

            stmt.executeUpdate(query);
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int ValidarRealizacionTest(String cod_tema, String correo) {
        int validar = 0;
        DatosJugabilidad djug = new DatosJugabilidad();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "select count(*) from contestan as C\n"
                    + "join pregunta as P on C.cod_pregunta = P.cod_pregunta \n"
                    + "where cod_tema = '" + cod_tema + "' and C.correo= '" + correo + "'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                djug.setIntentos(result.getInt(1));
            }
            validar = djug.getIntentos();

            return validar;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return validar;
    }

    public int CalcularMedallas(String cod_tema, String correo) {
        int validar = 0;
        DatosJugabilidad djug = new DatosJugabilidad();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "select sum(puntos_obtenidos) from contestan as C\n"
                    + "join pregunta AS P on C.cod_pregunta =	P.cod_pregunta\n"
                    + "join tema as T on P.cod_tema = T.cod_tema where T.cod_tema = '"+cod_tema+"' and correo = '"+correo+"'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                djug.setMedalla(result.getInt(1));
            }
            validar = djug.getMedalla();

            return validar;
        } catch (Exception ex) {
            Logger.getLogger(Jugabilidad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return validar;
    }
}
