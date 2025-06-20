<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloLista.css" rel="stylesheet"> 

<title>Listado de Cuentas</title>
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

	<!-- Contenido principal -->
    <main class="contenido-principal">
        <div class="contenido-listado">

            <!-- Títulos -->
            <section class="hospital-info">
                <h1>LISTADO DE CLIENTES</h1>
            </section>
            <!-- Filtros -->
            <section class="filter-box">
                <form method="get" action="ListadoClientesServlet">
                    <label for="dni">Buscar por DNI</label>
                    <input type="text" name="dni" id="dni" placeholder="Ingrese DNI">

                    <label for="usuario">Buscar por Usuario</label>
                    <input type="text" name="usuario" id="usuario" placeholder="Ingrese Usuario">

                    <button type="submit" class="button">Filtrar</button>
                </form>
            </section>

            <!-- Tabla -->
            <section class="grid-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID Cuenta</th>
                            <th>Tipo de Cuenta</th>
                            <th>CBU</th>
                            <th>CUIL</th>
                            <th>Saldo</th>
                            <th>Fecha de creación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cuenta" items="${listaCuentas}">
                            <tr>
                                <td>${cuenta.id}</td>
                                <td>${cuenta.tipo}</td>
                                <td>${cuenta.cbu}</td>
                                <td>${cuenta.cuil}</td>
                                <td>${cuenta.saldo}</td>
                                <td>${cuenta.fechaCreacion}</td>
                                <td>
                                    <a href="#" class="btnEditar">Editar</a>
                                    <a href="#" class="btnEliminar">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
    </main>

    
</body>
</html>