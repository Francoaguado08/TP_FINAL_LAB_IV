<%@page import="entidades.CuentaListado"%>
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
		CuentaListado c = new CuentaListado();
		if (request.getAttribute("cuenta") != null) 
		{
			c = (CuentaListado) request.getAttribute("cuenta");
		}
	%>
	
	
	 <!-- Contenido principal -->
    <main class="contenido-principal">

        <form method="get" action="${pageContext.request.contextPath}/MovimientosServlet">
       		<input type="hidden" name="nCuenta" value="<%=c.getNroCuenta() %>" />
       		
    
	    	<h1>Resumen de Cuenta</h1>
       
            <fieldset class="card">
            <legend>Detalles de <%=c.getTipoCuenta() %> - Nº<%=c.getNroCuenta() %></legend>
            	
            	<div>
	                <label>CBU</label>
	                <input type="text" name="cbu" value="<%=c.getCbu() %>" readonly>
            	</div>
            	
            	<div>
	                <label>Tipo de Cuenta</label>
	                <input type="text" name="tipoCuenta" value="<%=c.getTipoCuenta() %>" readonly>
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
	                <button type="submit" name="Param" value="lista">Historial de movimientos</button>
	            </div>
	
	            <div>
	                <button type="submit" name="Param" value="nuevaTransferencia" >Nueva transferencia</button>
	            </div>
	        </div>
            
        </form>
    </main>

</body>
</html>