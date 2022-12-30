<%-- 
    Document   : reportes
    Created on : 11/18/2021, 10:19:26 PM
    Author     : kenet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reportes Generales</title>
        <link rel="stylesheet" href="css/estilo.css">
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
        </style>
    </head>

    <body>
        <%
            if (session.getAttribute("userName") != null) {
        %>
        <%@include file="views/template/header.jsp" %>

        <form action="views/template/EnviadoReporte.jsp">
            <div class="row form mt-4">
                <p class="fs-3"  style="font-family: 'Anton', sans-serif;">Reportes Generales</p>
                <%    if (session.getAttribute("enviadoReporte") != null) {
                        session.removeAttribute("enviadoReporte");
                %>
                <div class="alert alert-success d-flex align-items-center mt-2" role="alert">
                    <div  style="font-family: 'Quicksand', sans-serif;">
                        <i class="bi bi-check-circle-fill"></i> Informacion enviada correctamente
                    </div>
                </div>
                <%
                    }
                %>
                <div class="col"  style="font-family: 'Quicksand', sans-serif;">

                    <div class="form-floating">
                        <input type="date" class="form-control" id="floatingInput" name="Rfecha" required>
                        <label for="floatingInput">Fecha del reporte</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Ejm. Panamá" name="Rdireccion" required>
                        <label for="floatingInput">Dirección</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Ejm. Error en el Ranking" name="Rtipo" required>
                        <label for="floatingInput">Tipo de reporte</label>
                    </div>
                </div>

                <div class="col"  style="font-family: 'Quicksand', sans-serif;">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Ejm. 8-111-2222" name="Rcedula" required>
                        <label for="floatingInput">Cedula</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Ejm. Keneth Sanchez" name="Rnombre" required>
                        <label for="floatingInput">Nombre</label>
                    </div>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput" placeholder="Ejm. ejemplo@gmail.com" name="Rcorreo" required>
                        <label for="floatingInput">Correo Electronico</label>
                    </div>
                </div>

                <div class="mt-2">
                    <button type="submit" class="btn btn-success w-100">Enviar informacion</button>
                </div>

            </div>
        </form>
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
