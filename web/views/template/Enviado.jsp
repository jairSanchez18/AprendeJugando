<%
    String dato = request.getParameter("cname");
    session.setAttribute("enviado", dato);
    response.sendRedirect("../../contactanos.jsp");
%>
