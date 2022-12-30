<%@page import="procesos.cambiarDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
<style>
    body{
        background: linear-gradient(to right, #2688F0, #7678ED);
    }
    .badG{
        background-image: url(../../images/biencontraseña.gif);
        background-position: center center;
    }
    .badG1{
        background-image: url(../../images/errorcontraseña.gif);
        background-position: center center;
    }
    .a{
        text-decoration: none;
        color: white;
    }
</style>

<%
    String corr = (String) session.getAttribute("userName");
    String contraseña = request.getParameter("contraActual");
    String contranueva = request.getParameter("contraNueva");
    cambiarDatos cambiar = new cambiarDatos();
    int estu = cambiar.cambiarContraseñaEstudiante(corr, contraseña);
    int maes = cambiar.cambiarContraseñaMaestro(corr, contraseña);
    if (estu == 1) {
        if (cambiar.nuevaEstudiante(corr, contranueva) == 1) {
            session.setAttribute("cambioHecho", 10);
            response.sendRedirect("../../perfil.jsp");
        } else {
            session.setAttribute("cambioNoHecho", 20);
            response.sendRedirect("../../perfil.jsp");
        }
%>

<%
} else if (maes == 2) {
    cambiar.cambiarContraseñaMaestro(corr, contranueva);
    if (cambiar.nuevaMaestro(corr, contranueva) == 1) {
        session.setAttribute("cambioHecho", 10);
        response.sendRedirect("../../perfil.jsp");
    } else {
        session.setAttribute("cambioNoHecho", 20);
        response.sendRedirect("../../perfil.jsp");
    }
%>
<%
    } else {
        session.setAttribute("cambioNoHecho", 20);
        response.sendRedirect("../../perfil.jsp");
    }
%>

