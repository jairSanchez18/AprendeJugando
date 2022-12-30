<%@page import="procesos.GruposMaestro"%>
<%
    String codigo = request.getParameter("idGrupo");
    String correo = (String)session.getAttribute("userName");
    GruposMaestro grupo = new GruposMaestro();
    if(grupo.borrarGrupo(correo, codigo) == 1){
        session.setAttribute("grupoborrado", 1);
        response.sendRedirect("../../AdministracionGrupos.jsp");
    }else{
        session.setAttribute("gruponoborrado", 2);
        response.sendRedirect("../../AdministracionGrupos.jsp");
    }
%>

