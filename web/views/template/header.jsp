<%-- 
    Document   : header
    Created on : 11/18/2021, 10:15:11 PM
    Author     : kenet
--%>

<%@page import="procesos.login"%>
<%@page import="entidades.Resultados"%>
<%@page import="procesos.ResultadoBusqueda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encabezado</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <link rel="icon" type="image/png" href="images/Logo.png">
    </head>
    <style>
        .activacion{
            color: white;
        }
        
        .activacion, .claseactiva:hover{
            color: white;
        }
        
        
    </style>
    <body>
        <header class="sticky-top" style="font-family: 'Quicksand', sans-serif;">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand navbar-brandx" href="temas.jsp">
                        <img src="images/Logo.png" alt="" width="50" height="24" class="d-inline-block align-text-top">
                        Aprende Jugando
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item nav-itemx">
                                <a class="nav-link claseactiva activacion" aria-current="page" href="temas.jsp">Inicio</a>
                            </li>
                            <li class="nav-item nav-itemx">
                                <a class="nav-link claseactiva activacion" href="acerca.jsp">Acerca del proyecto</a>
                            </li>
                            <li class="nav-item nav-itemx">
                                <a class="nav-link claseactiva activacion" href="contactanos.jsp">Contactanos</a>
                            </li>
                        </ul>
                        <form class="d-flex" action="busqueda.jsp">
                            <div class="input-group in-busqu">
                                <input class="form-control me-2" type="search" name="datoBusq" placeholder="Busqueda" aria-label="Search">
                                <button class="btn btn-outline-success bu-busq" type="submit"><i class="bi bi-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="linex"></div>

            <nav class="navbar colornav colornavx navbar-dark bg-dark col">
                <div class="container-fluid">
                    <button class="navbar-toggler navbar-togglerx menu-info border-white" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        <span class="navbar-toggler-icon"></span>Menu de informacion
                    </button>
                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar"
                         aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header bg-dark">
                            <h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel">Menu</h5>
                            <button type="button" class="btn-close text-reset btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>  
                        </div>
                        <div class="offcanvas-body offbody bg-dark">
                            <p class="fs-6 m-2 text-white"><i class="bi bi-person-square m-2"></i>Bienvenido: <%=session.getAttribute("userName")%></p>
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item nav-itemx border-white">
                                    <a class="nav-link" href="perfil.jsp">Perfil y administracion de usuario</a>
                                </li>

                                <li class="nav-item nav-itemx border-white">
                                    <a class="nav-link" href="ranking.jsp">Ranking</a>
                                </li>
                                <li class="nav-item nav-itemx border-white">
                                    <a class="nav-link" href="reportes.jsp">Reportes Generales</a>
                                </li>
                                <%
                                    if ((int) session.getAttribute("userId") == 2) {
                                %>
                                <div class="dropdown d-grid gap-2 m-2">
                                    <button class="btn btn-dark border-white dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                                        Administracion CRUD
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-dark bg-dark border-light" aria-labelledby="dropdownMenuButton2">
                                        <li class="border-white"><a class="dropdown-item" href="AdministracionTemas.jsp">Temas</a></li>
                                        <li class="border-white"><a class="dropdown-item" href="AdministracionPreguntas.jsp">Preguntas</a></li>
                                        <li class="border-white"><a class="dropdown-item" href="AdministracionEstudiantes.jsp">Estudiantes</a></li>
                                        <li class="border-white"><a class="dropdown-item" href="AdministracionGrupos.jsp">Grupos</a></li>    
                                    </ul>
                                </div>
                                <%
                                    }
                                %>
                                <li class="nav-item border-white">
                                    <a class="nav-link btn btn-danger text-white" href="index.jsp">Cerrar Sesion</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
    </body>
</html>
