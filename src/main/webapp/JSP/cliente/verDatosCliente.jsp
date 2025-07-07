<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">
	
	<title>Información Usuario</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<%
		Cliente c = new Cliente();
		if (request.getAttribute("cliente") != null) 
		{
			c = (Cliente) request.getAttribute("cliente");
		}
	%>

	
<!-- FORM SOLO LECTURA -->
	<main class="contenido-principal">
		<form>
				
		<!-- Títulos -->
		<h2>Información personal</h2>
		
			<fieldset class="card">
	            <legend>Datos personales</legend>
			
			    <div>
			        <label for="id">ID</label>
			        <input type="text" id="id" name="id" value="<%=c.getIdCliente() %>" readonly>
			    </div>
	
			    <div>
			        <label for="dni">DNI</label>
			        <input type="text" id="dni" name="dni" value="<%=c.getDni() %>" readonly>
			    </div>
	
			    <div>
			        <label for="cuil">CUIL</label>
			        <input type="text" id="cuil" name="cuil" value="<%=c.getCuil() %>" readonly>
			    </div>
	
			    <div>
			        <label for="nombre">Nombre </label>
			        <input type="text" id="nombre" name="nombre" value="<%=c.getNombre() %>" readonly>
			    </div>
	
			    <div>
			        <label for="apellido">Apellido</label>
			        <input type="text" id="apellido" name="apellido" value="<%=c.getApellido() %>" readonly>
			    </div>
	
			    <div>
			        <label for="sexo">Sexo</label>
			        <input type="text" id="sexo" name="sexo" value="<%=c.getSexo() %>" readonly>
			    </div>
	
			    <div>
			        <label for="nacionalidad">Nacionalidad</label>
			        <input type="text" id="nacionalidad" name="nacionalidad" value="<%=c.getNacionalidad() %>" readonly>
			    </div>
	
			    <div>
			        <label for="fechaNacimiento">Fecha de Nacimiento</label>
			        <input type="text" id="fechaNacimiento" name="fechaNacimiento" value="<%=c.getFechaNacimiento() %>" readonly>
			    </div>
			    
		    </fieldset>
	
			<fieldset class="card">
            <legend>Ubicación y contacto</legend>
            
			    <div>
			        <label for="direccion">Dirección</label>
			        <input type="text" id="direccion" name="direccion" value="<%=c.getDireccion() %>" readonly>
			    </div>
	
			    <div>
			        <label for="localidad">Localidad</label>
			        <input type="text" id="localidad" name="localidad" value="<%=c.getLocalidad() %>" readonly>
			    </div>
	
			    <div>
			        <label for="provincia">Provincia</label>
			        <input type="text" id="provincia" name="provincia" value="<%=c.getProvincia() %>" readonly>
			    </div>
	
			    <div>
			        <label for="email">Correo Electrónico</label>
			        <input type="text" id="email" name="email" value="<%=c.getCorreoElectronico() %>" readonly>
			    </div>
	
			    <div>
			        <label for="telefono">Teléfono</label>
			        <input type="text" id="telefono" name="telefono" value="<%=c.getTelefono() %>" readonly>
			    </div>
			    
		    </fieldset>
		</form>
	</main>
</body>
</html>