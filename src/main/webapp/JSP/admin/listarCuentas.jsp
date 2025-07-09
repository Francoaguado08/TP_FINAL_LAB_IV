<%@page import="entidades.CuentaListado"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	
	<title>Listado de Cuentas</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
<%
    List<CuentaListado> listaCuentas = new ArrayList<CuentaListado>();
    if (request.getAttribute("listaCuentas") != null) {
        listaCuentas = (List<CuentaListado>) request.getAttribute("listaCuentas");
    }
%>

	<!-- Contenido principal -->
    <main class="contenido-principal">
        <div class="contenido-listado">

            <!-- Títulos -->
			<h2>Listado de cuentas</h2>
            
            <!-- Filtros -->
            <section class="filter-box">
                <form method="get" action="<%= request.getContextPath() %>/CuentasServlet">
                	<input type="hidden" name="Param" value="lista" />
                    <label for="nCuenta">Buscar por Número de cuenta</label>
                    <input type="text" name="nCuenta" id="nCuenta" placeholder="Ingrese Número de Cuenta">

                    <label for="cuil">Buscar por CUIL</label>
                    <input type="text" name="cuil" id="cuil" placeholder="Ingrese el CUIL">

                    <button type="submit">Filtrar</button>
                </form>
            </section>
			
			<!-- Mensaje -->
		
			<div class="mensajes">
			<%
			    String msg = request.getParameter("msg");
			    if ("eliminado".equals(msg)) {
			%>
			    <p class="mensajeCorrecto">Cuenta eliminada correctamente.</p>
			<%
			    }else if ("error".equals(msg)) {
			%>
				<p class="mensajeIncorrecto">Error al eliminar</p>
			<%
			    }else if ("modificar".equals(msg)) {
			%>
				<p class="mensajeCorrecto">Cuenta modificada correctamente</p>
			<%
			    }else if ("errorModificar".equals(msg)) {
			%>
				<p class="mensajeIncorrecto">Error al modificar</p>
			<%
			    }
			    
			%>
			</div>
			
            <!-- Tabla -->
            <section class="grid-container">
                <table id="tablaCuentas">
                    <thead>
                        <tr>
                            <th>N° Cuenta</th>
                            <th>Tipo de Cuenta</th>
                            <th>CBU</th>
                            <th>CUIL</th>
                            <th>Saldo</th>
                            <th>Fecha de creación</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
					<tbody>
					    <%
					        if (listaCuentas != null) {
					            for (CuentaListado cuenta : listaCuentas) {
					    %>
					    <tr>
					        <td><%= cuenta.getNroCuenta() %></td>
					        <td><%= cuenta.getTipoCuenta() %></td>
					        <td><%= cuenta.getCbu() %></td>
					        <td><%= cuenta.getCuil() %></td>
					        <td>$ <%= cuenta.getSaldo() %></td>
					        <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(cuenta.getFechaCreacion()) %></td>
					        <td>
					            <a href="CuentasServlet?Param=editar&id=<%=cuenta.getNroCuenta()%>" class="btnAccion">Editar</a>
					         </td>
							<td>
							<a href="CuentasServlet?Param=eliminar&nro=<%=cuenta.getNroCuenta()%>" 
							   class="btnEliminar" 
							   onclick="return confirm('¿Estás seguro de que querés eliminar esta cuenta?');">Eliminar</a> <!-- msj localhost -->
							</td>
					       
					    </tr>
					    <%
					            }
					        } else {
					    %>
					    <tr><td colspan="7">No hay cuentas para mostrar</td></tr>
					    <%
					        }
					    %>
					</tbody>

                </table>
            </section>
        </div>
    </main>
    
    
    <!-- jQuery (requerido por DataTables) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

    <!-- JS de DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    
    
   <script>
	  $(document).ready(function () {
	    $('#tablaCuentas').DataTable({
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
	        "emptyTable": "No hay cuentas disponibles"
	      },
	      "columnDefs": [
          {
			"targets": [6, 7],  // Índices de las columnas que querés desactivar (empieza en 0)
			"orderable": false
			}
		]
	    });
	  });
  </script>

    
</body>
</html>