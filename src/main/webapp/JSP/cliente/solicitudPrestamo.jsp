<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloForm.css" rel="stylesheet"> 
<link href="../css/estiloLista.css" rel="stylesheet"> 

<title>Solicitar préstamo</title>

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
	
	<section class="hospital-info">
            <h1>Solicitar un Préstamo</h1>
        </section>
	<!-- Form -->
	<main class="contenido-principal">
	
		<form>
		    <div>
		        <label for="suma">Suma solicitada</label>
		        <input type="number" id="suma" name="suma" placeholder="Ingrese la suma solicitada" required>
		    </div>
		
		    <div>
		        <label for="cuotas">Cantidad de cuotas</label>
		        <select id="cuotas" name="cuotas" required>
		            <option value="">Seleccione la cantidad de cuotas</option>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <label for="cuenta">Cuenta</label>
		        <select id="cuenta" name="cuenta" required>
		            <option value="">Seleccione la cuenta donde recibirá el préstamo</option>
		            <!-- Opciones se agregarán dinámicamente -->
		        </select>
		    </div>
		
		    <div>
		        <button type="submit">Enviar</button>
		    </div>
		</form>
	</main>
	
	
</body>
</html>