<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet"> 
	
	<title>Solicitar préstamo</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<main class="contenido-principal">
	
		<form>
			<h2>Solicitar un Préstamo</h2>
			
		    <div>
		        <label for="suma">Suma solicitada</label>
		        <input type="number" id="suma" name="suma" min="1" step="any" placeholder="Ingrese la suma solicitada" required>
		    </div>
		
		    <div>
		        <label for="cuotas">Cantidad de cuotas</label>
		        <select id="cuotas" name="cuotas" required>
		            <option value="">Seleccione la cantidad de cuotas</option>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <label for="cuenta">Cuenta</label>
		        <select id="cuenta" name="cuenta" required>
		            <option value="">Seleccione la cuenta donde recibirá el préstamo</option>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <button type="submit">Enviar</button>
		    </div>
		</form>
	</main>
	
	
</body>
</html>