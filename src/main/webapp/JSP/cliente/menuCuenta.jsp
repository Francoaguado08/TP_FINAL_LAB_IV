<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloMenu.css" rel="stylesheet">
	<link href="../css/estiloLista.css" rel="stylesheet">
	<title>Menú Cuenta</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	 <!-- Contenido principal -->
    <main class="contenido-listado">
        <section class="hospital-info">
            <h1>Resumen de Cuenta</h1>
            <h2>Cuenta Corriente Nº 123456789</h2>
        </section>

        <div class="filter-box">
            <h2>Detalles de la Cuenta</h2>

            <p><strong>Titular:</strong> Juan Pérez</p>
            <p><strong>CBU:</strong> 0000002323154312</p>
            <p><strong>Tipo de Cuenta:</strong> Cuenta Corriente</p>
            <p><strong>Saldo Disponible:</strong> $150.250,00</p>
			
			<form action="movimientos.jsp" method="get">
                <button type="submit" class="button">Movimientos</button>
            </form>
            
            <form action="Transferencia.jsp" method="get">
                <button type="submit" class="button">Transferir</button>
            </form>
        </div>
    </main>

</body>
</html>