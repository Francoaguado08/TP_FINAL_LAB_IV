<%@page import="entidades.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8" />
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet">
	
	
	
	 <!-- CSS de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

    <!-- jQuery (requerido por DataTables) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

    <!-- JS de DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    
    
    
    
    
    <script type="text/javascript">
  	$(document).ready(function () {
   		 $('#tablaClientes').DataTable();
  	});
						</script>

	
	<title>Listado Clientes</title>
	
	
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<%
		List<Cliente> clientes = new ArrayList<Cliente>();
		if (request.getAttribute("listaClientes") != null) 
		{
			clientes = (List<Cliente>) request.getAttribute("listaClientes");
		}
	%>
	
	<!-- Títulos -->
	<h1>Listado Clientes</h1>
	
	<main class="contenido-principal">

	 <!-- Caja de Filtros -->
	    <section class="filter-box">
	    
	        <h3>Filtros</h3>
	        
	        <form method="get" action="ClientesServlet">
	        	<input type="hidden" name="Param" value="lista">
	        
	            <label for="dni">Buscar por DNI</label>
	            <input type="text" name="dni" id="dni" class="input" placeholder="Ingrese DNI">
	
	            <label for="usuario">Buscar por Usuario</label>
	            <input type="text" name="usuario" id="usuario" class="input" placeholder="Ingrese Usuario">
	
	            <button type="submit">Filtrar</button>
	        </form>
	        
	    </section>
		
		<!-- Mensaje -->
		
		<div class="mensajes">
		<%
		    String msg = request.getParameter("msg");
		    if ("eliminado".equals(msg)) {
		%>
		    <p class="mensajeCorrecto">Cliente eliminado correctamente.</p>
		<%
		    }else if ("error".equals(msg)) {
		%>
			<p class="mensajeIncorrecto">Error al eliminar</p>
		<%
		    }else if ("modificar".equals(msg)) {
		%>
			<p class="mensajeCorrecto">Cliente modificado correctamente</p>
		<%
		    }else if ("errorModificar".equals(msg)) {
		%>
			<p class="mensajeIncorrecto">Error al modificar</p>
		<%
		    }
		    
		    
		%>
		
		</div>
	
		
	    <!-- Tabla de clientes -->
	    <div class="grid-container">
	        <table id="tablaClientes">
	            <thead>
	                <tr>
	                    <th>ID Cliente</th>
	                    <th>CUIL</th>
	                    <th>DNI</th>
	                    <th>ID Usuario</th>
	                    <th>Nombre</th>
	                    <th>Apellido</th>
	                    <th>Sexo</th>
	                    <th>Nacionalidad</th>
	                    <th>Fecha Nacimiento</th>
	                    <th>Dirección</th>
	                    <th>Localidad</th>
	                    <th>Provincia</th>
	                    <th>Email</th>
	                    <th>Teléfono</th>
	                    <th></th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody>
	                	<%
							for (Cliente c : clientes) {
						%>
						
	                    <tr>
	                        <td><%=c.getIdCliente()%></td>
	                        <td><%=c.getCuil()%></td>
	                        <td><%=c.getDni()%></td>
	                        <td><%=c.getUsuario().getIdUsuario()%></td>
	                        <td><%=c.getNombre()%></td>
	                        <td><%=c.getApellido()%></td>
	                        <td><%=c.getSexo()%></td>
	                        <td><%=c.getNacionalidad()%></td>
	                        <td><%=c.getFechaNacimiento()%></td>
	                        <td><%=c.getDireccion()%></td>
	                        <td><%=c.getLocalidad()%></td>
	                        <td><%=c.getProvincia()%></td>
	                        <td><%=c.getCorreoElectronico()%></td>
	                        <td><%=c.getTelefono()%></td>
	                        
	                        <td><a href="ClientesServlet?Param=editar&id=<%=c.getIdCliente()%>" class="btnAccion">Editar</a></td>
	                        <td><a href="ClientesServlet?Param=eliminar&id=<%=c.getIdCliente()%>" 
							   class="btnEliminar" 
							   onclick="return confirm('¿Estás seguro de que querés eliminar este cliente?');">Eliminar</a> <!-- msj localhost -->
							</td>
	                    </tr>
	                    
	                    <%
							}
						%>
	                
	            </tbody>
	        </table>     
	    </div>
	
		
	</main>
   
</body>
</html>
