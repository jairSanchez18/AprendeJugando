<%-- 
    Document   : AdministracionPreguntas
    Created on : 11/28/2021, 11:17:39 PM
    Author     : kenet
--%>

<%@page import="entidades.Grupos"%>
<%@page import="procesos.GruposMaestro"%>
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
    <title>Administracion de Grupos</title>
    <style>
        body {
            background: linear-gradient(to right, #2688F0, #7678ED);
        }
        footer{
                position: absolute;
                bottom: 0;
                width: 100%;
                padding:20px;
            }
            @media screen and (max-width:700px){
                footer{
                    position:relative;
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
                String correo = (String)session.getAttribute("userName");
                GruposMaestro gruposM =  new GruposMaestro();
                Grupos grupo = new Grupos();
        %>
        <%@include file="views/template/header.jsp" %>
        
        <div class="m-3">
            <%@include file="views/template/mensajaGrupoBorrado.jsp" %>
            <%session.removeAttribute("grupoborrado");%>
            <%session.removeAttribute("gruponoborrado");%>
        </div>

        <div class="container hijo2 mt-4">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Administracion de Preguntas</p>
            <table border=1 class="table table-hover table-dark" style="font-family: 'Quicksand', sans-serif;">
                <thead>
                    <tr>
                        <th>Codigo de grupo</th>
                        <th>Grupo</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Grupos x : gruposM.GrupoMaestro(correo)) {
                    %>
                    <tr>
                        <td> <%=x.getCod_grupo()%> </td>
                        <td> <%=x.getNivel()%> </td>
                         <td>
                             <a class="btn btn-danger w-100" href="views/template/GrupoBorrado.jsp?idGrupo=<%=x.getCod_grupo()%>"><i class="bi bi-trash-fill"></i></a>
                        </td>
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
                    <a href="AdministracionPreguntas.jsp" class="btn btn-success w-100" style="font-family: 'Quicksand', sans-serif;">Ir a Preguntas</a>
                </div>
                <div class="col col3">
                    <a href="AdministracionEstudiantes.jsp" class="btn btn-success w-100 irestu" style="font-family: 'Quicksand', sans-serif;">Ir a Estudiantes</a>
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
