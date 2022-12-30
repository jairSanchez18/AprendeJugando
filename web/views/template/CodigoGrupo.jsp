<%
    if (session.getAttribute("profe") == null) {
%>
<div class="mb-3">
    <label for="codGrupo" class="form-label">Ingrese codigo grupo asignado por su profesor</label>
    <input type="text" class="form-control" name="CodGrupo" placeholder="Ejm. 301" required>
</div>
<%
    }
%>
