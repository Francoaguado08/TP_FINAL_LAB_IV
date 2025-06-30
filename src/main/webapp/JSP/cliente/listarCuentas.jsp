<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	
	<section class="grid-container">
			<section>
                <h1>Acceder a una Cuenta</h1>
            </section>
	
                <table class="contenido.listado">
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
                            <tr>
                                <td>123456789</td>
                                <td>Caja de ahorro</td>
                                <td>0000002323154312</td>
                                <td>11-22333444-1</td>
                                <td>$150.250,00</td>
                                <td>28/9/2009</td>
                                <td>
                                	<a href="#" class="btnAccion">Seleccionar</a>
                                </td>
                            </tr>
                    </tbody>
                </table>
            </section>


</body>
</html>