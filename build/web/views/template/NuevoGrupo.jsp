<%@page import="procesos.cambiarDatos"%>
<%
    String grupo = request.getParameter("grupo");
    String correo = (String)session.getAttribute("userName");
    cambiarDatos cambiar = new cambiarDatos();
    if(cambiar.ValidarGrupo(grupo, correo) == 1){
        session.setAttribute("grupoexiste", 30);
        response.sendRedirect("../../perfil.jsp");
    }else if(cambiar.NuevoGrupo(correo, grupo) == 1){
        session.setAttribute("grupocreado", 10);
        response.sendRedirect("../../perfil.jsp");
    }else{
        session.setAttribute("gruponocreado", 20);
        response.sendRedirect("../../perfil.jsp");
    }
%>

