<!-- JSP/navbar/navAdmin.jsp -->
<!-- Codigo reutilizable de la barra de navegaci�n del usuario ADMIN -->

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
				
				<li><a href="${pageContext.request.contextPath}/PrestamosAcepRechServlet?Param=click">Pr�stamos</a></li>
				
				<li><a href="${pageContext.request.contextPath}/JSP/admin/reportes.jsp">Reportes</a></li>
				
				<li>
					<a>
						<img src="${pageContext.request.contextPath}/images/user.png" width="15" height="15"/>
						<%=session.getAttribute("usuario") %>
					</a>
				</li>
				
				<li>
					<a href="${pageContext.request.contextPath}/LoginServlet" title="Cerrar sesi�n"  class="bg-eliminar" 
						onclick="return confirm('�Cerrar sesi�n?');"> <!-- msj localhost -->
						<img src="${pageContext.request.contextPath}/images/logout.png" width="20" height="20"/>
					</a>
				</li>
						
			</ul>
		</nav>
	</div>
</header>