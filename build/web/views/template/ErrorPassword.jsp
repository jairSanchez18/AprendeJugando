<%
    if (session.getAttribute("ErrPassM") != null) {
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> Error en el formato de la contraseña
    </div>
</div>
<%
    }
%>
