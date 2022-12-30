<%-- 
    Document   : contactanos
    Created on : 11/21/2021, 09:16:34 PM
    Author     : kenet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo_c.css" rel="stylesheet" type="text/css"/>
        <title>Contacto</title>
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

        <div class="row container-fluid mt-4">
            <p class="fs-3" style="font-family: 'Anton', sans-serif;">Contactanos</p>
            <div class="col-sm colum">
                <ul class="list-group" style="font-family: 'Quicksand', sans-serif;">
                    <li class="list-group-item"><i class="bi bi-telephone"></i>+507 61234567</li>
                    <li class="list-group-item"><i class="bi bi-envelope"></i>AprendeJugando@gmail.com</li>
                    <li class="list-group-item"><i class="bi bi-signpost-2"></i>Campus Victor Levi Sasso,Ancón, Panamá., Vía Centenario, Panamá</li>
                    <li class="list-group-item"><i class="bi bi-instagram"></i>AprendeJugandoUTP<br><i class="bi bi-twitter"></i>AprendeJugando<br><i class="bi bi-facebook"></i>UTPaprendeJugando</li>
                </ul>
            </div>
            <div class="col-sm colum" style="font-family: 'Quicksand', sans-serif;">

                <form action="views/template/Enviado.jsp">
                    <label for="">Nombre:</label><br>
                    <input type="text" name="cname" id="" required>
                    <label for="">Correo:</label><br>
                    <input type="email" name="ccorreo" id="" required>
                    <label for="">Tus Preguntas:</label><br>
                    <input type="text" name="cpregunta" id="" required>
                    <button type="submit" class="btn btn-success">Enviar Datos</button>
                </form>
                <%    if (session.getAttribute("enviado") != null) {
                        session.removeAttribute("enviado");
                %>
                <div class="alert alert-success d-flex align-items-center mt-2" role="alert">
                    <div>
                        <i class="bi bi-check-circle-fill"></i> Informacion enviada correctamente
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <footer class="bg-dark text-white text-center mt-2" style="font-family: 'Quicksand', sans-serif;">
            Derechos reservados Grupo #3-1LS123-UTP     
        </footer>
        <%        } else {
            response.sendRedirect("index.jsp");
        %>
        <%
            }
        %>
    </body>
</html>
