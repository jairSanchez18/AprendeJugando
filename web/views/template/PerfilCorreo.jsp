<%
    if(session.getAttribute("ValidoCorreo") != null){
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El Correo se ha modificado con exito
    </div>
</div>
<%
    }else if(session.getAttribute("errorCorreo")!=null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El correo ingresado ya se encuentra en uso
    </div>
</div>
<%
    }
%>
