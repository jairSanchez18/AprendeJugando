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
<%@page import="procesos.cambiarDatos"%>
<%
    String correoA = (String) session.getAttribute("userName");
    String correoNuevo = request.getParameter("correoNuevo");
    cambiarDatos cambiar = new cambiarDatos();
    if (cambiar.ValidarCorreo(correoNuevo) == 1) {
        session.setAttribute("errorCorreo", 10);
        response.sendRedirect("../../perfil.jsp");
%>
<%
} else {
    cambiar.CorreoEstudiante(correoA, correoNuevo);
    cambiar.CorreoMaestro(correoA, correoNuevo);
    session.setAttribute("userName", correoNuevo);
    session.setAttribute("ValidoCorreo", 10);
    response.sendRedirect("../../perfil.jsp");
%>
<%
    }
%>
