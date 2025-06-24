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
	
	<!--  Menú de navegación para el administrador -->
	<jsp:include page="../navbar/navAdmin.jsp"/>

    <main class="contenido-principal">
    
		<!-- Formulario que envía los datos al servlet ClientesServlet -->
		<form method="post" action="${pageContext.request.contextPath}/ClientesServlet">
			<input type="hidden" name="accion" value="insertar" />
		
			<h2>Agregar nuevo cliente</h2>

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
				<select name="sexo" id="sexo" required>
					<option value="M">Masculino</option>
					<option value="F">Femenino</option>
					<option value="X">Otro</option>
				</select>
			</div>


			<div>
				<label for="nacionalidad">Nacionalidad</label>
				<select name="nacionalidad" id="nacionalidad" required>
					<option value="">-- Seleccione --</option>
					<option value="Argentina">Argentina</option>
					<option value="Chile">Chile</option>
					<option value="Otro">Otro</option>
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

			
			
			<!-- Provincia con valores fijos (sin base de datos) -->
			<div>
				<label for="provincia">Provincia</label>
				<select name="provincia" id="provincia" required>
					<option value="">-- Seleccione una provincia --</option>
					<option value="Buenos Aires">Buenos Aires</option>
					<option value="CABA">CABA</option>
					<option value="Córdoba">Córdoba</option>
					<option value="Santa Fe">Santa Fe</option>
					<option value="Mendoza">Mendoza</option>
					<option value="Otra">Otra</option>
				</select>
			</div>
			
			
			
			
			

				<!-- Localidad como texto (sin tabla en BD) -->
			<div>
				<label for="localidad">Localidad</label>
				<input type="text" name="localidad" id="localidad" placeholder="Ingrese localidad" required />
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