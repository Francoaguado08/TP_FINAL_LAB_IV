<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloForm.css" rel="stylesheet"> 

<title>Transferencia</title>
</head>

<body>
	<header class="nav-bg">
			<nav class="navegacion-principal">
				<ul class="menu">
					<li>
						<a href="#">Cuentas</a>
					</li>
					<li>
						<a href="#">Transferencias</a>
					</li>
					<li>
						<a href="#">Solicitar Préstamo</a>
					</li>
					<li>
						<a href="#">Pagar Préstamos</a>
					</li>
					<li>
						<a href="#">Información Personal</a>
					</li>	
				</ul>
			</nav>
	</header>
	
	<!-- Form -->
	<main class="contenido-principal">
		<form>
		    <div>
		        <label for="cbu">CBU</label>
		        <input type="number" id="cbu" name="cbu" placeholder="Ingrese el cbu a transferir" required>
		    </div>
		
		    <div>
		        <label for="suma">Suma a transferir</label>
		        <input type="number" id="suma" name="suma" placeholder="Ingrese la suma a transferir" required>
		    </div>
		
		    <div>
		        <button type="submit">Enviar</button>
		    </div>
		</form>
	</main>



</body>
</html>