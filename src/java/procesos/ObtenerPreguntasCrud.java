/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.PreguntasCrud;
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
public class ObtenerPreguntasCrud {
    private Connection conn;
    
    public ObtenerPreguntasCrud(){
        conexion con = new conexion();
        this.conn = con.getcn();
    }
    
    public List<PreguntasCrud> GuardarPreguntas(){
        List<PreguntasCrud> preguntas = new ArrayList<>();
        try{
            Statement stmt = this.conn.createStatement();
            String query = "SELECT T.tema, P.pregunta, P.cod_pregunta FROM tema as T join pregunta as P on T.cod_tema = P.cod_tema";
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                PreguntasCrud preg = new PreguntasCrud();
                preg.setTema(result.getString("tema"));
                preg.setPregunta(result.getString("pregunta"));
                preg.setCod_pregunta(result.getString("cod_pregunta"));
                preguntas.add(preg);
            }
            return preguntas;
        } catch (Exception ex) {
            Logger.getLogger(ObtenerPreguntasCrud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return preguntas;
    }
}
