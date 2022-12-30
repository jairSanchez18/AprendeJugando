<%
    if (session.getAttribute("ErrCedM") != null) {
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> La cedula ya se encuentra registrada
    </div>
</div>
<%
    }
%>
