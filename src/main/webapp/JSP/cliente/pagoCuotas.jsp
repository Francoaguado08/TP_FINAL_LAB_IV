<%@page import="entidades.Cuenta"%>
<%@page import="entidades.Cuota"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<!-- CSS de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet">
	
	<title>Pago de cuotas</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	
	<%
		List<Cuota> l = null;
		if(request.getAttribute("listacuotas")!=null){
		l = (List<Cuota>) request.getAttribute("listacuotas");
		}
	%>
	
	<%
		List<Cuenta> lc = null;
		if(request.getAttribute("listacuentas")!=null){
		lc = (List<Cuenta>) request.getAttribute("listacuentas");
		}
	%>

	<main class="contenido-principal">
	
		<h1>Mis prestamos</h1>
	
	   		<%
		   		if(request.getAttribute("mensajeExito") != null) {
			%>
		   
			<div style="color:green">
   				<%= request.getAttribute("mensajeExito") %>
   	 		</div>
   	 		
			<% 
				} 
			%>
	
		<section class="grid-container">
	
   		<%
   			if(request.getAttribute("mensajeError") != null) { 
   		%>
   		
  		<div style="color:red">
			<%= request.getAttribute("mensajeError") %>
   	 	</div>
   	 	
		<%
			} 
		%>
		
			<table id="tablaCuotas">
				<thead>
					<tr>
						<th>ID Prestamo</th>
						<th>Número de cuota</th>
						<th>Monto a pagar</th>             
						<th>Cuenta para abonar</th>
						<th></th>
					</tr>   
				</thead>
				
		  		<tbody>
  					<% for(Cuota c : l) { %>
    				<tr>
   						<form action="${pageContext.request.contextPath}/CuotasServlet" method="post">
   						
	       		 			<td><input type="text" name="idPrestamo" value="<%= c.getIdPrestamo() %>" readonly style="border:none; background:transparent;"></td>
	       		 			<td><input type="text" name="nroCuota" value="<%= c.getNroCuota() %>" readonly style="border:none; background:transparent;;"></td>
	       		 			<td><input type="text" name="monto" value="<%= c.getMonto() %>" readonly style="border:none; background:transparent;"></td>
	
	        				<td>
	          					<select name="cuentaSeleccionada" required>
	            				<option disabled selected>Seleccione una cuenta</option>
	            				<% for(Cuenta cs : lc) { %>
	              				<option value="<%= cs.getNroCuenta() %>"><%= cs.getNroCuenta() %></option>
	            				<%
	            					} 
	            				%>
	          					</select>
	        				</td>
	
	        				<td>
	          					<button class = "btnAccion" type="submit" style="width: auto" name = "click" onclick="return confirm('¿Querés pagar esta cuota?');">Pagar</button>
	        				</td>
        				
     	 				</form>
    				</tr>
    				
  					<%
  					} 
  					%>
  					
				</tbody>
			</table>
		</section>
	</main>
	
	
	<!-- jQuery (requerido por DataTables) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

    <!-- JS de DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	<script>
	  $(document).ready(function () {
	    $('#tablaCuotas').DataTable({
	      "searching": false,       
	      "lengthChange": false,     
	      "info": false,             
	      "pagingType": "simple_numbers",   
	      "pageLength": 10,           
	      "language": {
	        "paginate": {
	          "previous": "Anterior",
	          "next": "Siguiente"
	        },
	        "emptyTable": "No hay movimientos disponibles"
	      },
	      "columnDefs": [
	          {
				"targets": [3, 4],  // Índices de las columnas que querés desactivar (empieza en 0)
				"orderable": false
				}
			]
	    });
	  });
  </script>
	

</body>
</html>