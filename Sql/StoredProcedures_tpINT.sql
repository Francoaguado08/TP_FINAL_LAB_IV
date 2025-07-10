DELIMITER //
CREATE PROCEDURE sp_insertar_cliente(
IN p_CUIL VARCHAR(20),
IN p_DNI VARCHAR(15),
IN p_ID_Usuario INT,
IN p_Nombre VARCHAR(50),
IN p_Apellido VARCHAR(50),
IN p_Sexo VARCHAR(10),
IN p_Nacionalidad VARCHAR(50),
IN p_FechaNacimiento DATE,
IN p_Direccion VARCHAR(100),
IN p_Localidad VARCHAR(50),
IN p_Provincia VARCHAR(50),
IN p_CorreoElectronico VARCHAR(100),
IN p_Telefono VARCHAR(20)
)
BEGIN
INSERT INTO clientes (CUIL, DNI, ID_Usuario, Nombre, Apellido, Sexo, Nacionalidad, Fecha_nacimiento, Direccion, Localidad, Provincia, Correo_electronico, Telefono, Estado)
VALUES (p_CUIL, p_DNI, p_ID_Usuario, p_Nombre, p_Apellido, p_Sexo, p_Nacionalidad, p_FechaNacimiento, p_Direccion, p_Localidad, p_Provincia, p_CorreoElectronico, p_Telefono, 1);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_obtener_clientes()
BEGIN
    SELECT 
        c.ID_Cliente,
        c.CUIL,
        c.DNI,
        c.ID_Usuario,
        c.Nombre,
        c.Apellido,
        c.Sexo,
        c.Nacionalidad,
        c.Fecha_nacimiento,
        c.Direccion,
        c.Localidad,
        c.Provincia,
        c.Correo_electronico,
        c.Telefono,
        c.Estado,
        
        u.User AS Usuario_User,
        u.Pass AS Usuario_Pass,
        u.ID_Usuario AS Usuario_ID,
        
        tu.Cod_TipoUsuario AS TipoUsuario_Cod,
        tu.Descripcion AS TipoUsuario_Descripcion
        
    FROM Clientes c
    INNER JOIN Usuarios u ON c.ID_Usuario = u.ID_Usuario
    INNER JOIN TiposUsuarios tu ON u.Cod_TipoUsuario = tu.Cod_TipoUsuario;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_obtener_clientes_filtro(
IN p_dni VARCHAR(15),
IN p_usuario VARCHAR(20)

)
BEGIN
    SELECT 
        c.ID_Cliente,
        c.CUIL,
        c.DNI,
        c.ID_Usuario,
        c.Nombre,
        c.Apellido,
        c.Sexo,
        c.Nacionalidad,
        c.Fecha_nacimiento,
        c.Direccion,
        c.Localidad,
        c.Provincia,
        c.Correo_electronico,
        c.Telefono,
        c.Estado,
        
        u.User AS Usuario_User,
        u.Pass AS Usuario_Pass,
        u.ID_Usuario AS Usuario_ID,
        
        tu.Cod_TipoUsuario AS TipoUsuario_Cod,
        tu.Descripcion AS TipoUsuario_Descripcion
        
    FROM Clientes c
    INNER JOIN Usuarios u ON c.ID_Usuario = u.ID_Usuario
    INNER JOIN TiposUsuarios tu ON u.Cod_TipoUsuario = tu.Cod_TipoUsuario
	WHERE c.Estado = 1
	AND (p_dni = '' OR c.DNI LIKE CONCAT('%', p_dni, '%'))
	AND (p_usuario = '' OR u.User LIKE CONCAT('%', p_usuario, '%'));
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_obtener_cliente_por_id(
    IN p_id_cliente INT
)
BEGIN
    SELECT 
        c.ID_Cliente,
        c.CUIL,
        c.DNI,
        c.ID_Usuario,
        c.Nombre,
        c.Apellido,
        c.Sexo,
        c.Nacionalidad,
        c.Fecha_nacimiento,
        c.Direccion,
        c.Localidad,
        c.Provincia,
        c.Correo_electronico,
        c.Telefono,
        c.Estado,
        
        u.User AS Usuario_User,
        u.Pass AS Usuario_Pass,
        u.ID_Usuario AS Usuario_ID,
        
        tu.Cod_TipoUsuario AS TipoUsuario_Cod,
        tu.Descripcion AS TipoUsuario_Descripcion
        
    FROM Clientes c
    INNER JOIN Usuarios u ON c.ID_Usuario = u.ID_Usuario
    INNER JOIN TiposUsuarios tu ON u.Cod_TipoUsuario = tu.Cod_TipoUsuario
    WHERE c.ID_Cliente = p_id_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_modificar_cliente(
    IN p_ID_Cliente INT,
    IN p_CUIL VARCHAR(20),
    IN p_DNI VARCHAR(15),
    IN p_Nombre VARCHAR(50),
    IN p_Apellido VARCHAR(50),
    IN p_Sexo VARCHAR(10),
    IN p_Nacionalidad VARCHAR(50),
    IN p_FechaNacimiento DATE,
    IN p_Direccion VARCHAR(100),
    IN p_Localidad VARCHAR(50),
    IN p_Provincia VARCHAR(50),
    IN p_CorreoElectronico VARCHAR(100),
    IN p_Telefono VARCHAR(20)
)
BEGIN
    UPDATE Clientes
    SET 
        CUIL = p_CUIL,
        DNI = p_DNI,
        Nombre = p_Nombre,
        Apellido = p_Apellido,
        Sexo = p_Sexo,
        Nacionalidad = p_Nacionalidad,
        Fecha_nacimiento = p_FechaNacimiento,
        Direccion = p_Direccion,
        Localidad = p_Localidad,
        Provincia = p_Provincia,
        Correo_electronico = p_CorreoElectronico,
        Telefono = p_Telefono
    WHERE ID_Cliente = p_ID_Cliente;
