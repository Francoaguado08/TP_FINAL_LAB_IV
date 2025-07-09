<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloMenu.css" rel="stylesheet">
	
	<title>Menú Admin</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<main class="contenido-central">
		<img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo del Banco" class="logo-central">
    	<h1>Bienvenido! <span><%=session.getAttribute("usuario")%></span></h1>
	</main>


</body>
</html>