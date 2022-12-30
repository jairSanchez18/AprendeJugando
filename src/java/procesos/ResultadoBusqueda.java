/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.Resultados;
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
public class ResultadoBusqueda {

    Connection conn;

    public ResultadoBusqueda() {
        conexion con = new conexion();
        this.conn = con.getcn();
    }

    public List<Resultados> ObtenerResultado(String busqueda) {
        List<Resultados> resultado = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT contenido, tema FROM tema WHERE contenido LIKE '"+busqueda+"'";

            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                Resultados resultados = new Resultados();

                resultados.setObtenerResultados(result.getString("contenido"));
                resultados.setTituloTema(result.getString("tema"));

                resultado.add(resultados);
            }
            return resultado;
        } catch (Exception ex) {
            Logger.getLogger(ResultadoBusqueda.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
