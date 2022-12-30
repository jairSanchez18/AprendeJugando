/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.Temas;
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
public class ObtenerTemas {
    private Connection conn;
    
    public ObtenerTemas(){
        conexion con = new conexion();
        this.conn = con.getcn();
    }
    
    public List<Temas> GuardarTemas(){
        List<Temas> tema = new ArrayList<>();
        try{ 
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM tema";
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Temas temas = new Temas();
                temas.setCod_tema(result.getString("cod_tema"));
                temas.setTema(result.getString("tema"));
                temas.setContenido(result.getString("contenido"));
                tema.add(temas);
            }
            return tema;
        } catch (Exception ex) {
            Logger.getLogger(ObtenerTemas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tema;
    }
}
