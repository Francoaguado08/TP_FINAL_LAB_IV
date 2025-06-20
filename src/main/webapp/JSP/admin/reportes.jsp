<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloLista.css" rel="stylesheet"> 

<title>Reportes</title>
</head>
<body>

<h2>Generar Reporte de Ingresos/Egresos</h2>

    <form action="#" method="post"> 
        <label>Desde:</label>
        <input type="date" name="fechaInicio" required>
        <label>Hasta:</label>
        <input type="date" name="fechaFin" required>
        <button type="submit">Generar</button>
    </form>

    <hr>

    <h3>Resultados del reporte</h3>
    <p><strong>Total Ingresos:</strong> $25,000.00</p>
    <p><strong>Total Egresos:</strong> $18,750.00</p>
    <p><strong>Diferencia:</strong> $6,250.00</p>




</body>
</html>