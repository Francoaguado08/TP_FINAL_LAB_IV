<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloForm.css" rel="stylesheet">

<title>Información Usuario</title>

</head>
<body>
<!-- NAVBAR -->
	<header class="nav-bg">
		<nav class="navegacion-principal">
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
	</header>

<!-- FORM SOLO LECTURA -->
	<main class="contenido-principal">
		<form>
		    <div>
		        <label for="id">ID</label>
		        <input type="text" id="id" name="id" value="000023" readonly>
		    </div>

		    <div>
		        <label for="dni">DNI</label>
		        <input type="text" id="dni" name="dni" value="44.555.666" readonly>
		    </div>

		    <div>
		        <label for="cuil">CUIL</label>
		        <input type="text" id="cuil" name="cuil" value="11-44.555.666-1" readonly>
		    </div>

		    <div>
		        <label for="nombre">Nombre </label>
		        <input type="text" id="nombre" name="nombre" value="Juan" readonly>
		    </div>

		    <div>
		        <label for="apellido">Apellido</label>
		        <input type="text" id="apellido" name="apellido" value="Pérez" readonly>
		    </div>

		    <div>
		        <label for="sexo">Sexo</label>
		        <input type="text" id="sexo" name="sexo" value="Masculino" readonly>
		    </div>

		    <div>
		        <label for="nacionalidad">Nacionalidad</label>
		        <input type="text" id="nacionalidad" name="nacionalidad" value="Argentina" readonly>
		    </div>

		    <div>
		        <label for="fechaNacimiento">Fecha de Nacimiento</label>
		        <input type="text" id="fechaNacimiento" name="fechaNacimiento" value="04/05/1999" readonly>
		    </div>

		    <div>
		        <label for="direccion">Dirección</label>
		        <input type="text" id="direccion" name="direccion" value="Calle 1" readonly>
		    </div>

		    <div>
		        <label for="localidad">Localidad</label>
		        <input type="text" id="localidad" name="localidad" value="San Isidro" readonly>
		    </div>

		    <div>
		        <label for="provincia">Provincia</label>
		        <input type="text" id="provincia" name="provincia" value="Buenos Aires" readonly>
		    </div>

		    <div>
		        <label for="email">Correo Electrónico</label>
		        <input type="text" id="email" name="email" value="Juan.Perez@Gmail.com" readonly>
		    </div>

		    <div>
		        <label for="telefono">Teléfono</label>
		        <input type="text" id="telefono" name="telefono" value="11-222-333" readonly>
		    </div>
		</form>
	</main>
</body>
</html>