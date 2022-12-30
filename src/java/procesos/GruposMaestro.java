/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import entidades.Grupos;
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
public class GruposMaestro {

    Connection conn;

    public GruposMaestro() {
        conexion con = new conexion();
        this.conn = con.getcn();

    }

    public List<Grupos> GrupoMaestro(String correo) {
        List<Grupos> grupo = new ArrayList<>();
        try {
            Statement stmt = this.conn.createStatement();
            String query = "SELECT * FROM grupo WHERE correo = '" + correo + "'";
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                Grupos grupos = new Grupos();
                grupos.setNivel(result.getString("nivel"));
                grupos.setCod_grupo(result.getString("cod_grupo"));
                grupos.setCorreo(result.getString("correo"));

                grupo.add(grupos);
            }
            return grupo;
        } catch (Exception ex) {
            Logger.getLogger(ObtenerTemas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grupo;
    }

    public int borrarGrupo(String correo, String codigo) {
        try {
            Statement stmt = this.conn.createStatement();
            String query = "DELETE FROM grupo WHERE correo = '" + correo + "' AND cod_grupo = '" + codigo + "'";
            int result = stmt.executeUpdate(query);
            if (result > 0) {
                return 1;
            }
        }catch (SQLException ex) {
            Logger.getLogger(GruposMaestro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
