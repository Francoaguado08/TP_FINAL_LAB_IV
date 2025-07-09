<%@page import="entidades.Prestamo"%>
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
	<link href="${pageContext.request.contextPath}/css/estiloMenu.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet"> 
	
	<title>Listado préstamos</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<%
		List<Prestamo> l = null;
		if(request.getAttribute("listaP")!=null){
		l = (List<Prestamo>) request.getAttribute("listaP");
		}
	%>
	
	<section class="grid-container">
		<section>
                <h1>Solicitudes de préstamo</h1>
                
    <% if(request.getAttribute("mensaje") != null) { %>
  	<div style="color:green">
   	<%= request.getAttribute("mensaje") %>
   	 </div>
	<% } %>
	
	<% if(request.getAttribute("error") != null) { %>
  	<div style="color:red">
   	<%= request.getAttribute("error") %>
   	 </div>
	<% } %>
	
	<% if(request.getAttribute("rechazado") != null) { %>
  	<div style="color:red">
   	<%= request.getAttribute("rechazado") %>
   	 </div>
	<% } %>
	
            </section>
            
            
            
			<form class="filter-box" action="${pageContext.request.contextPath}PrestamosAcepRechServlet" method="get">
            	<label for="busqueda">Buscar por numero de cliente</label>
  				<input type="text" name="filtro" placeholder="Ejemplo: 1" required> 
  				<button type="submit" name = "filtroBtn">Buscar</button>
  			</form>
            
                <table id="tablaPrestamos">
                    <thead>
                        <tr>
                        	<th>ID Prestamo</th>
                            <th>ID Cliente</th>
                            <th>Nro. Cuenta a acreditar</th>
                            <th>Fecha de solicitud</th>
                            <th>Importe solicitado</th>
                            <th>Importe con intereses</th>
                            <th>Cantidad de cuotas</th>
                            <th>Monto mensual</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                            <% for(Prestamo p : l) { %>
                            <tr>
                            	<td><%=p.getIdPrestamo()%></td>
                                <td><%=p.getIdCliente()%></td>
                                <td><%=p.getCuentaDepositar()%></td>
                                <td><%=p.getFecha()%></td>
                                <td>$<%=p.getImportePedido()%></td>
                                <td>$<%=p.getImporteAPagar()%></td>
                                <td><%=p.getPlazoPagoMeses()%></td>
                                <td>$<%=p.getMontoPorMes()%></td>
                                <td>
                                    <a href="PrestamosAcepRechServlet?Param=aprobar&id=<%= p.getIdCliente() %>&cuenta=<%= p.getCuentaDepositar() %>&saldo=<%=p.getImportePedido()%>&prestamo=<%=p.getIdPrestamo()%>&mensual=<%=p.getMontoPorMes()%>&cuotas=<%=p.getPlazoPagoMeses()%>" class="btnAccion"
                                    onclick="return confirm('¿Queres aprobar este prestamo?');">Aprobar</a>
                                    <a href="PrestamosAcepRechServlet?Param=rechazar&prestamoR=<%=p.getIdPrestamo()%>" class="btnEliminar" onclick="return confirm('¿Queres rechazar este prestamo?');">Rechazar</a>
                                </td>
                            </tr>
							 <%}; %>
							 
                    </tbody>
                </table>
            </section>
            
            

    <!-- jQuery (requerido por DataTables) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

    <!-- JS de DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    
    
   <script>
	  $(document).ready(function () {
	    $('#tablaPrestamos').DataTable({
	      "searching": false,       
	      "lengthChange": false,     
	      "info": false,             
	      "pagingType": "simple_numbers",   
	      "pageLength": 5,           
	      "language": {
	        "paginate": {
	          "previous": "Anterior",
	          "next": "Siguiente"
	        },
	        "emptyTable": "No hay prestamos disponibles"
	      },
	    "columnDefs": [
	        {
	          "targets": [8],  // Índices de las columnas que querés desactivar (empieza en 0)
	          "orderable": false
	        }
	      ]
	    });
	  });
  </script>

</body>
</html>