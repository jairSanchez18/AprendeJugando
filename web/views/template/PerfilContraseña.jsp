<%
    if(session.getAttribute("cambioHecho") != null){
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> La contrase�a se ha cambiado con exito
    </div>
</div>
<%
    }else if(session.getAttribute("cambioNoHecho")!=null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> verifique las contrase�as
    </div>
</div>
<%
    }
%>