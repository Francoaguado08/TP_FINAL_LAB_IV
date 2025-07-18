<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="entidades.CuentaListado"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet"> 
	
	<title>Transferencia</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<%
		CuentaListado c = new CuentaListado();
		if (request.getAttribute("cuenta") != null) 
		{
			c = (CuentaListado) request.getAttribute("cuenta");
		}
	%>
	
	
		<!-- Mensaje -->
		
	<div class="mensajes">
    <%
        String msg = request.getParameter("msg");
        if ("ok".equals(msg)) {
    %>
        <p class="mensajeCorrecto">Transferencia realizada con éxito.</p>
    <%
        } else if ("cuentaOrigenInexistente".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">La cuenta origen no existe o está inactiva.</p>
    <%
        } else if ("cuentaDestinoInexistente".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">La cuenta destino no existe o está inactiva.</p>
    <%
        } else if ("importeInvalido".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">El importe ingresado es inválido.</p>
    <%
        } else if ("saldoInsuficiente".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">Saldo insuficiente para realizar la transferencia.</p>
    <%
        } else if ("mismaCuenta".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">No se puede transferir a la misma cuenta.</p>
    <%
        } else if ("falloTransferencia".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">Error inesperado al realizar la transferencia.</p>
    <%
        } else if ("excepcion".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">Se produjo un error inesperado. Intente nuevamente.</p>
    <%
        } else if ("paramError".equals(msg)) {
    %>
        <p class="mensajeIncorrecto">Faltan datos o el importe es inválido.</p>
    <%
        }
    %>
</div>

			
			
			
	<!-- Form -->
	<main class="contenido-principal">
		
		<form method ="post" action="${pageContext.request.contextPath}/MovimientosServlet">
			<input type="hidden" name="nCuentaOrigen" value="<%= c.getNroCuenta() %>" />
			<input type="hidden" name="Param" value="transferir" />
			<h2>Transferencia</h2>
			<div>
			
			<h3>Estas utilizando la cuenta con nro: <%=c.getNroCuenta() %> - <%=c.getTipoCuenta() %></h3>
			</div>
			
		    <div>
		        <label for="destino">CBU o Nro. de cuenta destino</label>
		        <input type="number" id="destino" name="destino" placeholder="Ingrese CBU o Nº de cuenta" required>
		    </div>
		
		    <div>
		        <label for="suma">Suma a transferir</label>
		        <input type="number" id="suma" name="suma" min="1" step="any" placeholder="Ingrese la suma a transferir" required>
		    </div>
		
		    <div>
		        <button type="submit">Enviar</button>
		    </div>
		</form>
	</main>
</body>
</html>