<%-- 
    Document   : AdministracionTemas
    Created on : 11/28/2021, 11:16:08 PM
    Author     : kenet
--%>

<%@page import="entidades.Temas"%>
<%@page import="procesos.ObtenerTemas"%>
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
        footer{
            position: relative;
            bottom: 0;
            width: 100%;
            padding:25px;
        }
        @media screen and (max-width:700px){
            footer{
                position: relative;
                bottom: 0;
                width: 100%;
            }
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
                ObtenerTemas obtemas = new ObtenerTemas();
                Temas tema = new Temas();
        %>
        <%@include file="views/template/header.jsp" %>
        <div class="container hijo2 mt-4">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Administracion de Temas</p>

            <div class="m-3">
                <%@include file="views/template/CRUDMensaje.jsp" %>
                <%session.removeAttribute("borradovalido");%>
                <%session.removeAttribute("borradoinvalido");%>
            </div>

            <table border=1 class="table table-hover table-dark" style="font-family: 'Quicksand', sans-serif;">
                <thead>
                    <tr>
                        <th>Codigo del tema</th>
                        <th>Titulo del tema</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Temas x : obtemas.GuardarTemas()) {
                    %>
                    <tr>
                        <td><%=x.getCod_tema()%></td>
                        <td><%=x.getTema()%></td>
                        <td>
                            <form action="views/template/CRUDBorrado.jsp" style="float: left">
                                <button type="submit" class="btn btn-danger m-2 w-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                    </svg>
                                </button>
                            </form>
                        </td>

                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="row">
                <div class="col col3">
                    <a href="AdministracionPreguntas.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a preguntas</a>
                </div>
                <div class="col col3">
                    <a href="AdministracionGrupos.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Grupos</a>
                </div>
                <div class="col col3">
                    <a href="AdministracionEstudiantes.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Estudiantes</a>
                </div>
            </div>
        </div>
        <footer class="bg-dark text-white text-center mt-2" style="font-family: 'Quicksand', sans-serif;">
            Derechos reservados Grupo #3-1LS123-UTP     
        </footer>
        <%     } else {
                response.sendRedirect("temas.jsp");
            }
        %>


    </body>
</html>
