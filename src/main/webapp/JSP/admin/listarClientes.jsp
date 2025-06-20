<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloMenu.css" rel="stylesheet">
<link href="../css/estiloLista.css" rel="stylesheet"> 

<title>Listado Clientes</title>
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

    <!-- Encabezado -->
    <div class="hospital-info">
        <h1>EL BANCO QUE TE BANCA</h1>
    </div>

    <!-- Caja de Filtros -->
    <div class="filter-box">
        <h2>LISTADO DE CLIENTES</h2>
        <form method="get" action="ListadoClientesServlet">
            <div class="filter-group">
                <label for="dni">Buscar por DNI</label>
                <input type="text" name="dni" id="dni" class="input" placeholder="Ingrese DNI">

                <label for="usuario">Buscar por Usuario</label>
                <input type="text" name="usuario" id="usuario" class="input" placeholder="Ingrese Usuario">

                <button type="submit" class="button">Filtrar</button>
            </div>
        </form>
    </div>

    <!-- Tabla de clientes -->
    <div class="grid-container">
        <table id="tablaClientes">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>DNI</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Sexo</th>
                    <th>Fecha Nac.</th>
                    <th>Dirección</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cliente" items="${listaClientes}">
                    <tr>
                        <td>${cliente.usuario}</td>
                        <td>${cliente.dni}</td>
                        <td>${cliente.nombre}</td>
                        <td>${cliente.apellido}</td>
                        <td>${cliente.sexo}</td>
                        <td>${cliente.fechaNacimiento}</td>
                        <td>${cliente.direccion}</td>
                        <td>${cliente.email}</td>
                        <td>${cliente.telefono}</td>
                        <td>
                            <a href="EditarClienteServlet?id=${cliente.id}" class="btnEditar">Editar</a>
                            <a href="EliminarClienteServlet?id=${cliente.id}" class="btnEliminar">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
