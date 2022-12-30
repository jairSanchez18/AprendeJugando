<%-- 
    Document   : newjsp
    Created on : 21-nov-2021, 17:50:55
    Author     : andre
--%>
<%@page import="procesos.login"%>
<%@page import="procesos.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <!--Boostrap-->
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script>
            function mostrarContrasena() {
                var tipo = document.getElementById("password");
                if (tipo.type == "password") {
                    tipo.type = "text";
                } else {
                    tipo.type = "password";
                }
            }
        </script>
        <style>
            *{
                font-family: 'Quicksand', sans-serif;
            }
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
            .bg{
                background-image: url(images/Fondo.gif);
                background-position: center center;

            }

        </style>
    </head>
    <body>
        <%
            session.removeAttribute("userName");
        %>
        <%@include file="views/template/HeaderLR.jsp" %>
        <div class="container w-75 bg-white mt-xl-5 rounded shadow mt-2">
            <div class="row align-items-stretch">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

                </div>
                <div class="col p-5">
                    <div class="text-end">
                        <img src="images/Logo.png" width="78">
                    </div>

                    <H2 class="fw-bold text-center py-5">Bienvenido</H2>
                  
                    
                    <div class="mb-3">
                        <%@include file="views/template/registroValido.jsp" %>
                        <%session.removeAttribute("registrovalido");%>
                    </div>
                    <form action="views/template/iniciosesion.jsp" method ="post">
                        <div class="mb-4">
                            <label for="email" class="form-label">Correo electronico</label>
                            <input type="email" class="form-control" name="user">
                        </div>
                        <label for="password" class="form-label">Contraseña</label>
                        <div class="mb-3 input-group">
                            <input type="password" class="form-control" name="pass" id="password">
                            <button class="btn btn-primary" type="button" onclick="mostrarContrasena()"><i class="bi bi-eye-slash"></i></button>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class=" btn btn-primary">Iniciar sesion</button>
                        </div>
                        <div class="my-3">
                            <span>No tienes una cuenta? <a href="registro.jsp">Registrate</a></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div style="position: relative; margin-top:50px">
            <%@include file="views/template/footer.jsp" %>
        </div>
    </body>
</html>
