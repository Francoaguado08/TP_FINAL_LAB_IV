<!-- JSP/navbar/navCliente.jsp -->
<!-- Codigo reutilizable de la barra de navegaci�n del usuario CLIENTE-->

<header>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
				<ul class="menu">
					<li>
						<a href="listarCuentas.jsp">Cuentas</a>
					</li>
					<li>
						<a href="transferencia.jsp">Transferencias</a>
					</li>
					<li>
						<a href="solicitudPrestamo.jsp">Solicitar Pr�stamo</a>
					</li>
					<li>
						<a href="pagoCuotas.jsp">Pagar Pr�stamos</a>
					</li>
					<li>
						<a href="verDatosCliente.jsp">Informaci�n Personal</a>
					</li>
					<li>
					<a>Usuario: <%=session.getAttribute("usuario") %></a> <!-- habria que darle un estilo propio estatico para que no interactue con el hover de la etiqueta <a> si les parece mas optimo -->
					</li>
						
				</ul>
			</nav>
		</div>
</header>