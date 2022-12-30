/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.PreguntasCrud;
import entidades.Ranking;
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
public class ObtenerRanking {

    private Connection conn;

    public ObtenerRanking() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }

    public List<Ranking> ListaRanking() {
        int cont=0;
        List<Ranking> listaranking = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "select E.nombre, E.apellido, sum(puntos_obtenidos), E.correo from contestan\n"
                    + "join estudiante as E on contestan.correo=e.correo group by contestan.correo, E.nombre, E.apellido, E.correo order by sum(puntos_obtenidos) Desc";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                cont=cont+1;
                Ranking ranking = new Ranking();
                ranking.setNombre(result.getString("nombre"));
                ranking.setApellido(result.getString("apellido"));
                ranking.setPuntos(result.getInt(3));
                ranking.setCorreo(result.getString("correo"));
                ranking.setContador(cont);
                
                listaranking.add(ranking);
            }
            return listaranking;
        } catch (Exception ex) {
            Logger.getLogger(ObtenerPreguntasCrud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaranking;
    }

    public List<Ranking> TopTres() {
        List<Ranking> top = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "select top(3) E.nombre, E.apellido, sum(puntos_obtenidos) from contestan\n"
                    + "join estudiante as E on contestan.correo=e.correo group by contestan.correo, E.nombre, E.apellido order by sum(puntos_obtenidos) Desc";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                Ranking ranking = new Ranking();
                ranking.setNombreT(result.getString("nombre"));
                ranking.setApellidoT(result.getString("apellido"));

                top.add(ranking);
            }
            return top;
        } catch (Exception ex) {
            Logger.getLogger(ObtenerPreguntasCrud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return top;
    }
}
