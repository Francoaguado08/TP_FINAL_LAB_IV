<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8" />
	<link href="../css/normalize.css" rel="stylesheet">
	<link href="../css/estilos.css" rel="stylesheet">
	<link href="../css/estiloForm.css" rel="stylesheet">
	
	<title>Agregar Cliente</title>
</head>

<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>

    <main class="contenido-principal">
		<form method="post" action="AgregarClienteServlet">
		
			<h2>Agregar Cliente</h2>

			<div>
				<label for="dni">DNI</label>
				<input type="text" name="dni" id="dni" placeholder="Ingrese DNI" required>
			</div>

			<div>
				<label for="cuil">CUIL</label>
				<input type="text" name="cuil" id="cuil" placeholder="Ingrese CUIL" required>
			</div>

			<div>
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" placeholder="Ingrese nombre" required>
			</div>

			<div>
				<label for="apellido">Apellido</label>
				<input type="text" name="apellido" id="apellido" placeholder="Ingrese apellido" required>
			</div>

			<div>
				<label for="sexo">Sexo</label>
				<select name="sexo" id="sexo">
					<option value="M">Masculino</option>
					<option value="F">Femenino</option>
					<option value="X">Otro</option>
				</select>
			</div>

			<div>
				<label for="nacionalidad">Nacionalidad</label>
				<select name="nacionalidad" id="nacionalidad">
					<option value="AR">Argentina</option>
					<option value="CL">Chile</option>
					<option value="OT">Otro</option>
				</select>
			</div>

			<div>
				<label for="fechaNacimiento">Fecha de Nacimiento</label>
				<input type="date" name="fechaNacimiento" id="fechaNacimiento" required>
			</div>

			<div>
				<label for="direccion">Dirección</label>
				<input type="text" name="direccion" id="direccion" placeholder="Ingrese dirección" required>
			</div>

			<div>
				<label for="provincia">Provincia</label>
				<select name="provincia" id="provincia" onchange="this.form.submit()">
					<c:forEach var="prov" items="${listaProvincias}">
						<option value="${prov.id}">${prov.nombre}</option>
					</c:forEach>
				</select>
			</div>

			<div>
				<label for="localidad">Localidad</label>
				<select name="localidad" id="localidad">
					<c:forEach var="loc" items="${listaLocalidades}">
						<option value="${loc.id}">${loc.nombre}</option>
					</c:forEach>
				</select>
			</div>

			<div>
				<label for="email">Correo Electrónico</label>
				<input type="email" name="email" id="email" placeholder="ejemplo@correo.com" required>
			</div>

			<div>
				<label for="telefono">Teléfono</label>
				<input type="text" name="telefono" id="telefono" placeholder="Ingrese teléfono" required>
			</div>

			<div>
				<label for="username">Nombre de Usuario</label>
				<input type="text" name="username" id="username" placeholder="Ingrese nombre de usuario" required>
			</div>

			<div>
				<label for="password">Contraseña</label>
				<input type="password" name="password" id="password" placeholder="Ingrese contraseña" required>
			</div>

			<div>
				<label for="confirmPassword">Confirmar Contraseña</label>
				<input type="password" name="confirmPassword" id="confirmPassword" placeholder="Repita la contraseña" required>
			</div>

			<div>
				<button type="submit">Agregar Cliente</button>
			</div>

			<div class="mensaje-resultado">
				<span>${mensaje}</span>
			</div>

		</form>
	</main>

</body>
</html>