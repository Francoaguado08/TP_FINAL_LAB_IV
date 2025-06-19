<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>BANCO QUE TE BANCA - Listado de Clientes</title>
    <style>
        :root {
    --primary-color: #c62828;         /* Rojo fuerte */
    --primary-hover: #b71c1c;
    --edit-color: #fbc02d;            /* Amarillo para editar */
    --edit-hover: #f9a825;
    --delete-color: #d32f2f;          /* Rojo para eliminar */
    --delete-hover: #b71c1c;
    --text-color: #333;
    --border-color: #ccc;
    --error-color: #ff0000;
    --background: #f5f5f5;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    color: var(--text-color);
    background-color: var(--background);
    line-height: 1.6;
}

/* Navbar roja */
.navbar {
    background-color: var(--primary-color);
    padding: 1rem;
    display: flex;
    justify-content: space-around;
    align-items: center;
}

.navbar .link {
    color: white;
    text-decoration: none;
    padding: 0.5rem 1rem;
    font-weight: bold;
    transition: opacity 0.3s;
}

.navbar .link:hover {
    opacity: 0.8;
}

.hospital-info {
    text-align: center;
    padding: 2rem;
    background-color: #fff;
    margin-bottom: 2rem;
}

.hospital-info h1 {
    font-size: 2.5rem;
    margin: 0;
    color: var(--primary-color);
}

.form-container, .filter-box {
    max-width: 500px;
    margin: 0 auto;
    padding: 2rem;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.form-title {
    text-align: center;
    margin-bottom: 2rem;
    font-size: 1.8rem;
    font-weight: bold;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: bold;
}

.form-control, .input {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    font-size: 1rem;
    background-color: #f8f8f8;
    box-sizing: border-box;
}

.form-control:focus, .input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 2px rgba(198, 40, 40, 0.2);
}

.button {
    background-color: var(--primary-color);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
    width: 100%;
}

.button:hover {
    background-color: var(--primary-hover);
}

/* Estilos para la grilla */
.grid-container {
    width: 90%;
    margin: 20px auto;
    overflow-x: auto;
    max-width: 1200px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: center;
    background-color: white;
    padding: 1rem;
    border-radius: 8px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    padding: 12px 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

table tr:hover {
    background-color: #f9f9f9;
}

/* Botones acción */
.btnEditar {
    background-color: var(--edit-color);
    color: white;
    padding: 6px 12px;
    border-radius: 4px;
    font-weight: bold;
    text-decoration: none;
    display: inline-block;
}

.btnEditar:hover {
    background-color: var(--edit-hover);
}

.btnEliminar {
    background-color: var(--delete-color);
    color: white;
    padding: 6px 12px;
    border-radius: 4px;
    font-weight: bold;
    text-decoration: none;
    display: inline-block;
}

.btnEliminar:hover {
    background-color: var(--delete-hover);
}

@media (max-width: 768px) {
    .grid-container {
        width: 95%;
        padding: 0.5rem;
    }

    .form-container, .filter-box {
        width: 90%;
        padding: 1rem;
    }

    .hospital-info h1 {
        font-size: 2rem;
    }

    .form-title {
        font-size: 1.5rem;
    }

    .btnEditar, .btnEliminar {
        padding: 6px 8px;
        font-size: 0.9rem;
    }
}
        
    </style>
</head>
<body>
    <!-- Barra de navegación -->
    <div class="navbar">
        <a href="MenuPrincipal.jsp" class="link">Menú Principal</a>
        <span class="link">Usuario: ${usuario}</span>
        <a href="CerrarSesionServlet" class="link">Cerrar Sesión</a>
    </div>

    <!-- Encabezado -->
    <div class="hospital-info">
        <h1>EL BANCO QUE TE BANCA</h1>
    </div>

    <!-- Caja de Filtros -->
    <div class="filter-box">
        <h2>LISTADO DE CLIENTES</h2>
        <form method="get" action="ListadoClientesServlet">
            <div class="filter-group">
                <label for="dni">Buscar por DNI</label>
                <input type="text" name="dni" id="dni" class="input" placeholder="Ingrese DNI">

                <label for="usuario">Buscar por Usuario</label>
                <input type="text" name="usuario" id="usuario" class="input" placeholder="Ingrese Usuario">

                <button type="submit" class="button">Filtrar</button>
            </div>
        </form>
    </div>

    <!-- Tabla de clientes -->
    <div class="grid-container">
        <table id="tablaClientes">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>DNI</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Sexo</th>
                    <th>Fecha Nac.</th>
                    <th>Dirección</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cliente" items="${listaClientes}">
                    <tr>
                        <td>${cliente.usuario}</td>
                        <td>${cliente.dni}</td>
                        <td>${cliente.nombre}</td>
                        <td>${cliente.apellido}</td>
                        <td>${cliente.sexo}</td>
                        <td>${cliente.fechaNacimiento}</td>
                        <td>${cliente.direccion}</td>
                        <td>${cliente.email}</td>
                        <td>${cliente.telefono}</td>
                        <td>
                            <a href="EditarClienteServlet?id=${cliente.id}" class="btnEditar">Editar</a>
                            <a href="EliminarClienteServlet?id=${cliente.id}" class="btnEliminar">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
