
<%
    if (session.getAttribute("profe") != null) {
%>
<label for="profesion" class="form-label">Cuenta con estudios didacticos</label><br>
<select name="estudios" class="form-select" aria-label="Default select example">
    <option value="si">Si</option>
    <option value="no">No</option>
</select>
<%
    }
%>
