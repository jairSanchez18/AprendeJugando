<%
    if (session.getAttribute("ErrGeneralM") != null) {
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> Ocurrio un error al crear el usuario
    </div>
</div>
<%
    }
%>
