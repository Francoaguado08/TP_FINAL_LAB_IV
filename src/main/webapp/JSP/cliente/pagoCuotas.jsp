<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloMenu.css" rel="stylesheet">
	
	<title>Pagos</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>

	<h1 class="misP">Mis prestamos</h1>
	
	<table class="Prestamos" border="1">  
	<tr>
		<th>Cliente</th>
		<th>Fecha de prestamo</th>
		<th>Fecha actual</th>
		<th>Cuenta</th>             
		<th>Importe a pagar</th>
	</tr>           
	<tr>
		<td></td>
	 	<td></td>
	 	<td></td>
	 	<td><select>
	 	
	 	</select>
	 	</td>  
	 	<td></td>
	 	<td><input class="btnPago" type="submit" name="btnPagar" value="Pagar"></td>        
	</tr>
	</table>

</body>
</html>