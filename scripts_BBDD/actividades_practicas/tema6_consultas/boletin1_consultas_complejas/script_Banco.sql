DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE banco;

CREATE TABLE Cliente (
    cod_cliente INT AUTO_INCREMENT,
    apellidos   VARCHAR(100) NOT NULL,
    nombre      VARCHAR(100) NOT NULL,
    direccion   VARCHAR(200),
    PRIMARY KEY (cod_cliente)
);

CREATE TABLE Sucursal (
    cod_sucursal        INT AUTO_INCREMENT,
    direccion           VARCHAR(200),
    capital_anio_anterior DECIMAL(15,2),
    PRIMARY KEY (cod_sucursal)
);

CREATE TABLE Cuenta (
    cod_cuenta   INT AUTO_INCREMENT,
    saldo        DECIMAL(15,2) NOT NULL,
    interes      DECIMAL(5,2),
    cod_cliente  INT NOT NULL,
    cod_sucursal INT NOT NULL,
    PRIMARY KEY (cod_cuenta),
    FOREIGN KEY (cod_cliente)
        REFERENCES Cliente(cod_cliente),
    FOREIGN KEY (cod_sucursal)
        REFERENCES Sucursal(cod_sucursal)
);

CREATE TABLE Tipo_movimiento (
    cod_tipo_mov INT AUTO_INCREMENT,
    descripcion  VARCHAR(100),
    salida       BOOLEAN,
    PRIMARY KEY (cod_tipo_mov)
);

CREATE TABLE Movimiento (
    mes          INT,
    num_mov_mes  INT,
    importe      DECIMAL(15,2) NOT NULL,
    hora         TIME,
    dia          INT,
    anio         INT,
    cod_cuenta   INT NOT NULL,
    cod_tipo_mov INT NOT NULL,
    PRIMARY KEY (mes, num_mov_mes),
    FOREIGN KEY (cod_cuenta)
        REFERENCES Cuenta(cod_cuenta),
    FOREIGN KEY (cod_tipo_mov)
        REFERENCES Tipo_movimiento(cod_tipo_mov)
);

INSERT INTO Cliente (apellidos, nombre, direccion) VALUES
('García López', 'Juan', 'Calle Mayor 1, Madrid'), ('Martínez Soler', 'Ana', 'Av. Constitución 45, Valencia'),
('Rodríguez Pont', 'Luis', 'Plaza España 12, Barcelona'), ('Sánchez Ruiz', 'María', 'Calle Real 8, Sevilla'),
('Pérez Gómez', 'Carlos', 'Calle Nueva 22, Bilbao'), ('Fernández Sanz', 'Laura', 'Paseo del Prado 5, Madrid'),
('González Rey', 'Pedro', 'Calle Alborán 3, Málaga'), ('Jiménez Lara', 'Lucía', 'Calle Estrecha 9, Toledo'),
('Díaz Morales', 'Diego', 'Av. Libertad 101, Zaragoza'), ('Moreno Ortiz', 'Elena', 'Calle Pez 14, Murcia'),
('Álvarez Vega', 'Javier', 'Calle Luna 2, Oviedo'), ('Romero León', 'Sonia', 'Calle Sol 33, Santander'),
('Torres Cano', 'Pablo', 'Gran Vía 50, Granada'), ('Suárez Gil', 'Irene', 'Calle Norte 11, Gijón'),
('Castro Mas', 'Hugo', 'Calle Larga 77, Alicante'), ('Navarro Paz', 'Alba', 'Av. Argentina 5, Vigo'),
('Ramos Vidal', 'Marcos', 'Calle Mayor 10, Salamanca'), ('Vázquez Reig', 'Sara', 'Calle Baja 4, Córdoba'),
('Serrano Cruz', 'Jorge', 'Calle Olmo 15, Valladolid'), ('Blanco Vila', 'Marta', 'Calle Pino 8, Burgos');

INSERT INTO Sucursal (direccion, capital_anio_anterior) VALUES
('Centro Urbano, Madrid', 5000000.00), ('Barrio Histórico, Barcelona', 3500000.00),
('Zona Comercial, Valencia', 2800000.00), ('Parque Tecnológico, Málaga', 1500000.00),
('Avenida Central, Sevilla', 2200000.00);

INSERT INTO Tipo_movimiento (descripcion, salida) VALUES
('Depósito Efectivo', false), ('Retiro Cajero', true), 
('Transferencia Recibida', false), ('Pago con Tarjeta', true),
('Cobro Intereses', false);

