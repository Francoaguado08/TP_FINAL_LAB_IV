<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Menú Cliente</title>
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloMenu.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<main class="contenido-central">
		<img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo del Banco" class="logo-central">
		<div>
	    	<h1>Bienvenido! <b><%=session.getAttribute("usuario") %></b></h1>
	    	<h3>Para consultar movimientos o realizar una transferencia seleccione una cuenta!</h3>
		</div>
	</main>
	
</body>
</html>