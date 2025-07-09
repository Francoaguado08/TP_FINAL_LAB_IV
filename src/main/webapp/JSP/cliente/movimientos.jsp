<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Movimiento"%>

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
	
	<%
	    List<Movimiento> listaMovimientos = new ArrayList<Movimiento>();
	    if (request.getAttribute("listaMovimientos") != null) {
	        listaMovimientos = (List<Movimiento>) request.getAttribute("listaMovimientos");
	    }
	%>


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
				<table class="contenido.listado">
					<thead>
					    <tr>
					        <th>Fecha</th>
					        <th>Detalle</th>
					        <th>Importe</th>
					        <th>Tipo de movimiento</th>
					    </tr>
					</thead>
					
					<tbody>
	                <%
                    	if (listaMovimientos != null && !listaMovimientos.isEmpty()) {
                        	for (Movimiento m : listaMovimientos) {
               		%>
                		<tr>
	                        <td><%= m.getFecha() %></td>
	                        <td><%= m.getDetalle() %></td>
	                        <td><%= m.getImporte() %></td>
	                        <td><%= m.getTipoMovimiento().getDescripcion() %></td>
                    	</tr>
                	<%
                    		}
                    	} else {
                	%>
	                    <tr>
	                        <td colspan="7">No se encontraron movimientos para esta cuenta.</td>
	                    </tr>
                	<%
                    	}
                	%>
                	
	                </tbody>
				</table>
				
				<%
				    int paginaActual = (int) request.getAttribute("paginaActual");
				    int totalPaginas = (int) request.getAttribute("totalPaginas");
				    int nCuenta = (int) request.getAttribute("nCuenta");
				%>
				
				<div class="paginacion">
				    <ul>
				        <% for (int i = 1; i <= totalPaginas; i++) { %>
				            <li style="display:inline; margin:0 5px;">
				                <% if (i == paginaActual) { %>
				                    <strong><%= i %></strong>
				                <% } else { %>
				                    <a href="MovimientosServlet?Param=lista&nCuenta=<%= nCuenta %>&pagina=<%= i %>"><%= i %></a>
				                <% } %>
				            </li>
				        <% } %>
				    </ul>
				</div>
				
			</section>
		</main>

	</body>
</html>