<%@page import="procesos.Jugabilidad"%>
<!--boostrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!--Tipografias-->
<link rel="preconnect"href="https://fonts.googleapis.com">
<link rel="preconnect"href="https://fonts.gstatic.com"crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Quicksand:wght@700&display=swap"rel="stylesheet">
<style>


    .titulo{
        font-family: 'Anton', sans-serif;
    }

    body{
        background: linear-gradient(to right, #2688F0, #7678ED);
    }

    .imagen{
        width: 480px;
    }

    .a{
        color: white;
        text-decoration: none;
    }


    .texto{
        color: rgb(0, 0, 0);
        font-family: 'Quicksand', sans-serif;
        font-size: 20px;
    }
</style>
<%
    String respuesta = request.getParameter("Respuesta");
    Jugabilidad jugar = new Jugabilidad();
    String corre = (String) session.getAttribute("userName");
    String cod_preg = jugar.Cod_preg(respuesta);
    if (jugar.ValidarRespuesta(respuesta) == 1) {
        int puntos = 1;
        jugar.Puntos(puntos, corre, cod_preg);

%>
<div class="container w-75 bg-white mt-xl-5 rounded shadow ">
    <div class="row align-items-stretch">
        <div class="col p-5">
            <div class="text-end">
                <img src="../images/Logo.png" width="78">
            </div>

            <H2 class="fw-bold text-center py-5 titulo">Buen trabajo</H2>
            <p class="texto text-center">
                <font color="green">respuesta elegida:</font> <%=respuesta%>
            </p>
            <div class="text-center">
            <img src="../images/bien hecho.gif" alt="" class=""/>
            </div>
            <p class="texto text-center">
                <%=jugar.RetroAlimentacion(respuesta)%>
            </p>

            <div class="d-grid">
                <form action="../pregunta4.jsp">
                    <button type="submit" class=" btn btn-success w-100">Siguiente Pregunta</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%
} else {
    int puntos = -2;
    jugar.Puntos(puntos, corre, cod_preg);
%>
<div class="container w-75 bg-white mt-xl-5 rounded shadow ">
    <div class="row align-items-stretch">
        <div class="col p-5">
            <div class="text-end">
                <img src="../images/Logo.png" width="78">
            </div>
            <H2 class="fw-bold text-center py-5 titulo">Podria Mejorar</H2>
            <p class="texto text-center">
                <font color="red">respuesta elegida:</font> <%=respuesta%>
            </p>
            <div class="text-center">
            <img src="../images/mal hecho.gif" alt=""/>
            </div>
            <p class="texto text-center">
                <%=jugar.RetroAlimentacion(respuesta)%>
            </p>

            <div class="d-grid">
                <form action="../pregunta4.jsp">
                    <button type="submit" class=" btn btn-danger w-100">Siguiente Pregunta</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
