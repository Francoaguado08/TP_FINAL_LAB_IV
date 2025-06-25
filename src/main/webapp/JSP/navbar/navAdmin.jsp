<!-- JSP/navbar/navAdmin.jsp -->
<!-- Codigo reutilizable de la barra de navegación del usuario ADMIN -->

<header>
	<div class="nav-bg">
		<nav class="navegacion-principal contenedor">
			<ul class="menu">
				<li class="dropdown">
					<a href="#">Clientes</a>
					<ul class="submenu">
						<li><a href="listarClientes.jsp">Listar-Modificar-Eliminar</a></li>
						<li><a href="formularioClientes.jsp">Alta</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#">Cuentas</a>
					<ul class="submenu">
						<li><a href="listarCuentas.jsp">Listar-Modificar-Eliminar</a></li>
						<li><a href="formularioCuentas.jsp">Alta</a></li>
					</ul>
				</li>
				<li><a href="solicitudesPrestamo.jsp">Préstamos</a></li>
				<li><a href="reportes.jsp">Reportes</a></li>
			</ul>
		</nav>
	</div>
</header>