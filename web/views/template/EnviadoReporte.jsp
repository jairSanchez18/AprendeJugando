<%
    String datoReporte = request.getParameter("Rnombre");
    session.setAttribute("enviadoReporte", datoReporte);
    response.sendRedirect("../../reportes.jsp");
%>
