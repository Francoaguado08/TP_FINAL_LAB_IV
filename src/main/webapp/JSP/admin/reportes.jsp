<%@page import="entidades.ReporteResultado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="entidades.Movimiento" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<!-- Bootstrap solo para utilidades -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Tus estilos -->
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">


	<title>Reportes</title>
</head>

<body>

	<jsp:include page="../navbar/navAdmin.jsp"/>

	<main class="contenido-principal">

		<h1 class="text-center mb-4">Generar Reporte de Ingresos/Egresos</h1>

		<!-- Formulario con tu estilo, alineado con Bootstrap -->
		<div class="d-flex justify-content-center">
			<form action="${pageContext.request.contextPath}/ReportesServlet" method="post" class="formulario-reporte">
				<div class="form-group mb-3">
					<label for="desde"><strong>Desde:</strong></label>
					<input type="date" name="desde" id="desde" required
					       value="<%= request.getAttribute("desde") != null ? request.getAttribute("desde") : "" %>">
				</div>
				
				<div class="form-group mb-3">
					<label for="hasta"><strong>Hasta:</strong></label>
					<input type="date" name="hasta" id="hasta" required
					       value="<%= request.getAttribute("hasta") != null ? request.getAttribute("hasta") : "" %>">
				</div>
				
				<div class="form-group text-center">
					<button type="submit" class="btn-generar">Generar</button>
				</div>
			</form>
		</div>

		<!-- Mensaje -->
		<div class="container mt-4">
			<%
			    String mensaje = (String) request.getAttribute("mensaje");
			    String tipo = (String) request.getAttribute("tipoMensaje"); // "success", "danger"
			    if (mensaje != null && tipo != null) {
			%>
			    <div class="alert alert-<%= tipo %> text-center fw-semibold" role="alert">
			        <%= mensaje %>
			    </div>
			<%
			    }
			%>

			<!-- Resultados -->
			<%
			    ReporteResultado resultado = (ReporteResultado) request.getAttribute("resultado");
			    if (resultado != null) {
			%>
			    <div class="resultado-reporte text-center mt-4">
			        <h2 class="mb-3">Resultados del reporte</h2>
			        <p><strong>Total Ingresos:</strong> $<%= resultado.getTotalIngresos() %></p>
			        <p><strong>Total Egresos:</strong> $<%= resultado.getTotalEgresos() %></p>
			        <p><strong>Diferencia:</strong>
			            <span class="<%= resultado.getDiferencia() >= 0 ? "text-success" : "text-danger" %>">
			                $<%= resultado.getDiferencia() %>
			            </span>
			        </p>
			    </div>
			<%
			    }
			%>
		</div>

	</main>

</body>
</html>