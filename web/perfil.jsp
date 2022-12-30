<%-- 
    Document   : perfil
    Created on : 11/21/2021, 09:11:39 PM
    Author     : kenet
--%>


<%@page import="entidades.Grupos"%>
<%@page import="procesos.GruposMaestro"%>
<%@page import="entidades.DatosE"%>
<%@page import="procesos.ObtenerDatosEstudiante"%>
<%@page import="entidades.DatosM"%>
<%@page import="procesos.ObtenerDatosMaestro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil</title>
        <link href="css/estilo_p.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <script>
            function mostrarContrasena() {
                var tipo = document.getElementById("password");
                if (tipo.type == "password") {
                    tipo.type = "text";
                } else {
                    tipo.type = "password";
                }
            }

            function mostrarContrasena2() {
                var tipo = document.getElementById("password2");
                if (tipo.type == "password") {
                    tipo.type = "text";
                } else {
                    tipo.type = "password";
                }
            }
        </script>
        <style>
            body{
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
            .contenido ul li{
                padding-top: 25px;
                padding-bottom: 25px;
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
            input{
                width: 100%;
            }
        </style>
    </head>

    <body>
        <%
            if (session.getAttribute("userName") != null) {
        %>
        <%@include file="views/template/header.jsp" %>
        <%            ObtenerDatosMaestro ObtenerM = new ObtenerDatosMaestro();
            ObtenerDatosEstudiante ObtenerE = new ObtenerDatosEstudiante();
            DatosM datos = new DatosM();
            DatosE datos1 = new DatosE();
            String correo = (String) session.getAttribute("userName");
            if ((int) session.getAttribute("userId") == 2) {
                for (DatosM x : ObtenerM.DatosMaestro(correo)) {
        %>
        <div class="m-3">
            <%@include file="views/template/mensajeGrupo.jsp" %>
            <%session.removeAttribute("grupocreado");%>
            <%session.removeAttribute("gruponocreado");%>
            <%session.removeAttribute("grupoexiste");%>
        </div>

        <div class="m-3">
            <%@include file="views/template/PerfilContraseña.jsp" %>
            <%session.removeAttribute("cambioHecho");%>
            <%session.removeAttribute("cambioNoHecho");%>
        </div>

        <div class="m-3">
            <%@include file="views/template/PerfilCorreo.jsp" %>
            <%session.removeAttribute("ValidoCorreo");%>
            <%session.removeAttribute("errorCorreo");%>
        </div>

        <div class="row contenido  m-4">
            <div class="col-sm" >
                <p class="fs-3" style="font-family: 'Anton', sans-serif;">Perfil del usuario</p>
                <ul class="list-group" style="font-family: 'Quicksand', sans-serif;">
                    <li class="list-group-item">Nombre: <%=x.getNombre()%></li>
                    <li class="list-group-item">Apellido: <%=x.getApellido()%> </li>
                    <li class="list-group-item">Correo: <%=x.getCorreo()%></li>
                    <li class="list-group-item">Cedula: <%=x.getCedula()%></li>
                    <li class="list-group-item">estudios didacticos: <%=x.getEstu_didac()%> tiene</li>
                </ul>
            </div>
            <%
                }
            } else {
                for (DatosE x : ObtenerE.DatosEstudiante(correo)) {
            %>
            <div class="m-3">
                <%@include file="views/template/PerfilContraseña.jsp" %>
                <%session.removeAttribute("cambioHecho");%>
                <%session.removeAttribute("cambioNoHecho");%>
            </div>

            <div class="m-3">
                <%@include file="views/template/PerfilCorreo.jsp" %>
                <%session.removeAttribute("ValidoCorreo");%>
                <%session.removeAttribute("errorCorreo");%>
            </div>
            <div class="row contenido container-fluid">
                <div class="col-sm">
                    <p class="fs-3"  style="font-family: 'Anton', sans-serif;">Perfil del usuario</p>
                    <ul class="list-group" style="font-family: 'Quicksand', sans-serif;">
                        <li class="list-group-item">Nombre: <%=x.getNombre()%></li>
                        <li class="list-group-item">Apellido: <%=x.getApellido()%> </li>
                        <li class="list-group-item">Correo: <%=x.getCorreo()%></li>
                        <li class="list-group-item">Cedula: <%=x.getCedula()%></li>
                            <%
                                for (DatosE y : ObtenerE.OtrosDatosEstudiante(correo)) {
                            %>
                        <li class="list-group-item">Nombre del maestro: <%=y.getNombreMaestro()%>  <%=y.getApellidoMaestro()%></li>
                        <li class="list-group-item">Grado: <%=y.getGrupoEstudiante()%></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
                <%
                        }
                    }
                %>
                <div class="col-sm">

                    <p class="fs-3" style="font-family: 'Anton', sans-serif;">Administracion de Perfil</p> 
                    <form action="views/template/NuevaContraseña.jsp" style="font-family: 'Quicksand', sans-serif;">
                        <label for="">Ingrese contraseña actual:</label><br>
                        <div class=" input-group">
                            <input type="password" class="form-control" name="contraActual"  id="password" required><br>
                            <button class="btn btn-light border border-dark" type="button" onclick="mostrarContrasena()"><i class="bi bi-eye-slash-fill"></i></button>
                        </div>
                        <label for="">Ingrese nueva contraseña:</label><br>
                        <div class=" input-group">
                            <input type="password" class="form-control" name="contraNueva"  placeholder="Contraseña mayor a 3 digitos, mayuscula y numeros" id="password2" required><br>
                            <button class="btn btn-light border border-dark" type="button" onclick="mostrarContrasena2()"><i class="bi bi-eye-slash-fill"></i></button>
                        </div>
                        <button type="submit" class="btn btn-success">Modificar contraseña</button>
                    </form>
                    <form action="views/template/NuevoCorreo.jsp" style="font-family: 'Quicksand', sans-serif;">
                        <label for="">Ingrese su nuevo correo:</label><br>
                        <input type="email"  name="correoNuevo" required><br>
                        <button type="submit" class="btn btn-success">Modificar correo</button>
                    </form>
                    <%
                        if ((int) session.getAttribute("userId") == 2) {
                    %>
                    <form action="views/template/NuevoGrupo.jsp" style="font-family: 'Quicksand', sans-serif;">
                        <label for="">Grupo a añadir:</label><br>
                        <input type="text"  name="grupo" placeholder="Ejm. 3A" required><br>
                        <button type="submit" class="btn btn-success">Añadir Grupo</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
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