END //

DELIMITER //


DELIMITER $$

CREATE PROCEDURE AgregarCuenta (
    IN p_ID_Cliente INT,
    IN p_Cod_TipoCuenta INT,
    IN p_CBU VARCHAR(30),
    IN p_Fecha_creacion DATE
)
BEGIN
    INSERT INTO Cuentas (
        ID_Cliente, Cod_TipoCuenta, CBU, Fecha_creacion, Saldo
    )
    VALUES (
        p_ID_Cliente, p_Cod_TipoCuenta, p_CBU, p_Fecha_creacion, 10000.00
    );
END$$

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_obtener_cuentas()
BEGIN
    SELECT 
        c.NroCuenta,
        tc.Descripcion AS TipoCuenta,   
        c.CBU,
        cl.CUIL AS CuilCliente,         
        c.Saldo,
        c.Fecha_creacion,
        c.Estado
    FROM Cuentas c
    INNER JOIN Clientes cl ON c.ID_Cliente = cl.ID_Cliente
    INNER JOIN TiposCuenta tc ON c.Cod_TipoCuenta = tc.Cod_TipoCuenta
    WHERE cl.Estado = 1 and c.Estado = 1;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_obtener_cuentas_filtro(
IN p_nroCuenta int,
IN p_CUIL VARCHAR(20)

)
BEGIN
    SELECT 
        c.NroCuenta,
        tc.Descripcion AS TipoCuenta,   
        c.CBU,
        cl.CUIL AS CuilCliente,         
        c.Saldo,
        c.Fecha_creacion,
        c.Estado
    FROM Cuentas c
    INNER JOIN Clientes cl ON c.ID_Cliente = cl.ID_Cliente
    INNER JOIN TiposCuenta tc ON c.Cod_TipoCuenta = tc.Cod_TipoCuenta
    WHERE cl.Estado = 1 and c.Estado = 1
	AND (p_nroCuenta = 0 OR c.NroCuenta = p_nroCuenta)
	AND (p_CUIL = '' OR cl.CUIL LIKE CONCAT('%', p_CUIL, '%'));
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_obtener_cuentas_cliente(
    IN p_ID_Cliente INT
)
BEGIN
    SELECT 
        c.NroCuenta,
        c.ID_Cliente,
        cli.CUIL,
        cli.Nombre,
        cli.Apellido,
        tc.Descripcion AS TipoCuenta_Descripcion,
        c.CBU,
        c.Fecha_creacion,
        c.Saldo
    FROM Cuentas c
    INNER JOIN TiposCuenta tc ON c.Cod_TipoCuenta = tc.Cod_TipoCuenta
    INNER JOIN Clientes cli ON c.ID_Cliente = cli.ID_Cliente
    WHERE c.ID_Cliente = p_ID_Cliente
     AND cli.Estado = 1
     AND c.Estado = 1;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_modificar_cuenta(
    IN p_NroCuenta INT,
    IN p_Cod_TipoCuenta INT,
    IN p_CBU VARCHAR(30)
)
BEGIN
    UPDATE cuentas
    SET 
        Cod_TipoCuenta = p_Cod_TipoCuenta,
        CBU = p_CBU
    WHERE NroCuenta = p_NroCuenta;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_obtener_cuenta_por_id(
    IN p_NroCuenta INT
)
BEGIN
    SELECT 
        c.NroCuenta,
        c.ID_Cliente,
        cli.CUIL,
        cli.Nombre,
        cli.Apellido,
        c.Cod_TipoCuenta,
        tc.Descripcion AS TipoCuenta_Descripcion,
        c.CBU,
        c.Fecha_creacion,
        c.Saldo
    FROM Cuentas c
    INNER JOIN TiposCuenta tc ON c.Cod_TipoCuenta = tc.Cod_TipoCuenta
    INNER JOIN Clientes cli ON c.ID_Cliente = cli.ID_Cliente
    WHERE c.NroCuenta = p_NroCuenta
     AND cli.Estado = 1
     AND c.Estado = 1;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE insertar_prestamo (
    IN p_ID_Cliente INT,
    IN p_Fecha DATE,
    IN p_Importe_a_pagar DECIMAL(12,2),
    IN p_Importe_pedido DECIMAL(12,2),
    IN p_Plazo_pago_meses INT,
    IN p_Monto_por_mes DECIMAL(12,2),
    IN p_Estado TINYINT(1),
    IN p_Cuenta_depositar VARCHAR(45)
)
BEGIN
    INSERT INTO prestamos (
        ID_Cliente,
        Fecha,
        Importe_a_pagar,
        Importe_pedido,
        Plazo_pago_meses,
        Monto_por_mes,
        Estado,
        Cuenta_depositar
    )
    VALUES (
        p_ID_Cliente,
        p_Fecha,
        p_Importe_a_pagar,
        p_Importe_pedido,
        p_Plazo_pago_meses,
        p_Monto_por_mes,
        p_Estado,
        p_Cuenta_depositar
    );
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE insertar_cuota (
    IN p_ID_Prestamo INT,
    IN p_Nro_cuota INT,
    IN p_Monto DECIMAL(12,2),
    IN p_Estado TINYINT(1)
)
BEGIN
    INSERT INTO cuotas (
        ID_Prestamo,
        Nro_cuota,
        Monto,
        Estado
    )
    VALUES (
        p_ID_Prestamo,
        p_Nro_cuota,
        p_Monto,
        p_Estado
    );
