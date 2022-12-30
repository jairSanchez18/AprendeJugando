<%-- 
    Document   : AdministracionPreguntas
    Created on : 11/28/2021, 11:17:39 PM
    Author     : kenet
--%>

<%@page import="entidades.ListaEstu"%>
<%@page import="procesos.ListaEstudiantes"%>
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
    <title>Administracion de Estudiantes</title>
    <style>
        body {
            background: linear-gradient(to right, #2688F0, #7678ED);
        }
        footer{
                width: 100%;
                padding:20px;
            }

    </style>
    <body>
        <%
            int id = (Integer) session.getAttribute("userId");
            if (session.getAttribute("userName") != null && id == 2) {
                ListaEstu datos = new ListaEstu();
                ListaEstudiantes estudiante = new ListaEstudiantes();
                String correo = (String)session.getAttribute("userName");
        %>
        <%@include file="views/template/header.jsp" %>
        <div class="container hijo2 mt-4">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Administracion de Estudiantes</p>
            <table border=1 class="table table-hover table-dark" style="font-family: 'Quicksand', sans-serif;">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Cedula</th>
                        <th>Codigo de grupo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ListaEstu x : estudiante.ListEstudiantes(correo)) {
                    %>
                    <tr>
                        <td><%=x.getNombre()%></td>
                        <td><%=x.getApellido()%></td>
                        <td><%=x.getCorreo()%></td>
                        <td><%=x.getCedula()%></td>
                        <td><%=x.getIdgrupo()%></td>
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
                    <a href="AdministracionTemas.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Temas</a>
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
