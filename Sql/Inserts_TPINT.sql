-- Tipos de usuario
INSERT INTO TiposUsuarios (Descripcion) VALUES ('Administrador'), ('Cliente');

-- Usuarios (1 administrador + 15 clientes)
INSERT INTO Usuarios (User, Pass, Cod_TipoUsuario) VALUES
('admin1', 'admin123', 1),
('cliente1', 'pass1', 2),
('cliente2', 'pass2', 2),
('cliente3', 'pass3', 2),
('cliente4', 'pass4', 2),
('cliente5', 'pass5', 2),
('cliente6', 'pass6', 2),
('cliente7', 'pass7', 2),
('cliente8', 'pass8', 2),
('cliente9', 'pass9', 2),
('cliente10', 'pass10', 2),
('cliente11', 'pass11', 2),
('cliente12', 'pass12', 2),
('cliente13', 'pass13', 2),
('cliente14', 'pass14', 2),
('cliente15', 'pass15', 2);

-- Clientes
INSERT INTO Clientes (CUIL, DNI, ID_Usuario, Nombre, Apellido, Sexo, Nacionalidad, Fecha_nacimiento, Direccion, Localidad, Provincia, Correo_electronico, Telefono, Estado)
VALUES
('20-12345678-9', '12345678', 2, 'Juan', 'Pérez', 'Masculino', 'Argentina', '1990-01-01', 'Calle 1', 'Rosario', 'Santa Fe', 'juan@mail.com', '3411111111', 1),
('20-22345678-9', '22345678', 3, 'María', 'Gómez', 'Femenino', 'Argentina', '1985-03-15', 'Calle 2', 'Córdoba', 'Córdoba', 'maria@mail.com', '3512222222', 1),
('20-32345678-9', '32345678', 4, 'Carlos', 'Lopez', 'Masculino', 'Argentina', '1980-07-20', 'Calle 3', 'Mendoza', 'Mendoza', 'carlos@mail.com', '2613333333', 1),
('20-42345678-9', '42345678', 5, 'Ana', 'Martínez', 'Femenino', 'Argentina', '1992-12-05', 'Calle 4', 'Salta', 'Salta', 'ana@mail.com', '3874444444', 1),
('20-52345678-9', '52345678', 6, 'Luis', 'Fernández', 'Masculino', 'Argentina', '1988-05-11', 'Calle 5', 'La Plata', 'Buenos Aires', 'luis@mail.com', '2215555555', 1),
('20-62345678-9', '62345678', 7, 'Sofía', 'Ruiz', 'Femenino', 'Argentina', '1993-09-30', 'Calle 6', 'San Juan', 'San Juan', 'sofia@mail.com', '2646666666', 1),
('20-72345678-9', '72345678', 8, 'Pedro', 'Díaz', 'Masculino', 'Argentina', '1991-11-25', 'Calle 7', 'Neuquén', 'Neuquén', 'pedro@mail.com', '2997777777', 1),
('20-82345678-9', '82345678', 9, 'Laura', 'Sánchez', 'Femenino', 'Argentina', '1987-06-17', 'Calle 8', 'San Luis', 'San Luis', 'laura@mail.com', '2668888888', 1),
('20-92345678-9', '92345678', 10, 'Diego', 'Morales', 'Masculino', 'Argentina', '1994-08-08', 'Calle 9', 'Santa Rosa', 'La Pampa', 'diego@mail.com', '2954555555', 1),
('20-10345678-9', '10345678', 11, 'Lucía', 'Romero', 'Femenino', 'Argentina', '1995-04-14', 'Calle 10', 'Formosa', 'Formosa', 'lucia@mail.com', '3709999999', 1),
('20-11345678-9', '11345678', 12, 'Martín', 'Alvarez', 'Masculino', 'Argentina', '1990-10-10', 'Calle 11', 'Jujuy', 'Jujuy', 'martin@mail.com', '3881111111', 1),
('20-12345679-9', '12345679', 13, 'Camila', 'Torres', 'Femenino', 'Argentina', '1989-01-25', 'Calle 12', 'Corrientes', 'Corrientes', 'camila@mail.com', '3792222222', 1),
('20-13345678-9', '13345678', 14, 'Federico', 'Acosta', 'Masculino', 'Argentina', '1986-08-13', 'Calle 13', 'Chaco', 'Chaco', 'federico@mail.com', '3623333333', 1),
('20-14345678-9', '14345678', 15, 'Valentina', 'Molina', 'Femenino', 'Argentina', '1996-07-19', 'Calle 14', 'Santa Cruz', 'Santa Cruz', 'valentina@mail.com', '2966444444', 1),
('20-15345678-9', '15345678', 16, 'Joaquín', 'Navarro', 'Masculino', 'Argentina', '1991-02-03', 'Calle 15', 'Tucumán', 'Tucumán', 'joaquin@mail.com', '3817777777', 1);

-- Tipos de cuenta
INSERT INTO TiposCuenta (Descripcion) VALUES ('Caja de ahorro'), ('Cuenta corriente');

