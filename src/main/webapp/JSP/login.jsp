<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/normalize.css" rel="stylesheet">
	<link href="css/estilos.css" rel="stylesheet">
	<link href="css/estiloForm.css" rel="stylesheet">
	
	<title>Login</title>
</head>

<body>
	<header>
		<h1>Banco<b>BussBank</b></h1>	
	</header>
	

	<main class="contenido-principal">
		
        <form method="POST" action="${pageContext.request.contextPath}/LoginServlet">
			<h2>Iniciar sesión</h2>
		
        	<div>
        		<input placeholder="Usuario" type="text" name="usuario" required>
        	</div>
        	
            <div>
            	<input placeholder="Contraseña" type="password" name="clave" required>
            </div>
            
            <div>
		        <button type="submit">Enviar</button>
		    </div>
        </form>
        
 	<% if(request.getAttribute("error") != null) { %>
  	<div style="color:red">
   	<%= request.getAttribute("error") %>
   	 </div>
	<% } %>

		
	</main>

</body>
</html>