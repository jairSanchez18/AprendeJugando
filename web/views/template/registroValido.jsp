<%
    if (session.getAttribute("registrovalido") != null) {
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-check-circle-fill"></i> Registro realizado con exito
    </div>
</div>
<%
    }
%>
