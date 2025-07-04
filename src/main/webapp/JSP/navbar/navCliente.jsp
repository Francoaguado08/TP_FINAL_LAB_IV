<!-- JSP/navbar/navCliente.jsp -->
<!-- Codigo reutilizable de la barra de navegaci�n del usuario CLIENTE-->

<header>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
				<ul class="menu">
					<li>
						<a href="${pageContext.request.contextPath}/CuentasServlet?Param=cuentasCli">Cuentas</a>
					</li>
					<li>
						<a href="transferencia.jsp">Transferencias</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/PrestamosServlet?Param=click">Solicitar Pr�stamo</a>
					</li>
					<li>
						<a href="pagoCuotas.jsp">Pagar Pr�stamos</a>
					</li>
					
					<li>
						<a href="verDatosCliente.jsp" title="Ver informaci�n">
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