-- 3. INSERCIÓN DE CUENTAS (25 registros)
INSERT INTO Cuenta (saldo, interes, cod_cliente, cod_sucursal) VALUES
(1500.50, 1.5, 1, 1), (2800.00, 2.0, 2, 2), (500.75, 0.5, 3, 3), (12400.00, 3.5, 4, 1),
(3150.20, 1.2, 5, 5), (980.00, 0.7, 6, 2), (4500.00, 2.5, 7, 4), (120.40, 0.2, 8, 3),
(6700.00, 2.8, 9, 1), (15600.00, 4.0, 10, 5), (2200.00, 1.5, 11, 2), (890.50, 0.8, 12, 3),
(3400.00, 2.0, 13, 4), (1100.00, 1.1, 14, 5), (7600.25, 3.0, 15, 1), (430.00, 0.4, 16, 2),
(9000.00, 3.2, 17, 3), (2100.60, 1.5, 18, 4), (5400.00, 2.1, 19, 5), (320.00, 0.5, 20, 1),
(10500.00, 2.9, 1, 4), (250.00, 0.1, 2, 1), (4300.00, 2.0, 3, 5), (8900.00, 3.1, 5, 2), (1250.00, 1.0, 8, 4);

-- 4. INSERCIÓN DE MOVIMIENTOS (50 registros)
INSERT INTO Movimiento (mes, num_mov_mes, importe, hora, dia, anio, cod_cuenta, cod_tipo_mov) VALUES
(1, 1, 100.00, '10:30:00', 5, 2025, 1, 1), (1, 2, 50.00, '12:15:00', 10, 2025, 1, 2),
(1, 3, 200.00, '09:00:00', 2, 2025, 2, 3), (1, 4, 30.50, '18:45:00', 15, 2025, 2, 4),
(1, 5, 1000.00, '11:00:00', 1, 2025, 4, 1), (1, 6, 150.00, '14:20:00', 20, 2025, 4, 2),
(2, 1, 45.00, '08:10:00', 5, 2025, 1, 4), (2, 2, 500.00, '13:00:00', 12, 2025, 1, 1),
(2, 3, 12.50, '10:00:00', 28, 2025, 2, 5), (2, 4, 100.00, '11:30:00', 14, 2025, 5, 2),
(3, 1, 300.00, '15:00:00', 3, 2025, 7, 1), (3, 2, 20.00, '16:20:00', 10, 2025, 7, 4),
(3, 3, 85.00, '19:00:00', 22, 2025, 7, 2), (3, 4, 1500.00, '09:30:00', 1, 2025, 10, 1),
(3, 5, 200.00, '11:00:00', 15, 2025, 10, 2), (3, 6, 60.00, '12:00:00', 5, 2025, 11, 4),
(4, 1, 50.00, '10:45:00', 2, 2025, 1, 2), (4, 2, 120.00, '11:15:00', 4, 2025, 15, 3),
(4, 3, 40.00, '17:30:00', 18, 2025, 15, 4), (4, 4, 25.00, '10:00:00', 30, 2025, 17, 5),
(5, 1, 1000.00, '09:00:00', 1, 2025, 19, 1), (5, 2, 450.00, '14:00:00', 10, 2025, 19, 2),
(5, 3, 15.00, '08:30:00', 5, 2025, 20, 4), (5, 4, 100.00, '12:00:00', 20, 2025, 20, 1),
(6, 1, 200.00, '10:15:00', 1, 2025, 3, 3), (6, 2, 50.00, '11:00:00', 15, 2025, 3, 2),
(6, 3, 80.00, '13:00:00', 2, 2025, 6, 4), (6, 4, 200.00, '16:00:00', 14, 2025, 6, 1),
(7, 1, 500.00, '09:00:00', 1, 2025, 9, 3), (7, 2, 100.00, '12:00:00', 15, 2025, 9, 2),
(7, 3, 30.00, '18:00:00', 20, 2025, 12, 4), (7, 4, 200.00, '10:00:00', 25, 2025, 12, 1),
(8, 1, 150.00, '11:00:00', 5, 2025, 14, 2), (8, 2, 300.00, '14:30:00', 12, 2025, 14, 3),
(8, 3, 25.50, '10:00:00', 30, 2025, 18, 5), (9, 1, 75.00, '16:00:00', 10, 2025, 5, 4),
(9, 2, 1000.00, '09:00:00', 15, 2025, 5, 1), (10, 1, 400.00, '11:00:00', 1, 2025, 8, 3),
(10, 2, 60.00, '15:00:00', 20, 2025, 8, 2), (11, 1, 90.00, '12:00:00', 10, 2025, 13, 4),
(11, 2, 500.00, '10:00:00', 15, 2025, 13, 1), (12, 1, 2000.00, '09:00:00', 22, 2025, 4, 3),
(12, 2, 100.00, '18:00:00', 24, 2025, 4, 2), (12, 3, 50.00, '10:00:00', 30, 2025, 10, 5),
(1, 7, 120.00, '14:00:00', 25, 2025, 1, 2), (1, 8, 300.00, '11:00:00', 28, 2025, 1, 1),
(2, 5, 60.00, '19:00:00', 15, 2025, 2, 4), (2, 6, 100.00, '10:00:00', 20, 2025, 2, 1),
(3, 7, 40.00, '12:00:00', 10, 2025, 10, 2), (3, 8, 15.00, '10:00:00', 30, 2025, 10, 5);