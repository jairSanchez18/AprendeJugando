<%@page import="procesos.Jugabilidad"%>
<%
    Jugabilidad jugar = new Jugabilidad();
    String cod_tema = request.getParameter("id");
    String correo = (String) session.getAttribute("userName");
    session.setAttribute("Tema", cod_tema);
    if (jugar.ValidarRealizacionTest(cod_tema, correo) >= 10) {
        session.setAttribute("testHecho", 10);
        response.sendRedirect("../../temas.jsp");
    } else {
        response.sendRedirect("../../Jugabilidad.jsp");
    }
%>
