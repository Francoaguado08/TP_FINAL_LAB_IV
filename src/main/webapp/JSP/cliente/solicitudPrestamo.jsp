<%@page import="entidades.Cuenta"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/estiloForm.css" rel="stylesheet"> 
	
	<title>Solicitar préstamo</title>
</head>

<body>
	<jsp:include page="../navbar/navCliente.jsp"/>
	
	
		<%
		List<Cuenta> l = null;
		if(request.getAttribute("listacuentas")!=null){
		l = (List<Cuenta>) request.getAttribute("listacuentas");
		}
	%>
	
	<main class="contenido-principal">
	
		<form method="post" action="${pageContext.request.contextPath}/PrestamosServlet">
			<h2>Solicitar un Préstamo</h2>
			
		    <div>
		        <label for="suma">Suma solicitada</label>
		        <input type="number" id="suma" name="suma" min="1" step="any" placeholder="Ingrese la suma solicitada" required>
		    </div>
		
		    <div>
		        <label for="cuotas">Cantidad de cuotas</label>
		        <select id="cuotas" name="cuotas" required>
		            <option value="" disabled selected>Seleccione la cantidad de cuotas</option>
		            <option value="2">2</option>
		            <option value="4">4</option>
		            <option value="6">6</option>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <label for="cuenta">Cuenta</label>
		        
		        <select id="cuenta" name="cuenta" required>
		            <option value="" disabled selected >Seleccione la cuenta donde recibirá el préstamo</option>
		              <% 
      			for(Cuenta c : l) { 
       		 %>
            <!-- Opción para cada cuenta -->
            <option value="<%= c.getNroCuenta() %>">
                <%= c.getNroCuenta() %> 
            </option>
        <% } %>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <button type="submit" name ="btnSolicitar">Enviar</button>
		    </div>
		    
		    <% if(request.getAttribute("mensaje") != null) { %>
  	<div style="color:green">
   	<%= request.getAttribute("mensaje") %>
   	 </div>
	<% } %>
	
		    <% if(request.getAttribute("error") != null) { %>
  	<div style="color:red">
   	<%= request.getAttribute("error") %>
   	 </div>
	<% } %>
	
		</form>
	</main>
	
	
</body>
</html>