-- Cuentas (15 en total)
INSERT INTO Cuentas (ID_Cliente, Cod_TipoCuenta, CBU, Fecha_creacion, Saldo) VALUES
(1, 1, '0000000001', '2024-01-01', 10000.00),
(2, 1, '0000000002', '2024-01-10', 10000.00),
(3, 2, '0000000003', '2024-03-15', 10000.00),
(4, 1, '0000000004', '2024-02-22', 10000.00),
(5, 2, '0000000005', '2024-04-01', 10000.00),
(6, 1, '0000000006', '2024-05-05', 10000.00),
(7, 1, '0000000007', '2024-05-12', 10000.00),
(8, 2, '0000000008', '2024-06-06', 10000.00),
(9, 1, '0000000009', '2024-06-07', 10000.00),
(10,2, '0000000010', '2024-06-08', 10000.00),
(11,1, '0000000011', '2024-06-01', 10000.00),
(12,1, '0000000012', '2024-06-02', 10000.00),
(13,2, '0000000013', '2024-06-03', 10000.00),
(14,2, '0000000014', '2024-06-04', 10000.00),
(15,1, '0000000015', '2024-06-05', 10000.00);

-- Tipos de movimientos
INSERT INTO TiposMovimientos (Descripcion) 
VALUES 
('Alta de cuenta'), 
('Alta de préstamo'), 
('Pago de préstamo'), 
('Transferencia');

-- Movimientos por apertura de cuentas (15)
INSERT INTO Movimientos (NroCuenta, Cod_Tipo, Detalle, Importe, Fecha) VALUES
(1, 1, 'Apertura de cuenta', 10000, '2024-01-01'),
(2, 1, 'Apertura de cuenta', 10000, '2024-01-10'),
(3, 1, 'Apertura de cuenta', 10000, '2024-03-15'),
(4, 1, 'Apertura de cuenta', 10000, '2024-02-22'),
(5, 1, 'Apertura de cuenta', 10000, '2024-04-01'),
(6, 1, 'Apertura de cuenta', 10000, '2024-05-05'),
(7, 1, 'Apertura de cuenta', 10000, '2024-05-12'),
(8, 1, 'Apertura de cuenta', 10000, '2024-06-06'),
(9, 1, 'Apertura de cuenta', 10000, '2024-06-07'),
(10,1, 'Apertura de cuenta', 10000, '2024-06-08'),
(11,1, 'Apertura de cuenta', 10000, '2024-06-01'),
(12,1, 'Apertura de cuenta', 10000, '2024-06-02'),
(13,1, 'Apertura de cuenta', 10000, '2024-06-03'),
(14,1, 'Apertura de cuenta', 10000, '2024-06-04'),
(15,1, 'Apertura de cuenta', 10000, '2024-06-05');

-- Préstamos (15 registros, algunos aprobados, otros pendientes)
-- estado 0 pendiente  y al aceparlo es 1 activo...
INSERT INTO Prestamos (ID_Cliente, Fecha, Importe_a_pagar, Importe_pedido, Plazo_pago_meses, Monto_por_mes, Estado, Cuenta_depositar)
VALUES
(1, '2024-06-01', 15500, 15000, 3, 5000, 1, 1),
(2, '2024-06-10', 9500, 9000, 3, 3000, 0, 2),
(3, '2024-06-15', 12500, 12000, 4, 3000, 1, 3),
(4, '2024-07-01', 6500, 6000, 2, 3000, 1, 4),
(5, '2024-07-03', 8500, 8000, 4, 2000, 0, 5),
(6, '2024-07-05', 10500, 10000, 5, 2000, 1, 6),
(7, '2024-07-06', 6500, 6000, 3, 2000, 0, 7),
(8, '2024-07-07', 9500, 9000, 3, 3000, 1, 8),
(9, '2024-07-08', 12500, 12000, 4, 3000, 1, 9),
(10,'2024-07-09', 15500, 15000, 5, 3000, 0, 10),
(11,'2024-07-10', 7500, 7000, 2, 3500, 1, 11),
(12,'2024-07-11', 5500, 5000, 2, 2500, 1, 12),
(13,'2024-07-12', 4500, 4000, 1, 4000, 0, 13),
(14,'2024-07-13', 9500, 9000, 3, 3000, 1, 14),
(15,'2024-07-14', 11500, 11000, 5, 2200, 1, 15);



INSERT INTO Cuotas (ID_Prestamo, Nro_cuota, Monto, Fecha_de_pago, Estado) VALUES
(1, 1, 5000, NULL, 1),
(2, 1, 3000, NULL, 1),
(3, 1, 3000, NULL, 1),
(4, 1, 3000, NULL, 1),
(5, 1, 2000, NULL, 1),
(6, 1, 2000, NULL, 1),
(7, 1, 2000, NULL, 1),
(8, 1, 3000, NULL, 1),
(9, 1, 3000, NULL, 1),
(10,1, 3000, NULL, 1),
(11,1, 3500, NULL, 1),
(12,1, 2500, NULL, 1),
(13,1, 4000, NULL, 1),
(14,1, 3000, NULL, 1),
(15,1, 2200, '2024-07-15', 0);


