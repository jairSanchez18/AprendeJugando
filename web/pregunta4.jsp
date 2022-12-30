<%-- 
    Document   : newjsp
    Created on : 21-nov-2021, 18:53:13
    Author     : andre
--%>
<%@page import="procesos.Jugabilidad"%>
<%@page import="entidades.DatosJugabilidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Juguemos!!!</title>
        <!--Tipografias-->
        <link rel="preconnect"href="https://fonts.googleapis.com">
        <link rel="preconnect"href="https://fonts.gstatic.com"crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap"rel="stylesheet">
        <!--Boostrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }

            .texto{
                color: rgb(255, 255, 255);
                font-family: 'Quicksand', sans-serif;
            }

            .imagen{
                width: 1080px;
            }

            .titulo{
                font-family: 'Anton', sans-serif;
            }
            footer{
                position: relative;
                bottom: 0;
                width: 100%;
                padding:20px;
            }
            @media screen and (max-width:700px){
                footer{
                    position: relative;
                    bottom: 0;
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("userName") != null) {  
        %>
        <%@include file="views/template/header.jsp" %>
        <!--Informacion-->
        <div class="container w-75 bg-white mt-xl-5 mb-5 rounded shadow ">
            <%  
                DatosJugabilidad datos = new DatosJugabilidad();
                Jugabilidad jugar = new Jugabilidad();
                String cod_tema = (String) session.getAttribute("Tema");
                int numpregunta = 4;
                for (DatosJugabilidad x : jugar.Preguntas(cod_tema, numpregunta)) {
            %>
            <div class="d-none d-md-block">
                <h3>Pregunta 4:</h3>
                <h3><%=x.getPregunta()%></h3>
            </div>
            <div class="col p-5 text-center">
                <H2 class="titulos fw-bold text-center py-2 titulo">Seleccione su respuesta:</H2>

                <div class="d-grid gap-2 col-9 mx-auto">
                    <form action="retroalimentacion/pregunta4Retro.jsp">
                        <%
                            for (DatosJugabilidad y : jugar.Respuestas(cod_tema, x.getCod_pregunta())) {
                        %>

                        <div class="form-check bg-dark mt-2 py-md-2 rounded text-white">
                            <input class="form-check-input" type="radio" id="Respuesta" name="Respuesta" value="<%=y.getOpcion_resp()%>" checked>
                            <p class="text-start"><%=y.getOpcion_resp()%></p>
                        </div>

                        <%
                            }
                        %>
                        <div class="d-grid gap-2 col-6 mx-auto mt-2">
                            <button type="submit" class="btn btn-primary texto">Siguiente</button>  
                        </div>
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <footer class="bg-dark text-white text-center mt-2" style="font-family: 'Quicksand', sans-serif;">
            Derechos reservados Grupo #3-1LS123-UTP
        </footer>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>