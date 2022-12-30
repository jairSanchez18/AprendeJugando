<%
    if(session.getAttribute("userName").toString().equals("keneth2618@gmail.com")){
        session.setAttribute("borradovalido", 10);
        response.sendRedirect("../../AdministracionTemas.jsp");
        
    }else {
        session.setAttribute("borradoinvalido", 20);
        response.sendRedirect("../../AdministracionTemas.jsp");
    }
%>
