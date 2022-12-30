/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.io.InputStream;
import java.util.LinkedList;

/**
 *
 * @author kenet
 */
public class Temas{

    
    private String cod_tema;
    private String tema;
    private String contenido;
      
    
    public String getCod_tema() {
        return cod_tema;
    }

    public void setCod_tema(String cod_tema) {
        this.cod_tema = cod_tema;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
