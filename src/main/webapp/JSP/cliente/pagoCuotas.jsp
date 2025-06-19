<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagos</title>
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

<h1 class="misP">Mis prestamos</h1>

<table class="Prestamos" border="1">  
<tr>
	<th>Cliente</th>
	<th>Fecha de prestamo</th>
	<th>Fecha actual</th>
	<th>Cuenta</th>             
	<th>Importe a pagar</th>
</tr>           
<tr>
	<td></td>
 	<td></td>
 	<td></td>
 	<td><select>
 	
 	</select>
 	</td>  
 	<td></td>
 	<td><input class="btnPago" type="submit" name="btnPagar" value="Pagar"></td>        
</tr>
</table>

</body>
</html>