END //

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE sp_obtener_movimientos_por_cuenta (
    IN p_nroCuenta INT
)
BEGIN
    SELECT 
        m.NroMov,
        m.NroCuenta,
        m.Cod_Tipo AS codigoTipoMov,
        t.Descripcion AS descripcionTipoMov,
        m.Detalle,
        m.Importe,
        m.Fecha
    FROM 
        movimientos m
    JOIN 
        tiposmovimientos t ON m.Cod_Tipo = t.Cod_TipoMov
    WHERE 
        m.NroCuenta = p_nroCuenta
    ORDER BY 
        m.Fecha DESC, m.NroMov DESC;
END $$

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_insertar_movimiento (
    IN p_NroCuenta INT,
    IN p_Cod_Tipo INT,
    IN p_Detalle TEXT,
    IN p_Importe DECIMAL(12,2),
    IN p_Fecha DATE
)
BEGIN
    INSERT INTO movimientos (NroCuenta, Cod_Tipo, Detalle, Importe, Fecha)
    VALUES (p_NroCuenta, p_Cod_Tipo, p_Detalle, p_Importe, p_Fecha);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_transferir_cuentas(
    IN p_nroCuentaOrigen INT,
    IN p_nroCuentaDestino INT,
    IN p_importe DECIMAL(12,2)
)
BEGIN
	-- inserto los registros en Movimientos (uno negativo y otro positivo)
    INSERT INTO Movimientos (NroCuenta, Cod_Tipo, Detalle, Importe, Fecha)
    VALUES (
        p_nroCuentaOrigen,
        4,
        CONCAT('Transferencia enviada a cuenta nro: ', p_nroCuentaDestino),
        -p_importe,
        CURDATE()
    );

    INSERT INTO Movimientos (NroCuenta, Cod_Tipo, Detalle, Importe, Fecha)
    VALUES (
        p_nroCuentaDestino,
        4,
        CONCAT('Transferencia recibida de cuenta nro: ', p_nroCuentaOrigen),
        p_importe,
        CURDATE()
    );
	
    -- actualizo los saldos de las cuentas
    UPDATE Cuentas SET Saldo = Saldo - p_importe WHERE NroCuenta = p_nroCuentaOrigen;
    UPDATE Cuentas SET Saldo = Saldo + p_importe WHERE NroCuenta = p_nroCuentaDestino;

END;
//




DELIMITER //

CREATE PROCEDURE sp_insertarMovimiento (
    IN pNroCuenta INT,
    IN pCodTipo INT,
    IN pDetalle TEXT,
    IN pImporte DECIMAL(12,2),
    IN pFecha DATE
)
BEGIN
    INSERT INTO Movimientos (NroCuenta, Cod_Tipo, Detalle, Importe, Fecha)
    VALUES (pNroCuenta, pCodTipo, pDetalle, pImporte, pFecha);
END //

DELIMITER ;


DELIMITER $$

CREATE  PROCEDURE `sp_Ingresos_Egresos`(
IN fechaDesde DATE,
IN fechaHasta DATE
)
BEGIN
SELECT
SUM(CASE
	WHEN Cod_Tipo IN (1, 2) THEN Importe  -- Alta de cuenta y préstamo = ingreso
	ELSE 0
	END) AS TotalIngresos,


    SUM(CASE
        WHEN Cod_Tipo IN (3, 4) THEN Importe  -- Pago de préstamo y transferencia = egreso
        ELSE 0
    END) AS TotalEgresos
FROM movimientos
WHERE Fecha BETWEEN fechaDesde AND fechaHasta;



END$$


DELIMITER ;



