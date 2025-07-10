
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS BANCO;
USE BANCO;

-- Tipos de usuarios
CREATE TABLE TiposUsuarios (
    Cod_TipoUsuario INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
);

-- Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    User VARCHAR(50) UNIQUE NOT NULL,
    Pass VARCHAR(50) NOT NULL,
    Cod_TipoUsuario INT,
    FOREIGN KEY (Cod_TipoUsuario) REFERENCES TiposUsuarios(Cod_TipoUsuario)
);

-- Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    CUIL VARCHAR(20) UNIQUE NOT NULL,
    DNI VARCHAR(15) UNIQUE NOT NULL,
    ID_Usuario INT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Sexo VARCHAR(10),
    Nacionalidad VARCHAR(50),
    Fecha_nacimiento DATE,
    Direccion VARCHAR(100),
    Localidad VARCHAR(50),
    Provincia VARCHAR(50),
    Correo_electronico VARCHAR(100),
    Telefono VARCHAR(20),
    Estado BOOLEAN,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

-- Tipos de cuenta
CREATE TABLE TiposCuenta (
    Cod_TipoCuenta INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
);

-- Cuentas
CREATE TABLE Cuentas (
    NroCuenta INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Cod_TipoCuenta INT,
    CBU VARCHAR(30) UNIQUE NOT NULL,
    Fecha_creacion DATE,
    Saldo DECIMAL(12,2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (Cod_TipoCuenta) REFERENCES TiposCuenta(Cod_TipoCuenta)
);

-- Tipos de movimientos
CREATE TABLE TiposMovimientos (
    Cod_TipoMov INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
);

-- Movimientos
CREATE TABLE Movimientos (
    NroMov INT AUTO_INCREMENT PRIMARY KEY,
    NroCuenta INT,
    Cod_Tipo INT,
    Detalle TEXT,
    Importe DECIMAL(12,2),
    Fecha DATE,
    FOREIGN KEY (NroCuenta) REFERENCES Cuentas(NroCuenta),
    FOREIGN KEY (Cod_Tipo) REFERENCES TiposMovimientos(Cod_TipoMov)
);

-- Préstamos
CREATE TABLE Prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    Importe_a_pagar DECIMAL(12,2),
    Importe_pedido DECIMAL(12,2),
    Plazo_pago_meses INT,
    Monto_por_mes DECIMAL(12,2),
    Estado BOOLEAN,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Cuotas
CREATE TABLE Cuotas (
    ID_Cuota INT AUTO_INCREMENT PRIMARY KEY,
    ID_Prestamo INT,
    Nro_cuota INT,
    Monto DECIMAL(12,2),
    Fecha_de_pago DATE,
    Estado BOOLEAN,
    UNIQUE (ID_Prestamo, Nro_cuota),
    FOREIGN KEY (ID_Prestamo) REFERENCES Prestamos(ID_Prestamo)
);



ALTER TABLE Cuentas
ADD COLUMN Estado BOOLEAN DEFAULT TRUE;


	ALTER TABLE `banco`.`prestamos` 
	ADD COLUMN `Cuenta_depositar` VARCHAR(45) NULL DEFAULT NULL AFTER `Estado`;


