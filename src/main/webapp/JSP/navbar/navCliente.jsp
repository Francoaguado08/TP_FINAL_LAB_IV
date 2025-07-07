<!-- JSP/navbar/navCliente.jsp -->
<!-- Codigo reutilizable de la barra de navegación del usuario CLIENTE-->

<header>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
				<ul class="menu">
					<li>
						<a href="${pageContext.request.contextPath}/JSP/cliente/menuCliente.jsp" title="Menú principal" class="icon-button">
							<img src="${pageContext.request.contextPath}/images/home.png" width="20" height="20"/>
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/CuentasServlet?Param=cuentasCli">Cuentas</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/JSP/cliente/transferencia.jsp">Transferencias</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/PrestamosServlet?Param=click">Solicitar Préstamo</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/JSP/cliente/pagoCuotas.jsp">Pagar Préstamos</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/ClientesServlet?Param=obtener" title="Ver información">
							<img src="${pageContext.request.contextPath}/images/user.png" width="15" height="15"/>
							<%=session.getAttribute("usuario") %> 
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/LoginServlet" title="Cerrar sesión"  class="bg-eliminar icon-button " 
							onclick="return confirm('¿Cerrar sesión?');"> <!-- msj localhost -->
							<img src="${pageContext.request.contextPath}/images/logout.png" width="20" height="20"/>
						</a>
					</li>
						
				</ul>
			</nav>
		</div>
</header>