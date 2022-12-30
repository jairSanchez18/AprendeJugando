<%-- 
    Document   : index
    Created on : 11/18/2021, 10:07:25 PM
    Author     : kenet
--%>

<%@page import="procesos.Jugabilidad"%>
<%@page import="entidades.DatosJugabilidad"%>
<%@page import="procesos.ObtenerTemas"%>
<%@page import="entidades.Temas"%>
<%@page import="procesos.conexion"%>
<%@page import="procesos.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina Principal</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
                ObtenerTemas obtemas = new ObtenerTemas();
                Temas tema = new Temas();
                DatosJugabilidad Djug = new DatosJugabilidad();
                Jugabilidad jugar = new Jugabilidad();
        %>
        <%@include file="views/template/header.jsp" %>

        <div class="container mt-4">
            <%            if (session.getAttribute("JuegoFinalizado") != null) {
                    session.removeAttribute("JuegoFinalizado");
            %>

            <div class="alert alert-success d-flex align-items-center mt-2" role="alert">
                <div>
                    <i class="bi bi-exclamation-circle"></i> Ha finalizado el test con exito <a href="ranking.jsp">Ir a Ranking</a>
                </div>
            </div>
            <%
                }
            %>


            <%
                if (session.getAttribute("testHecho") != null) {
                    session.removeAttribute("testHecho");
            %>
            <div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
                <div>
                    <i class="bi bi-exclamation-circle"></i> Ya no tiene mas intentos, intente hacer otro
                </div>
            </div>
            <%
                }
            %>


            <p class="fs-2" style="font-family: 'Anton', sans-serif;">Temas del curso</p>
            <%                for (Temas x : obtemas.GuardarTemas()) {
            %>
            <div class="card m-2 shadow-lg" style="font-family: 'Quicksand', sans-serif;">
                <div class="text-center">
                    <img src="images/naturaleza.gif" class="card-img-top" alt="<%=x.getCod_tema()%>" width="200px" height="200px">
                </div>
                <div class="card-body">

                    <h5 class="card-title"><%=x.getTema()%>
                        <%
                            String correo = (String) session.getAttribute("userName");
                            int puntos = jugar.CalcularMedallas(x.getCod_tema(), correo);
                            int porcentaje = 0;
                            if (puntos == 0) {
                                porcentaje = 0;
                            } else {
                                if(jugar.ValidarRealizacionTest(x.getCod_tema(), correo) == 5){
                                puntos = jugar.CalcularMedallas(x.getCod_tema(), correo);
                                porcentaje = ((puntos / 5) * 80);
                                }else if(jugar.ValidarRealizacionTest(x.getCod_tema(), correo) == 10){
                                    puntos = jugar.CalcularMedallas(x.getCod_tema(), correo);
                                    porcentaje = ((puntos / 10) * 80);
                                }
                            }
                            if (porcentaje >= 80) {
                        %>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trophy" width="32" height="32" viewBox="0 0 24 24" stroke-width="2.5" stroke="#ffec00" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <line x1="8" y1="21" x2="16" y2="21" />
                        <line x1="12" y1="17" x2="12" y2="21" />
                        <line x1="7" y1="4" x2="17" y2="4" />
                        <path d="M17 4v8a5 5 0 0 1 -10 0v-8" />
                        <circle cx="5" cy="9" r="2" />
                        <circle cx="19" cy="9" r="2" />
                        </svg>
                        <%
                            }
                        %>
                    </h5>

                    <p class="card-text"><%=x.getContenido()%></p>
                    <%
                        if ((int) session.getAttribute("userId") == 1) {
                    %>
                    <a class="btn btn-success" href="views/template/ValidarTest.jsp?id=<%=x.getCod_tema()%>">iniciar Test</a>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>
        </div>
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
