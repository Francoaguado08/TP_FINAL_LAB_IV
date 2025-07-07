<%@page import="entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet">
	
	<title>Menú Cuenta</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	<%
		Cuenta c = new Cuenta();
		if (request.getAttribute("cuenta") != null) 
		{
			c = (Cuenta) request.getAttribute("cuenta");
		}
	%>
	
	
	 <!-- Contenido principal -->
    <main class="contenido-principal">

        <form method="post" action="${pageContext.request.contextPath}/MovimientosServlet">
       		<input type="hidden" name="accion" value="listar" />
       		
       		
    
	    	<h1>Resumen de Cuenta</h1>
       
            <fieldset class="card">
            <legend>Detalles de (TIPO DE CUENTA) - Nº<%=c.getNroCuenta() %></legend>
            	
            	<div>
	                <label>CBU</label>
	                <input type="text" name="cbu" value="<%=c.getCbu() %>" readonly>
            	</div>
            	
            	<div>
	                <label>Tipo de Cuenta</label>
	                <input type="text" name="tipoCuenta" value="ACA VA EL TIPO DE CUENTA" readonly>
            	</div>
            	
            	<div>
	                <label>Fecha de creación</label>
	                <input type="text" name="fechaCreacion" value="<%=c.getFechaCreacion() %>" readonly>
            	</div>
            	
            	<div>
	                <label>Saldo Disponible</label>
	                <input type="text" name="fechaCreacion" value="$<%=c.getSaldo() %>" readonly>
            	</div>

			</fieldset>
			
      		<div class="contenedor-botones">
	            <div>
	                <button type="submit">Historial de movimientos</button>
	            </div>
	
	            <div>
	                <button>Nueva transferencia</button>
	            </div>
	        </div>
            
        </form>
    </main>

</body>
</html>