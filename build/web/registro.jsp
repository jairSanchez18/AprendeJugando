<%-- 
    Document   : registroo
    Created on : 21-nov-2021, 17:52:05
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro  </title>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Quicksand', sans-serif;
            }
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
            .bg{
                background-image: url(images/Registrarte.gif);
                background-position: center center;

            }

        </style>
    </head>
    <body>
        <%@include file="views/template/HeaderLR.jsp" %>
        <div class="container w-75 bg-white mt-xl-5 rounded shadow mt-2 ">
            <div class="row align-items-stretch">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

                </div>
                <div class="col p-5">
                    <div class="text-end">
                        <img src="images/Logo.png" width="78">
                    </div>

                    <H2 class="fw-bold text-center py-1">Bienvenido</H2>

                    <!--Login-->

                    <form action="views/template/Registrar.jsp">                      
                        
                        <div class="mb-3">
                            <%@include file="views/template/MensajeSesion.jsp" %>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/ErrorCedula.jsp" %>
                            <%session.removeAttribute("ErrCedM");%>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/ErrorGeneral.jsp" %>
                            <%session.removeAttribute("ErrGeneralM");%>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/ErrorEmail.jsp" %>
                            <%session.removeAttribute("ErrEmailM");%>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/ErrorPassword.jsp" %>
                            <%session.removeAttribute("ErrPassM");%>
                        </div>
                        
                        <div class="mb-3">
                            <label for="Nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="Nombre" required>
                        </div>

                        <div class="mb-3">
                            <label for="Apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" name="Apellido" required>
                        </div>
                        
                        

                        <div class="mb-3">
                            <label for="Cedula" class="form-label">Cedula</label>
                            <input type="text" class="form-control" name="Cedula" required>
                        </div>
                        
                        

                        <div class="mb-3">
                            <label for="Email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="Email" required>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/CodigoGrupo.jsp" %>
                        </div>
                        
                        <div class="mb-3">
                            <%@include file="views/template/estudios.jsp" %>
                        </div>


                        <div class="mb-3">
                            <label for="primeracontra" class="form-label">Contraseña</label>
                            <p class="h6 text-danger" style="font-family: 'Quicksand', sans-serif;">Mayor a 3 digitos, mayuscula y numeros</p>
                            <input type="password" class="form-control" name="primeracontra" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class=" btn btn-primary">Crear Cuenta</button>
                        </div>

                        <div class="my-2">
                            <span>Si tienes una cuenta? <a href="index.jsp">Inicia sesion</a></span>
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
