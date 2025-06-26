<%@page import="entidades.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="<%=request.getContextPath()%>/JSP/css/normalize.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/JSP/css/estilos.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/JSP/css/estiloForm.css" rel="stylesheet">
	
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
                <input type="text" name="nombre" value="<%= c.getNombre() %>">
            </div>

            <div>
                <label>Apellido</label>
                <input type="text" name="apellido" value="<%= c.getApellido() %>">
            </div>

            <div>
                <label>Sexo</label>
                <input type="text" name="sexo" value="<%= c.getSexo() %>" >
            </div>

            <div>
                <label>Nacionalidad</label>
                <input type="text" name="nacionalidad" value="<%= c.getNacionalidad() %>" >
            </div>

            <div>
                <label>Fecha Nacimiento</label>
                <input type="text" name="fechaNacimiento" value="<%= c.getFechaNacimiento() %>" >
            </div>

            <div>
                <label>Dirección</label>
                <input type="text" name="direccion" value="<%= c.getDireccion() %>" >
            </div>

            <div>
                <label>Localidad</label>
                <input type="text" name="localidad" value="<%= c.getLocalidad() %>" >
            </div>

            <div>
                <label>Provincia</label>
                <input type="text" name="provincia" value="<%= c.getProvincia() %>" >
            </div>

            <div>
                <label>Correo Electrónico</label>
                <input type="text" name="email" value="<%= c.getCorreoElectronico() %>" >
            </div>

            <div>
                <label>Teléfono</label>
                <input type="text" name="telefono" value="<%= c.getTelefono() %>" >
            </div>

        </fieldset>

        <!-- Sección Datos de Inicio de Sesión -->
        <fieldset class="card">
            <legend>Datos de Inicio de Sesión</legend>

            <div>
                <label>Usuario</label>
                <input type="text" name="usuario" value="<%= c.getUsuario().getUser() %>" readonly>
            </div>

            <div>
                <label>Contraseña</label>
                <input type="password" name="password" value="<%= c.getUsuario().getContrasena() %>">
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
                <button class="btnCancelar" type="button" onclick="window.history.back()">Cancelar</button>
            </div>
        </div>

    </form>
	
	
	
	</main>
	
</body>
</html>