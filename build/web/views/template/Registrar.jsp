<%@page import="procesos.Registrarse"%>
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
    String Nombre = request.getParameter("Nombre");
    String Apellido = request.getParameter("Apellido");
    String Cedula = request.getParameter("Cedula");
    String Email = request.getParameter("Email");
    String Password = request.getParameter("primeracontra");
    String CodGrupo = request.getParameter("CodGrupo");
    String estudios = request.getParameter("estudios");
    cambiarDatos verificar = new cambiarDatos();
    Registrarse registro = new Registrarse();
    if (session.getAttribute("profe") != null) {
        if (verificar.ValidarCorreo(Email) == 1) {
            session.setAttribute("ErrEmailM", 1);
            response.sendRedirect("../../registro.jsp");
%>
<%
} else if (registro.ValidarCedula(Cedula) == 1) {
    session.setAttribute("ErrCedM", 2);
    response.sendRedirect("../../registro.jsp");
%>
<%
} else if (Password.length() < 4) {
    session.setAttribute("ErrPassM", 3);
    response.sendRedirect("../../registro.jsp");
%>
<%
} else {
    if (registro.RegistroMaestro(Nombre, Apellido, Cedula, Email, Password, estudios) > 0) {
        session.setAttribute("registrovalido", 10);
        response.sendRedirect("../../index.jsp");
    } else {
        session.setAttribute("ErrGeneralM", 4);
        response.sendRedirect("../../registro.jsp");
    }
%>
<%    }
} else if (verificar.ValidarCorreo(Email) == 1) {
    session.setAttribute("ErrEmailM", 1);
    response.sendRedirect("../../registro.jsp");
%>
<%
} else if (registro.ValidarCedula(Cedula) == 1) {
    session.setAttribute("ErrCedM", 2);
    response.sendRedirect("../../registro.jsp");
%>
<%
} else if (Password.length() < 4) {
    session.setAttribute("ErrPassM", 3);
    response.sendRedirect("../../registro.jsp");
%>
<%
} else {  
    if (registro.RegistroEstudiante(Nombre, Apellido, Cedula, Email, Password, CodGrupo) > 0) {
        session.setAttribute("registrovalido", 10);
        response.sendRedirect("../../index.jsp");
    } else {
        session.setAttribute("ErrGeneralM", 4);
        response.sendRedirect("../../registro.jsp");
    }
%>
<%
    }
%>