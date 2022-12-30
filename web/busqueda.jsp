<%-- 
    Document   : busqueda
    Created on : 11/18/2021, 10:28:00 PM
    Author     : kenet
--%>

<%@page import="entidades.Resultados"%>
<%@page import="procesos.ResultadoBusqueda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Resultado de busqueda</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <style>
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("userName") != null) {
        %>
        <%@include file="views/template/header.jsp" %>
        <%            ResultadoBusqueda resbusqueda = new ResultadoBusqueda();
            Resultados resul = new Resultados();
            String busqueda = "%" + request.getParameter("datoBusq") + "%";
            String resulbusqueda = request.getParameter("datoBusq");
        %>
        <div class="busqueda">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Resultado de la busqueda: <%=resulbusqueda%></p>
        </div>
        <div class="border-top border border-light"></div>
        <%
            for (Resultados res : resbusqueda.ObtenerResultado(busqueda)) {
        %>
        <div class="busqueda result border-light border rounded p-2">
            <ul class="list-group">
                <li class="list-group-item list-group-item-action bg-dark text-white" style="font-family: 'Quicksand', sans-serif;"><%=res.getTituloTema()%></li>
                <li class="list-group-item list-group-item-action" style="font-family: 'Quicksand', sans-serif;"><%=res.getObtenerResultados()%></li>
            </ul>
        </div>
        <%
            }
        %>
        <%@include file="views/template/footer.jsp" %>
        <%
        } else {
            response.sendRedirect("index.jsp");
        %>
        <%
            }
        %>
    </body>
</html>