<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>


<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8" />
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">
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
				<input type="text" name="dni" id="dni" placeholder="Ingrese DNI" size="8" maxlength="8" required>
			</div>
	
			<div>
			    <label for="cuil">CUIL</label>
			    <div style="display: flex; gap: 0.5rem;">
			        <input type="text" id="cuilPrefijo" placeholder="XX" name="cuilPrefijo" size="2" maxlength="2" required>
			        <span>-</span>
			        <input type="text" id="cuilDni" name="cuilDni" readonly size="8">
			        <span>-</span>
			        <input type="text" id="cuilVerificador" placeholder="X" name="cuilVerificador" size="1" maxlength="1" required>
			    </div>
			</div>

			<script> //JS PARA COMPLETAR EL CAMPO 'cuilDni'EN EJECUCIÓN
			    const dniInput = document.getElementById('dni');
			    const cuilDniInput = document.getElementById('cuilDni');
			
			    dniInput.addEventListener('input', function() {
			        cuilDniInput.value = dniInput.value.trim();
			    });
			</script>
			
			<div>
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" placeholder="Ingrese nombre" required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
			</div>

			<div>
				<label for="apellido">Apellido</label>
				<input type="text" name="apellido" id="apellido" placeholder="Ingrese apellido" required required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
			</div>

			<div>
				<label for="sexo">Sexo</label>
				<select name="sexo" id="sexo" required>
					<option value="Masculino">Masculino</option>
					<option value="Femenino">Femenino</option>
					<option value="Otro">Otro</option>
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
				<input type="text" name="direccion" id="direccion" placeholder="Ingrese dirección" required maxlength="100" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
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
				<input type="text" name="localidad" id="localidad" placeholder="Ingrese localidad" required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios" />
			</div>

			<div>
				<label for="email">Correo Electrónico</label>
				<input type="email" name="email" id="email" placeholder="ejemplo@correo.com" required maxlength="100">
			</div>

			<div>
				<label for="telefono">Teléfono</label>
				<input type="tel" name="telefono" id="telefono" placeholder="Ingrese teléfono" required maxlength="20" placeholder="Sin espacios ni símbolos: 11222333">
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

			<div class="contenedor-botones">
				<div>
				
					<button type="submit">Agregar Cliente</button>
				</div>
				
				<div>	
					<button class="btnCancelar" onclick="window.history.back()">Cancelar</button>
				</div>
			</div>

			<%
				String mensaje = (String)session.getAttribute("mensaje-AltaCliente");
				if (mensaje != null) {
			%>
				<div class="mensaje-resultado">
					<span><%= mensaje %></span>
				</div>
			<%
					session.removeAttribute("mensaje-AltaCliente");
				}
			%>

		</form>
	</main>

</body>
</html>