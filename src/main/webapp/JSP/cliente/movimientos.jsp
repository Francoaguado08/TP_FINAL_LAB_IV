<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movimientos</title>
<link href="../css/estiloMenu.css" rel="stylesheet">
</head>
<body>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
				<ul class="menu">
					<li>
						<a href="#">Cuentas</a>
					</li>
					<li>
						<a href="#">Transferencias</a>
					</li>
					<li>
						<a href="#">Solicitar Préstamo</a>
					</li>
					<li>
						<a href="#">Pagar Préstamos</a>
					</li>
					<li>
						<a href="#">Información Personal</a>
					</li>	
				</ul>
			</nav>
		</div>


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