<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloMenu.css" rel="stylesheet">
	<link href="../css/estiloLista.css" rel="stylesheet"> 
	
	<title>Listado Cuentas</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<section class="grid-container">
		<section class="hospital-info">
                <h1>Solicitudes de préstamo</h1>
            </section>
                <table>
                    <thead>
                        <tr>
                            <th>CUIL</th>
                            <th>Fecha de solicitud</th>
                            <th>Importe solicitado</th>
                            <th>Importe con intereses</th>
                            <th>Cantidad de cuotas</th>
                            <th>Monto mensual</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>11-22.333.444-1</td>
                                <td>28/02/2025</td>
                                <td>$100.150,00</td>
                                <td>$150.250,00</td>
                                <td>12</td>
                                <td>$12.520,00</td>
                                <td>
                                    <a href="#" class="btnAccion">Aprobar</a>
                                    <a href="#" class="btnEliminar">Rechazar</a>
                                </td>
                            </tr>
                    </tbody>
                </table>
            </section>

</body>
</html>