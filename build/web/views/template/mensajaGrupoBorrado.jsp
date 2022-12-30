<%
    if(session.getAttribute("grupoborrado") != null){
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El Grupo se ha eliminado exitosamente
    </div>
</div>
<%
    }else if (session.getAttribute("gruponoborrado") != null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> Algo salio mal, El grupo no se pudo eliminar. Hay estudiantes asignados a este grupo
    </div>
</div>
<%
    }
%>

