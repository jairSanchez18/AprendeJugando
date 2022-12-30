/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author kenet
 */
public class DatosJugabilidad {

    public int getMedalla() {
        return medalla;
    }

    public void setMedalla(int medalla) {
        this.medalla = medalla;
    }

    public int getIntentos() {
        return intentos;
    }

    public void setIntentos(int intentos) {
        this.intentos = intentos;
    }

    public String getRespuestaCI() {
        return respuestaCI;
    }

    public void setRespuestaCI(String respuestaCI) {
        this.respuestaCI = respuestaCI;
    }

    public String getRespuestaEstu() {
        return respuestaEstu;
    }

    public void setRespuestaEstu(String respuestaEstu) {
        this.respuestaEstu = respuestaEstu;
    }

    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    public void setRetroalimentacion(String retroalimentacion) {
        this.retroalimentacion = retroalimentacion;
    }

    public String getOpcion_resp() {
        return opcion_resp;
    }

    public void setOpcion_resp(String opcion_resp) {
        this.opcion_resp = opcion_resp;
    }

    public String getCod_pregunta_resp() {
        return cod_pregunta_resp;
    }

    public void setCod_pregunta_resp(String cod_pregunta_resp) {
        this.cod_pregunta_resp = cod_pregunta_resp;
    }

    public String getCod_pregunta() {
        return cod_pregunta;
    }

    public void setCod_pregunta(String cod_pregunta) {
        this.cod_pregunta = cod_pregunta;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getCod_tema() {
        return cod_tema;
    }

    public void setCod_tema(String cod_tema) {
        this.cod_tema = cod_tema;
    }
    
    //pregunta
    private String cod_pregunta;
    private String pregunta;
    private String cod_tema;
    
    //respuesta
    private String opcion_resp;
    private String cod_pregunta_resp;
    
    //Validacion de respuesta
    private String respuestaCI;
    private String respuestaEstu;
    private String retroalimentacion;
    private int intentos;
    
    //medalla
    private int medalla;
}
