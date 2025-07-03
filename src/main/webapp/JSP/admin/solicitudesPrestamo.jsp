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
		<section class="hospital-info">
                <h1>Solicitudes de préstamo</h1>
            </section>
                <table>
                    <thead>
                        <tr>
                            <th>Cliente (ID)</th>
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
                                <td><%=p.getIdCliente()%></td>
                                <td><%=p.getFecha()%></td>
                                <td>$<%=p.getImportePedido()%></td>
                                <td>$<%=p.getImporteAPagar()%></td>
                                <td><%=p.getPlazoPagoMeses()%></td>
                                <td>$<%=p.getMontoPorMes()%></td>
                                <td>
                                    <a href="#" class="btnAccion">Aprobar</a>
                                    <a href="#" class="btnEliminar">Rechazar</a>
                                </td>
                            </tr>
							 <% } %>
                    </tbody>
                </table>
            </section>

</body>
</html>