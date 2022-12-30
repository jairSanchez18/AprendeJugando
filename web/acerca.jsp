<%-- 
    Document   : newjsp
    Created on : 21-nov-2021, 18:53:13
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Acerca del proyecto</title>
        <!--Boostrap-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: rgb(255, 255, 255);
                background: linear-gradient(to right, #2688F0, #7678ED);
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("userName") != null) {
        %>
        <%@include file="views/template/header.jsp" %>
        <div class="contenedor">
            <div class="item1"></div>
            <div class="item2"></div>
            <div class="item3"></div>
            <div class="item4"></div>
        </div>

        <!--Carrousel-->
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/img1.jpeg" class="d-block w-100" alt="banner1">
                </div>
                <div class="carousel-item">
                    <img src="images/img2.jpeg"class="d-block w-100" alt="banner2">
                </div>
                <div class="carousel-item">
                    <img src="images/img3.jpeg" class="d-block w-100" alt="banner3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!--Informacion-->
        <div class="container w-75 bg-white mt-xl-5 rounded shadow mt-2">
            <div class="col p-5 text-center">
                <H2 class="fw-bold text-center py-2" style="font-family: 'Anton', sans-serif;">Misión</H2>
                <p style="font-family: 'Quicksand', sans-serif;">
                    La misión de nuestro proyecto es poder ayudar a todos lo estudiantes del mundo a aprender sobre las ciencias naturales centrándonos en la diversión como método de aprendizaje, además de ofrecer información actualizada a disposición del publico para mejorar sus conocimientos y entendimiento sobre el mundo que los rodea.
                    Visión   
                </p>
            </div>
        </div>
    </div>

    <div class="container w-75 bg-white mt-xl-5 rounded shadow my-5">
        <div class="col p-5 text-center">
            <H2 class="fw-bold text-center py-2" style="font-family: 'Anton', sans-serif;">Visión</H2>
            <p style="font-family: 'Quicksand', sans-serif;">
                Nuestra visión es convertirnos en una plataforma de referencia en el ámbito de la información educativa y propiciar el intercambio de ideas entre directivos de centros de enseñanza. Impulsar la mejora del sistema educativo y de la educación en todas sus etapas a través de la profesionalización de su gestión.
            </p>
        </div>
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