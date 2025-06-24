<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloForm.css" rel="stylesheet"> 
	
	<title>Transferencia</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<!-- Form -->
	<main class="contenido-principal">
		
		<form>
			<h2>Transferencia</h2>
			<div>
			
			<h3>Estas utilizando la cuenta: Cuenta</h3>
			</div>
			
		    <div>
		        <label for="cbu">CBU</label>
		        <input type="number" id="cbu" name="cbu" placeholder="Ingrese el cbu a transferir" required>
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