<%
    if(session.getAttribute("borradovalido") != null){
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El borrado se ha realizado con exito
    </div>
</div>
<%
    }else if (session.getAttribute("borradoinvalido") != null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> Usted no posee permisos para borrar
    </div>
</div>
<%
    }  
%>