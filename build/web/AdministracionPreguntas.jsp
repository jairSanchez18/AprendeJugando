<%-- 
    Document   : AdministracionPreguntas
    Created on : 11/28/2021, 11:17:39 PM
    Author     : kenet
--%>

<%@page import="entidades.PreguntasCrud"%>
<%@page import="procesos.ObtenerPreguntasCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
    <title>Administracion de Temas</title>
    <style>
        body {
            background: linear-gradient(to right, #2688F0, #7678ED);

        }
        @media (max-width:768px){
            .col3 a{
                font-size: 14px;
            }
        }

    </style>
    <body>
        <%
            int id = (Integer) session.getAttribute("userId");
            if (session.getAttribute("userName") != null && id == 2) {
                ObtenerPreguntasCrud pregcrud = new ObtenerPreguntasCrud();
                PreguntasCrud preg = new PreguntasCrud();
        %>
        <%@include file="views/template/header.jsp" %>
        <div class="container hijo2 mt-4">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Administracion de Preguntas</p>
            <table border=1 class="table table-hover table-dark" style="font-family: 'Quicksand', sans-serif;">
                <thead>
                    <tr>
                        <th>Titulo del tema</th>
                        <th>Pregunta</th>
                        <th>codigo de pregunta</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        for (PreguntasCrud x : pregcrud.GuardarPreguntas()) {
                    %>
                    <tr>
                        <td><%=x.getTema()%></td>
                        <td><%=x.getPregunta()%></td>
                        <td><%=x.getCod_pregunta()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
           <div class="row">
                <div class="col col3">
                    <a href="AdministracionTemas.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Temas</a>
                </div>
                <div class="col col3">
                    <a href="AdministracionGrupos.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Grupos</a>
                </div>
                <div class="col col3">
                    <a href="AdministracionEstudiantes.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Estudiantes</a>
                </div>
            </div>
        </div>
        <%@include file="views/template/footer.jsp" %>
        <%     } else {
                response.sendRedirect("temas.jsp");
            }
        %>


    </body>
</html>
