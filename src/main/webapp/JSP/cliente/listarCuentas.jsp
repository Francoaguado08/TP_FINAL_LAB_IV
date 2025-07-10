<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.CuentaListado"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Listado Cuentas</title>
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloLista.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<%
	    List<CuentaListado> listaCuentas = new ArrayList<CuentaListado>();
	    if (request.getAttribute("listaCuentas") != null) {
	        listaCuentas = (List<CuentaListado>) request.getAttribute("listaCuentas");
	    }
	%>
	
	<section class="grid-container">
		<section>
            <h1>Acceder a una Cuenta</h1>
        </section>

        <table>
            <thead>
                <tr>
                    <th>N° Cuenta</th>
                    <th>Tipo de Cuenta</th>
                    <th>CBU</th>
                    <th>CUIL</th>
                    <th>Saldo</th>
                    <th>Fecha de creación</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listaCuentas != null && !listaCuentas.isEmpty()) {
                        for (CuentaListado cuenta : listaCuentas) {
                %>
                    <tr>
                        <td><%= cuenta.getNroCuenta() %></td>
                        <td><%= cuenta.getTipoCuenta() %></td>
                        <td><%= cuenta.getCbu() %></td>
                        <td><%= cuenta.getCuil() %></td>
                        <td>$ <%= cuenta.getSaldo() %></td>
                        <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(cuenta.getFechaCreacion()) %></td>
                        <td><a href="CuentasServlet?Param=obtener&id=<%=cuenta.getNroCuenta()%>" class="btnAccion">Seleccionar</a>

                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7">No se encontraron cuentas para este cliente.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </section>
</body>
</html>
