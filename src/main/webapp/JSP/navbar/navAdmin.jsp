<!-- JSP/navbar/navAdmin.jsp -->
<!-- Codigo reutilizable de la barra de navegación del usuario ADMIN -->

<header>
	<div class="nav-bg">
		<nav class="navegacion-principal contenedor">
			<ul class="menu">
				<li class="dropdown">
					<a href="#">Clientes</a>
					<ul class="submenu">
						<li><a href="${pageContext.request.contextPath}/ClientesServlet?Param=lista">Listar-Modificar-Eliminar</a></li>
						<li><a href="${pageContext.request.contextPath}/JSP/admin/formularioClientes.jsp">Alta</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#">Cuentas</a>
					<ul class="submenu">
						<li><a href="${pageContext.request.contextPath}/CuentasServlet?Param=lista">Listar-Modificar-Eliminar</a></li>
						<li><a href="${pageContext.request.contextPath}/CuentasServlet?Param=alta">Alta</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/JSP/admin/solicitudesPrestamo.jsp">Préstamos</a></li>
				<li><a href="${pageContext.request.contextPath}/JSP/admin/reportes.jsp">Reportes</a></li>
				<li>
					<a>Usuario: <%=session.getAttribute("usuario") %></a> <!-- habria que darle un estilo propio estatico para que no interactue con el hover de la etiqueta <a> si les parece mas optimo -->
				</li>
						
			</ul>
		</nav>
	</div>
</header>