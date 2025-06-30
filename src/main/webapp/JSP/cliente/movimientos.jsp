<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet">
	
	<title>Movimientos</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>

	<!-- Títulos -->
	<h1>Movimientos</h1>


	<main class="contenido-principal">
	
		<section class="filter-box">
			
		    <h3>Filtrar por Importe</h3>
		    
		    <form>
		    	 <label>Mínimo</label>
	             <input type="text" name="importeMinimo" id="importeMinimo" placeholder="Ej: 1000">
	             
	             <label>Máximo</label>
	             <input type="text" name="importeMaximo" id="importeMaximo" placeholder="Ej: 5000">
	             
		        <button type="submit">Aplicar Filtros</button>
			</form>
		</section>
	
	
		<section class="grid-container">
				<table>
					<thead>
					    <tr>
					        <th>Fecha</th>
					        <th>Detalle</th>
					        <th>Importe</th>
					        <th>Tipo de movimiento</th>
					        <th></th>
					    </tr>
					</thead>
					
					<tbody>
		                <c:forEach var="movimiento" items="${listaMovimientos}">
		                    <tr>
		                        <td>${movimiento.fecha}</td>
		                        <td>${movimiento.detalle}</td>
		                        <td>${movimiento.importe}</td>
		                        <td>${movimiento.tipoMovimiento}</td>
		                        <td>
		                            <a href="#" class="btnAccion">Editar</a>
		                            <a href="#" class="btnEliminar">Eliminar</a>
		                        </td>
		                    </tr>
		                </c:forEach>
	                </tbody>
				</table>
			</section>
		</main>

	</body>
</html>