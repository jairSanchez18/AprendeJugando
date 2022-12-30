<%-- 
    Document   : logion
    Created on : 11/22/2021, 08:18:06 PM
    Author     : kenet
--%>


<%@page import="procesos.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="../../js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="../../css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
<style>
    body{
        background: linear-gradient(to right, #2688F0, #7678ED);
    }
    .badG{
        background-image: url(../../images/fuegosartificiales.gif);
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .badG1{
        background-image: url(../../images/sad.gif);
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .a{
        text-decoration: none;
        color: white;
    }
</style>
<%
    String user = request.getParameter("user");
    String password = request.getParameter("pass");
    login log = new login();
    int ide = log.LoginEstudiante(user, password);
    int idm = log.LoginMaestro(user, password);
    if (ide == 1) {
        session.setAttribute("userId", ide);
        session.setAttribute("userName", user);
%>
<div class="container w-75 bg-white mt-xl-5 rounded shadow ">
    <div class="row align-items-stretch">
        <div class="col bg badG d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

        </div>
        <div class="col p-5"  style="font-family: 'Quicksand', sans-serif;">
            <div class="text-end">
                <img src="../../images/Logo.png" alt="" width="78"/>
            </div>

            <H2 class="fw-bold text-center py-3">Bienvenido</H2>

            <!--Login-->
            <h2 class="text-center">
                Usted inicio sesión como <span>estudiante</span>
            </h2>
            <form action="../../temas.jsp">
                <div class="d-grid mt-xl-4">                   
                    <button type="submit" class=" btn btn-primary">Acceder a la cuenta</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%
} else if (idm == 2) {
    session.setAttribute("userId", idm);
    session.setAttribute("userName", user);
%>
<div class="container w-75 bg-white mt-xl-5 rounded shadow ">
    <div class="row align-items-stretch">
        <div class="col bg badG d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

        </div>
        <div class="col p-5" style="font-family: 'Quicksand', sans-serif;">
            <div class="text-end">
                <img src="../../images/Logo.png" alt="" width="78"/>
            </div>

            <H2 class="fw-bold text-center py-3">Bienvenido</H2>

            <!--Login-->
            <h2 class="text-center">
                Usted inicio sesión como <span>Maestro</span>
            </h2>
            <form action="../../temas.jsp">
                <div class="d-grid mt-xl-4">                   
                    <button type="submit" class=" btn btn-primary">Acceder a la cuenta</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%
} else {
    if (ide != 1 || idm != 2) {

%>
<div class="container w-75 bg-white mt-xl-5 rounded shadow">
    <div class="row align-items-stretch">
        <div class="col bg badG1 d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

        </div>
        <div class="col p-5" style="font-family: 'Quicksand', sans-serif;">
            <div class="text-end">
                <img src="../../images/Logo.png" alt="" width="78"/>
            </div>

            <H2 class="fw-bold text-center py-3">Bienvenido</H2>

            <!--Login-->
            <form action="../../index.jsp">
                <div class="d-grid mt-xl-4">                   
                    <button type="submit" class=" btn btn-danger">Fallo el acceso a la cuenta, intente nuevamente</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%        }
    }
%>