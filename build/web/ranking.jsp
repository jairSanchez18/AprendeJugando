<%-- 
    Document   : newjsp
    Created on : 21-nov-2021, 18:53:13
    Author     : andre
--%>

<%@page import="procesos.ObtenerRanking"%>
<%@page import="entidades.Ranking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ranking</title>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <style>
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
            footer{
                position: relative;
                bottom: 0;
                width: 100%;
                padding:20px;
            }
            .Img{
                height: 367px;
            }
        </style>


    </head>
    <body>
        <%
            if (session.getAttribute("userName") != null) {
        %>
        <%@include file="views/template/header.jsp" %>
        <div class="container w-75 bg-white mt-xl-5 rounded shadow mt-2">
            <div class="row">
                <div class="col d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

                    <div class="col text-center" style="font-family: 'Quicksand', sans-serif;">
                        <%              ObtenerRanking obRank = new ObtenerRanking();
                            Ranking rank = new Ranking();
                            for (Ranking x : obRank.TopTres()) {
                        %>
                        <label class="Holowi fs-3 px-5 pt-1" for=""><%=x.getNombreT()%></label>
                        <%
                            }
                        %>
                        <img  class="Img img-fluid" src="images/podio.png" alt="">
                    </div>

                </div>
                <div class="col shadow bg-dark">
                    <!--Tabla-->
                    <table class="table  mt-4 bg-dark text-white" style="font-family: 'Quicksand', sans-serif;">
                        <thead>

                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Puntos</th>
                            </tr>

                        </thead>
                        <tbody>
                            <%
                                for (Ranking y : obRank.ListaRanking()) {

                            %>
                            <tr>
                                <th scope="row"><%=y.getContador()%></th>
                                <td><%=y.getNombre()%> <%=y.getApellido()%></td>
                                <td>
                                    <%if(y.getPuntos() < 0){%>
                                    0
                                <%
                                    }else{
                                %>
                                <%=y.getPuntos()%>
                                <%
                                    }
                                %>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
         <footer class="bg-dark text-white text-center mt-2" style="font-family: 'Quicksand', sans-serif;">
            Derechos reservados Grupo #3-1LS123-UTP     
        </footer>
        <%
        } else {
            response.sendRedirect("index.jsp");
        %>
        <%
            }
        %>
    </body>
</html>