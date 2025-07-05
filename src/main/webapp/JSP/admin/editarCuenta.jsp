<%@page import="entidades.Cuenta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">
	
	<title>Editar Cuenta</title>
</head>
<body>
	<jsp:include page="../navbar/navAdmin.jsp"/>
	
	<%
		Cuenta c = new Cuenta();
		if (request.getAttribute("cuenta") != null) 
		{
			c = (Cuenta) request.getAttribute("cuenta");
		}
	%>
	<!-- Títulos -->
	<h1>Editar Cuenta</h1>
	
	<main class="contenido-principal">
	
	<!-- Formulario que envía los datos modificados al servlet ClientesServlet -->
	<form method="post" action="${pageContext.request.contextPath}/CuentasServlet">
        <input type="hidden" name="accion" value="modificar" />

        <!-- Sección Datos Personales -->
        <fieldset class="card">
            <legend>Datos de la cuenta</legend>

            <div>
                <label>ID</label>
                <input type="text" name="id" value="<%= c.getNroCuenta() %>" readonly>
            </div>

            <div>
                <label>ID Cliente</label>
                <input type="text" name="dni" value="<%= c.getIdCliente() %>" readonly>
                
            </div>

            <div>
                <label>CBU</label>
                <input type="text" name="cbu" value="<%= c.getCbu() %> " readonly>
            </div>

            <div>
    		<label>Tipo de Cuenta</label>
			    <select name="tipoCuenta" id="tipoCuenta" required>
			        <option value="1" <%= c.getCodTipoCuenta() == 1 ? "selected" : "" %> >Cuenta Corriente</option>
			        <option value="2" <%= c.getCodTipoCuenta() == 2 ? "selected" : "" %> >Caja de ahorro</option>
			    </select>
			</div>
			
			<!-- Botones -->
        <div class="contenedor-botones">
            <div>
                <button type="submit">Modificar</button>
            </div>

            <div>
                <a class="btnCancelar" href="${pageContext.request.contextPath}/CuentasServlet?Param=lista">Cancelar</a>
            </div>
        </div>


    </form>
	
	
	
	</main>
	
</body>
</html>