/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.ListaEstu;
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
public class ListaEstudiantes {
    Connection conn;
    
    public ListaEstudiantes(){
        conexion con = new conexion();
        this.conn = con.getcn();
    }
    
    public List<ListaEstu> ListEstudiantes(String correo){
        List<ListaEstu> listaEstudiante = new ArrayList<>();
        try{
            Statement stmt = this.conn.createStatement();
            String query = "SELECT E.nombre, E.Apellido, E.correo, E.cedula, E.Cod_Grupo FROM estudiante AS E \n" +
                            "JOIN grupo AS G on E.Cod_Grupo = G.cod_grupo where G.correo = '"+correo+"'";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                ListaEstu datos = new ListaEstu();
                datos.setNombre(result.getString("nombre"));
                datos.setApellido(result.getString("apellido"));
                datos.setCorreo(result.getString("correo"));
                datos.setCedula(result.getString("cedula"));
                datos.setIdgrupo(result.getString("Cod_Grupo"));
                
                listaEstudiante.add(datos);
            }
            return listaEstudiante;
        } catch (Exception ex) {
            Logger.getLogger(ListaEstudiantes.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaEstudiante;
    }
}
