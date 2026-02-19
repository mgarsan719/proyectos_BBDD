DROP DATABASE IF EXISTS productos;
CREATE DATABASE productos;
USE productos;

CREATE TABLE Categoria(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) not null
);

INSERT INTO Categoria (nombre) VALUES ('Jardín'), ('Descanso'), ('Alimentación'), ('Juguetes');

CREATE TABLE Producto(
	cod_barras CHAR(13) PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    cantidad INT,
    precio DECIMAL(16,2),
    fecha_lanzamiento DATE,
    categoria_id BIGINT,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria (id)
);

INSERT INTO Producto (cod_barras, marca, modelo, cantidad, precio, fecha_lanzamiento, categoria_id) VALUES
('8400000000001','Gardena','Cortacésped 3000',15,249.99,'2022-03-15',1),
('8400000000002','Bosch','Desbrozadora EasyCut',20,129.50,'2023-05-10',1),
('8400000000003','Keter','Caseta StoreIt',8,399.00,'2021-09-01',1),
('8400000000004','Einhell','Soplador GC-EL',25,59.99,'2022-11-20',1),
('8400000000005','Gardena','Manguera Flex 25m',40,34.95,'2020-04-12',1),
('8400000000006','Wolf-Garten','Tijeras RR150',35,19.90,'2019-02-18',1),
('8400000000007','Bosch','Cortasetos AHS45',18,89.99,'2021-06-05',1),
('8400000000008','Karcher','Hidrolimpiadora K3',12,179.00,'2023-03-22',1),
('8400000000009','Gardena','Programador Select',22,44.99,'2022-07-30',1),
('8400000000010','Compo','Sustrato Universal 50L',50,12.75,'2020-01-15',1),

('8400000000011','Pikolin','Colchón SleepPro',10,599.00,'2022-02-10',2),
('8400000000012','Flex','Somier Basic 135',14,149.99,'2021-08-21',2),
('8400000000013','Ikea','Almohada Ergonomica',60,29.99,'2023-01-12',2),
('8400000000014','Pikolin','Canapé Space',6,499.00,'2020-10-05',2),
('8400000000015','Flex','Colchón Nube',9,799.00,'2022-06-17',2),
('8400000000016','Ikea','Edredón Warm',25,39.95,'2021-11-02',2),
('8400000000017','Pikolin','Topper Visco',20,119.00,'2023-04-14',2),
('8400000000018','Flex','Almohada Gel',30,45.50,'2020-03-09',2),
('8400000000019','Ikea','Protector Colchón',50,19.99,'2019-07-27',2),
('8400000000020','Pikolin','Base Tapizada',11,199.00,'2021-12-19',2),

('8400000000021','Nestlé','Cereales Choco',80,3.95,'2023-02-01',3),
('8400000000022','Danone','Yogur Natural 4u',100,2.49,'2022-05-11',3),
('8400000000023','Campofrío','Jamón Cocido',65,2.99,'2021-04-03',3),
('8400000000024','Gallo','Macarrones 500g',120,1.35,'2020-09-14',3),
('8400000000025','Carbonell','Aceite Oliva 1L',70,8.99,'2023-01-25',3),
('8400000000026','Central Lechera','Leche Entera',200,0.95,'2022-08-08',3),
('8400000000027','Bimbo','Pan Molde',90,1.89,'2021-06-29',3),
('8400000000028','Gallina Blanca','Caldo Pollo',75,1.75,'2020-02-20',3),
('8400000000029','Hero','Mermelada Fresa',60,2.35,'2019-11-11',3),
('8400000000030','La Asturiana','Mantequilla',55,2.79,'2022-03-03',3),

('8400000000031','Lego','City Policía',40,24.99,'2023-03-10',4),
('8400000000032','Mattel','Barbie Dream',35,29.95,'2022-09-18',4),
('8400000000033','Hasbro','Monopoly Clásico',28,27.50,'2021-10-01',4),
('8400000000034','Famosa','Nenuco Baño',32,34.99,'2020-06-22',4),
('8400000000035','Playmobil','Granja 123',20,39.99,'2022-12-05',4),
('8400000000036','Lego','Technic Coche',15,49.99,'2023-04-28',4),
('8400000000037','Mattel','Hot Wheels Pack',45,19.95,'2021-07-07',4),
('8400000000038','Hasbro','Jenga',50,18.99,'2019-05-13',4),
('8400000000039','Famosa','Pinypon Casa',18,44.95,'2020-11-30',4),
('8400000000040','Playmobil','Piratas Barco',12,59.99,'2022-02-14',4),
('8400000000041','Lego','Duplo Animales',22,29.99,'2021-03-09',4),
('8400000000042','Mattel','Uno Cartas',70,9.99,'2018-08-20',4),
('8400000000043','Hasbro','Trivial Junior',26,24.99,'2023-01-09',4),
('8400000000044','Famosa','Nancy Fashion',14,39.95,'2022-04-04',4),
('8400000000045','Playmobil','Castillo',10,79.99,'2020-12-12',4),
('8400000000046','Lego','Starfighter',16,54.99,'2023-06-01',4),
('8400000000047','Mattel','Cars Rayo',33,14.99,'2021-09-09',4),
('8400000000048','Hasbro','Play-Doh Pack',55,12.95,'2020-01-19',4),
('8400000000049','Famosa','Barriguitas',24,21.99,'2019-10-10',4),
('8400000000050','Playmobil','Zoo',13,49.99,'2022-07-21',4);


SELECT c.nombre, count(p.cod_barras) as num_productos
FROM categoria c 
	JOIN producto p on p.categoria_id = c.id
GROUP BY c.nombre;