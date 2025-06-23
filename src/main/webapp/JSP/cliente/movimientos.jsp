<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloMenu.css" rel="stylesheet">
	
	<title>Movimientos</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>


<h1 class="movTitulo">Movimientos</h1>

<div class="filtros-container">
    <h3 class="filtros-titulo">Filtrar por Importe</h3>
    <form class="filtros-form">
        <div class="filtro">
           Minimo<input type="text" class="filtro-input" placeholder="Ej: 1000">
        </div>
        <div class="filtro">
            Maximo<input type="text" class="filtro-input" placeholder="Ej: 5000">
        </div>
        <button type="submit" class="btnFiltrar">Aplicar Filtros</button>
          </form>
</div>

<table class="Movimientos" border="1">  
<tr>
	<th>Fecha</th>
	<th>Detalle</th>
	<th>Importe</th>
	<th>Tipo de movimiento</th>             
</tr>           
<tr>
	<td></td>
 	<td></td>
 	<td></td>
 	<td></td>    
 	      
</tr>
</table>
</body>
</html>