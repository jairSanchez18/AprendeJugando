<%
    if (session.getAttribute("ErrEmailM") != null) {
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El correo ya se encuentra en uso
    </div>
</div>
<%
    }
%>
