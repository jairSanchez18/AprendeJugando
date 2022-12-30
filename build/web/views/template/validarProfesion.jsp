<%
    if (request.getParameter("prof") != null) {
        session.setAttribute("profe", 10);
        response.sendRedirect("../../registro.jsp");
%>
<%        
    } else {
        response.sendRedirect("../../registro.jsp");
        session.removeAttribute("profe");
    }
%>
