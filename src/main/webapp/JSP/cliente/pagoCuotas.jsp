<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloLista.css" rel="stylesheet">
	
	<title>Pago de cuotas</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>

	<main class="contenido-principal">
	
		<h1>Mis prestamos</h1>
	
		<section class="grid-container">
		
			<table>
				<thead>
					<tr>
						<th>ID Préstamo</th>
						<th>Número de cuota</th>
						<th>Monto a pagar</th>             
						<th>Cuenta para abonar</th>
						<th></th>
					</tr>   
				</thead>
				
				<tbody>
		            <c:forEach var="cuota" items="${listaCuotasPendientes}">
		                <tr>
		                    <td>${cuota.idPrestamo}</td>
		                    <td>${cuota.numero}</td>
		                    <td>${cuota.monto}</td>
		                    <td>
		                    	<select>
		                    	  <option value="cuenta">Seleccione una cuenta</option>
		                    	</select>
		                    </td>
		                    <td>
		                        <a href="#" class="btnAccion">Pagar</a>
		                    </td>
		                </tr>
		            </c:forEach>
	           	</tbody>
			</table>
		</section>
	
	</main>

</body>
</html>