<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado Cuentas</title>
<link href="../css/normalize.css" rel="stylesheet">
<link href="../css/estilos.css" rel="stylesheet">
<link href="../css/estiloMenu.css" rel="stylesheet">
<link href="../css/estiloLista.css" rel="stylesheet"> 
</head>

<body>
	<header>
		<div class="nav-bg">
			<nav class="navegacion-principal contenedor">
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
		</div>
	</header>
	
	<section class="grid-container">
		<section class="hospital-info">
                <h1>Acceder a una Cuenta</h1>
            </section>
	
                <table>
                    <thead>
                        <tr>
                            <th>N° Cuenta</th>
                            <th>Tipo de Cuenta</th>
                            <th>CBU</th>
                            <th>CUIL</th>
                            <th>Saldo</th>
                            <th>Fecha de creación</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>123456789</td>
                                <td>Caja de ahorro</td>
                                <td>0000002323154312</td>
                                <td>11-22333444-1</td>
                                <td>$150.250,00</td>
                                <td>28/9/2009</td>
                                <td>
                                    <a href="#" class="btnEditar">Seleccionar</a>
                                </td>
                            </tr>
                    </tbody>
                </table>
            </section>


</body>
</html>