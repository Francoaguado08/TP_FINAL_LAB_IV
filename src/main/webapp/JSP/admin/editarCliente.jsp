<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">
	
	<title>Editar Cliente</title>
</head>
<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<%
		Cliente c = new Cliente();
		if (request.getAttribute("cliente") != null) 
		{
			c = (Cliente) request.getAttribute("cliente");
		}
	%>
	<!-- Títulos -->
	<h1>Editar Cliente</h1>
	
	<main class="contenido-principal">
	
	<!-- Formulario que envía los datos modificados al servlet ClientesServlet -->
	<form method="post" action="${pageContext.request.contextPath}/ClientesServlet">
        <input type="hidden" name="accion" value="modificar" />

        <!-- Sección Datos Personales -->
        <fieldset class="card">
            <legend>Datos Personales</legend>

            <div>
                <label>ID</label>
                <input type="text" name="id" value="<%= c.getIdCliente() %>" readonly>
            </div>

            <div>
                <label>DNI</label>
                <input type="text" name="dni" value="<%= c.getDni() %>" readonly>
            </div>

            <div>
                <label>CUIL</label>
                <input type="text" name="cuil" value="<%= c.getCuil() %>" readonly>
            </div>

            <div>
                <label>Nombre</label>
                <input type="text" name="nombre" value="<%= c.getNombre() %> " required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
            </div>

            <div>
                <label>Apellido</label>
                <input type="text" name="apellido" value="<%= c.getApellido() %>" required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
            </div>

            <div>
                <label>Sexo</label>
				    <select name="sexo" id="sexo" required>
				        <option value="Masculino" <%= "Masculino".equalsIgnoreCase(c.getSexo()) ? "selected" : "" %> >Masculino</option>
				        <option value="Femenino" <%= "Femenino".equalsIgnoreCase(c.getSexo()) ? "selected" : "" %> >Femenino</option>
				        <option value="Otro" <%= "Otro".equalsIgnoreCase(c.getSexo()) ? "selected" : "" %> >Otro</option>
				    </select>
            </div>

           	<div>
			    <label>Nacionalidad</label>
			    <select name="nacionalidad" id="nacionalidad" required>
			        <option value="">-- Seleccione --</option>
			        <option value="Argentina" <%= "Argentina".equalsIgnoreCase(c.getNacionalidad()) ? "selected" : "" %> >Argentina</option>
			        <option value="Chile" <%= "Chile".equalsIgnoreCase(c.getNacionalidad()) ? "selected" : "" %> >Chile</option>
			        <option value="Otro" <%= "Otro".equalsIgnoreCase(c.getNacionalidad()) ? "selected" : "" %> >Otro</option>
			    </select>
			</div>

            <div>
                <label>Fecha Nacimiento</label>
                <input type="date" name="fechaNacimiento" value="<%= c.getFechaNacimiento() %>" required>
            </div>

            <div>
                <label>Dirección</label>
                <input type="text" name="direccion" value="<%= c.getDireccion() %>" required maxlength="100" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
            </div>

            <div>
                <label>Localidad</label>
                <input type="text" name="localidad" value="<%= c.getLocalidad() %>" required maxlength="50" pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
            </div>

            <div>
			    <label for="provincia">Provincia</label>
			    <select name="provincia" id="provincia" required>
			        <option value="">-- Seleccione una provincia --</option>
			        <option value="Buenos Aires" <%= "Buenos Aires".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >Buenos Aires</option>
			        <option value="CABA" <%= "CABA".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >CABA</option>
			        <option value="Córdoba" <%= "Córdoba".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >Córdoba</option>
			        <option value="Santa Fe" <%= "Santa Fe".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >Santa Fe</option>
			        <option value="Mendoza" <%= "Mendoza".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >Mendoza</option>
			        <option value="Otra" <%= "Otra".equalsIgnoreCase(c.getProvincia()) ? "selected" : "" %> >Otra</option>
			    </select>
			</div>


            <div>
                <label>Correo Electrónico</label>
                <input type="email" name="email" value="<%= c.getCorreoElectronico() %>" required maxlength="100">
            </div>

            <div>
                <label>Teléfono</label>
                <input type="tel" name="telefono"  pattern="[0-9]{8}" value="<%= c.getTelefono() %>"  required maxlength="20" placeholder="Sin espacios ni símbolos: 11222333">
            </div>

        </fieldset>

        <!-- Sección Datos de Inicio de Sesión -->
        <fieldset class="card">
            <legend>Datos de Inicio de Sesión</legend>
			<div>
				<label>ID Usuario</label>
				<input type="text" name="idUsuario" value="<%= c.getUsuario().getIdUsuario() %>" readonly>
			</div>
			
            <div>
                <label>Nombre Usuario</label>
                <input type="text" name="usuario" value="<%= c.getUsuario().getUser() %>" readonly>
            </div>

            <div>
                <label>Contraseña</label>
                <input type="password" name="password" value="<%= c.getUsuario().getContrasena() %>" required pattern=".*\S.*" title="Este campo no puede estar vacío o solo espacios">
            </div>

            <div>
                <label>Tipo Usuario</label>
                <input type="text" name="tipoUsuario" value="<%= c.getUsuario().getTipoUsuario().getDescripcion() %>" readonly>
            </div>
        </fieldset>

        <!-- Botones -->
        <div class="contenedor-botones">
            <div>
                <button type="submit">Modificar</button>
            </div>

            <div>
                <a class="btnCancelar" href="${pageContext.request.contextPath}/ClientesServlet?Param=lista">Cancelar</a>
            </div>
        </div>

    </form>
	
	
	
	</main>
	
</body>
</html>