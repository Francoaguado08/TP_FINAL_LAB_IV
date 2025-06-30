<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entidades.TipoCuenta" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="<%= request.getContextPath() %>/css/normalize.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/estilos.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/estiloForm.css" rel="stylesheet">

	<title>Crear Cuenta</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>

		<main class="contenido-principal">
		
		<%
    String mensaje = (String) session.getAttribute("mensaje");
    if (mensaje != null) {
    %>
    <div style="color: <%= mensaje.startsWith("✅") ? "green" : "red" %>; font-weight: bold; margin-bottom: 10px;">
        <%= mensaje %>
    </div>
    <%
        session.removeAttribute("mensaje"); // Elimina el mensaje para que no se repita al refrescar
    }
    %>
		
		
		<form method="post" action="<%= request.getContextPath() %>/CuentasServlet">
		

		<input type="hidden" name="accion" value="insertar" />
			<h2>Crear Cuenta</h2>
			

		    <div>
		        <label for="ID Cliente">ID</label>
		        <input type="text" id="idCliente" name="idCliente" required>
		    </div>

		    <div>
		        <label for="tipoCuenta">Tipo de Cuenta</label>
		        <select id="tipoCuenta" name="tipoCuenta" required>
		            <option value="">Seleccione el tipo de cuenta</option>
		            <%
		                List<TipoCuenta> tiposCuenta = (List<TipoCuenta>) request.getAttribute("tiposCuenta");
		                if (tiposCuenta != null) {
		                    for (TipoCuenta tipo : tiposCuenta) {
		            %>
		                <option value="<%= tipo.getCodTipoCuenta() %>"><%= tipo.getNombre() %></option>
		            <%
		                    }
		                }
		                else {
		                	out.println("<p style='color:red;'>No llegó atributo tiposCuenta</p>");
		                }
		            %>
		        </select>
		    </div>

		    <div>
		        <label for="cbu">CBU</label>
		        <input type="text" id="cbu" name="cbu" maxlength="30" required>
		    </div>

		    <div>
		        <label for="fechaCreacion">Fecha de Creación</label>
		        <input type="date" id="fechaCreacion" name="fechaCreacion"
		               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
		               required>
		    </div>
		    
		    <div>
		        <button type="submit">Crear Cuenta</button>
		    </div>
		</form>
	</main>
</body>
</html>

