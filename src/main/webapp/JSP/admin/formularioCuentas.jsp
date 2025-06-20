<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloForm.css" rel="stylesheet">
<link href="../css/estiloLista.css" rel="stylesheet"> 

<title>Crear Cuenta</title>
</head>
<body>

	<header>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
				<ul class="menu">
					<li class="dropdown">
						<a href="#">Clientes</a>
						<ul class="submenu">
							<li><a href="#">Listar-Modificar-Eliminar</a></li>
							<li><a href="#">Alta</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#">Cuentas</a>
						<ul class="submenu">
							<li><a href="#">Listar-Modificar-Eliminar</a></li>
							<li><a href="#">Alta</a></li>
						</ul>
					</li>
					<li><a href="#">Préstamos</a></li>
					<li><a href="#">Reportes</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section class="hospital-info">
		<h1>Crear Cuenta</h1>
    </section>
	
	<main class="contenido-principal">
		<form>
		    <div>
		        <label for="nCuenta">N° Cuenta</label>
		        <input type="text" id="ncuenta" name="ncuenta" value="123456789" readonly>
		    </div>

		    <div>
		        <label for="cuil">CUIL</label>
		        <input type="text" id="cuil" name="cuil" value="">
		    </div>

		    <div>
		        <label for="tipoCuenta">Tipo de Cuenta</label>
		        <select id="tipoCuenta" name="tipoCuenta" required>
		            <option value="">Seleccione el tipo de cuenta</option>
		        </select>
		    </div>
		    
		    <div>
		    <button type="submit">Crear Cuenta</button>
		    </div>

		</form>
	</main>
	
</body>
</html>