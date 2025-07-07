<%@page import="entidades.Prestamo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloMenu.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet"> 
	
	<title>Listado Cuentas</title>
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
                <table>
                    <thead>
                        <tr>
                        	<th>Prestamo</th>
                            <th>Cliente</th>
                            <th>Cuenta a acreditar</th>
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

</body>
</html>