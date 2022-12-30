<%
    if(session.getAttribute("grupocreado") != null){
%>
<div class="alert alert-success d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El grupo se ha creado con exito <a href="AdministracionGrupos.jsp">ir a Administracion de grupos</a>
    </div>
</div>
<%       
    }else if(session.getAttribute("gruponocreado") != null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> Verifique que los datos del grupo esten introducidos correctamente
    </div>
</div>
<%
    }else if (session.getAttribute("grupoexiste") != null){
%>
<div class="alert alert-danger d-flex align-items-center mt-2" role="alert">
    <div>
        <i class="bi bi-exclamation-circle"></i> El grupo introducido ya existe en su lista
    </div>
</div>
<%
    }
%>
