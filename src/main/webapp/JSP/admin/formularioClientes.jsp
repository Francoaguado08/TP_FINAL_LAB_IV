<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EL BANCO QUE TE BANCA - Agregar Cliente</title>
    <style>
        :root {
    --primary-color: #c0392b;         /* Rojo principal */
    --primary-hover: #a93226;         /* Rojo más oscuro */
    --text-color: #2c3e50;            /* Gris oscuro elegante */
    --border-color: #ccc;             /* Bordes suaves */
    --error-color: #e74c3c;           /* Rojo para errores */
    --background-color: #fdfdfd;      /* Fondo general */
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    color: var(--text-color);
    background-color: var(--background-color);
    line-height: 1.6;
}

.navbar {
    background-color: var(--primary-color); /* Cambiada a rojo */
    padding: 1rem;
    display: flex;
    justify-content: space-around;
    align-items: center;
}

.navbar .link {
    color: white; /* Contraste sobre fondo rojo */
    text-decoration: none;
    padding: 0.5rem 1rem;
    font-weight: bold;
    transition: background-color 0.3s, opacity 0.3s;
    border-radius: 4px;
}

.navbar .link:hover {
    background-color: var(--primary-hover); /* Rojo más oscuro */
    opacity: 0.9;
}

.hospital-info {
    text-align: center;
    padding: 2rem;
    background-color: #f4f4f4;
    margin-bottom: 2rem;
    border-bottom: 3px solid var(--primary-color);
}

.hospital-info h1 {
    font-size: 2.4rem;
    margin: 0;
    color: var(--primary-color);
    font-weight: 700;
}

.form-container {
    max-width: 500px;
    margin: 0 auto;
    padding: 2rem;
    background-color: white;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.form-title {
    text-align: center;
    margin-bottom: 2rem;
    font-size: 1.8rem;
    font-weight: bold;
    color: var(--primary-color);
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
}

.form-control {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    font-size: 1rem;
    background-color: #fefefe;
    box-sizing: border-box;
}

.form-control:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 2px rgba(192, 57, 43, 0.2);
}

.validation-message {
    color: var(--error-color);
    font-size: 0.9rem;
    margin-top: 0.3rem;
}

.form-actions {
    text-align: center;
    margin-top: 2rem;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
    padding: 1rem 2rem;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 100%;
    max-width: 200px;
}

.btn-primary:hover {
    background-color: var(--primary-hover);
}

.mensaje-resultado {
    text-align: center;
    margin-top: 1rem;
    font-family: Verdana;
    font-size: 1.2rem;
    color: var(--primary-color);
}

@media (max-width: 600px) {
    .form-container {
        padding: 1rem;
    }

    .hospital-info h1 {
        font-size: 2rem;
    }

    .form-title {
        font-size: 1.5rem;
    }

    .btn-primary {
        width: 100%;
    }
}
        
    </style>
</head>
<body>
    <form method="post" action="AgregarClienteServlet">
        <div class="navbar">
            <a href="MenuPrincipal.jsp" class="link">Menú Principal</a>
            <span class="link">Usuario: ${usuario}</span>
            <a href="CerrarSesionServlet" class="link">Cerrar Sesión</a>
        </div>

        <div class="hospital-info">
            <h1>EL BANCO QUE TE BANCA</h1>
        </div>

        <div class="form-container">
            <h2 class="form-title">AGREGAR CLIENTE</h2>

            <!-- DNI -->
            <div class="form-group">
                <label for="dni">DNI</label>
                <input type="text" name="dni" id="dni" class="form-control" placeholder="Ingrese DNI" required>
            </div>

            <!-- CUIL -->
            <div class="form-group">
                <label for="cuil">CUIL</label>
                <input type="text" name="cuil" id="cuil" class="form-control" placeholder="Ingrese CUIL" required>
            </div>

            <!-- Nombre -->
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingrese nombre" required>
            </div>

            <!-- Apellido -->
            <div class="form-group">
                <label for="apellido">Apellido</label>
                <input type="text" name="apellido" id="apellido" class="form-control" placeholder="Ingrese apellido" required>
            </div>

            <!-- Sexo -->
            <div class="form-group">
                <label for="sexo">Sexo</label>
                <select name="sexo" id="sexo" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="X">Otro</option>
                </select>
            </div>

            <!-- Nacionalidad -->
            <div class="form-group">
                <label for="nacionalidad">Nacionalidad</label>
                <select name="nacionalidad" id="nacionalidad" class="form-control">
                    <option value="AR">Argentina</option>
                    <option value="CL">Chile</option>
                    <option value="OT">Otro</option>
                </select>
            </div>

            <!-- Fecha de Nacimiento -->
            <div class="form-group">
                <label for="fechaNacimiento">Fecha de Nacimiento</label>
                <input type="date" name="fechaNacimiento" id="fechaNacimiento" class="form-control" required>
            </div>

            <!-- Dirección -->
            <div class="form-group">
                <label for="direccion">Dirección</label>
                <input type="text" name="direccion" id="direccion" class="form-control" placeholder="Ingrese dirección" required>
            </div>

            <!-- Provincia -->
            <div class="form-group">
                <label for="provincia">Provincia</label>
                <select name="provincia" id="provincia" class="form-control" onchange="this.form.submit()">
                    <c:forEach var="prov" items="${listaProvincias}">
                        <option value="${prov.id}">${prov.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Localidad -->
            <div class="form-group">
                <label for="localidad">Localidad</label>
                <select name="localidad" id="localidad" class="form-control">
                    <c:forEach var="loc" items="${listaLocalidades}">
                        <option value="${loc.id}">${loc.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Correo Electrónico</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="ejemplo@correo.com" required>
            </div>

            <!-- Teléfonos -->
            <div class="form-group">
                <label for="telefono">Teléfono</label>
                <input type="text" name="telefono" id="telefono" class="form-control" placeholder="Ingrese teléfono" required>
            </div>

            <!-- Usuario -->
            <div class="form-group">
                <label for="username">Nombre de Usuario</label>
                <input type="text" name="username" id="username" class="form-control" placeholder="Ingrese nombre de usuario" required>
            </div>

            <!-- Contraseña -->
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Ingrese contraseña" required>
            </div>

            <!-- Confirmar Contraseña -->
            <div class="form-group">
                <label for="confirmPassword">Confirmar Contraseña</label>
                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Repita la contraseña" required>
            </div>

            <!-- Botón -->
            <div class="form-actions">
                <button type="submit" class="btn-primary">Agregar</button>
                <div class="mensaje-resultado">
                    <span>${mensaje}</span>
                </div>

