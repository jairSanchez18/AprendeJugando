<%
    if (session.getAttribute("profe") != null) {
%>
<div class="mb-3 mt-3">
    <a class="btn btn-success w-100 mb-1" href="views/template/validarProfesion.jsp">Registrarse Como Estudiante</a>
</div>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-person-square"></i> Registro como profesor
    </div>
</div>
<%
} else {
%>
<div class="mb-3 mt-3">
    <a class="btn btn-success w-100 mb-1" href="views/template/validarProfesion.jsp?prof=profesor">Registrarse Como Profesor</a>
</div>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-person-square"></i> Registro como Estudiante
    </div>
</div>
<%
    }
%>
