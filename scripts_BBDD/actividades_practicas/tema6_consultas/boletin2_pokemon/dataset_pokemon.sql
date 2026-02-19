
-- ============================================
-- DATOS DE EJEMPLO - MODELO POKÉMON (MySQL)
-- ============================================

-- TIPOS
INSERT INTO tipo (id_tipo, nombre) VALUES
(1,'Planta'),(2,'Fuego'),(3,'Agua'),(4,'Eléctrico'),
(5,'Normal'),(6,'Roca'),(7,'Tierra'),(8,'Psíquico');

-- VENTAJAS DE TIPO
INSERT INTO vence_a (tipo_fuerte, tipo_debil) VALUES
(1,7),(2,1),(3,2),(4,3),(6,2),(7,4),(8,5);

-- REGIONES
INSERT INTO region (id_region, nombre) VALUES
(1,'Kanto'),(2,'Johto'),(3,'Hoenn');

-- CIUDADES
INSERT INTO ciudad (id_ciudad, nombre, region) VALUES
(1,'Pueblo Paleta',1),
(2,'Ciudad Verde',1),
(3,'Ciudad Azafrán',1),
(4,'Pueblo Primavera',2),
(5,'Ciudad Malvalona',3);

-- GENERACIONES
INSERT INTO generacion (id_generacion, region, anyo_descubrimiento) VALUES
(1,1,1996),(2,2,1999),(3,3,2002);

-- MOVIMIENTOS
INSERT INTO movimiento (id, nombre, puntos_ataque, puntos_poder, precision_mov) VALUES
(1,'Placaje',40,35,100),
(2,'Látigo Cepa',45,25,100),
(3,'Ascuas',40,25,100),
(4,'Pistola Agua',40,25,100),
(5,'Impactrueno',40,30,100),
(6,'Arañazo',40,35,100),
(7,'Psíquico',90,10,100),
(8,'Avalancha',75,10,90),
(9,'Excavar',80,10,100);

-- SETS DE MOVIMIENTOS
INSERT INTO set_movimientos (id_set, mov_1, mov_2, mov_3, mov_4) VALUES
(1,1,2,NULL,NULL),
(2,1,6,3,NULL),
(3,1,4,NULL,NULL),
(4,1,5,NULL,NULL),
(5,8,1,NULL,NULL),
(6,9,1,NULL,NULL),
(7,7,1,NULL,NULL);

-- POKÉMON
INSERT INTO pokemon (id_pokemon, nombre, originario, set_movimientos, tipo) VALUES
(1,'Bulbasaur',1,1,1),
(2,'Ivysaur',1,1,1),
(3,'Charmander',1,2,2),
(4,'Charmeleon',1,2,2),
(5,'Squirtle',1,3,3),
(6,'Wartortle',1,3,3),
(7,'Pikachu',1,4,4),
(8,'Raichu',1,4,4),
(9,'Onix',1,5,6),
(10,'Diglett',1,6,7),
(11,'Alakazam',1,7,8);

-- ENTRENADORES
INSERT INTO entrenador (id_entrenador, nombre, lleva_zapatillas, dinero, nacido_en) VALUES
(1,101,1,2500.00,1),
(2,102,0,1800.50,2),
(3,103,1,3200.75,3),
(4,104,1,1500.00,4);

-- GIMNASIOS
INSERT INTO gimnasio (id_gym, lider, num_entrenadores, ciudad) VALUES
(1,1,12,2),
(2,3,8,3),
(3,4,6,5);

-- ENTRENAMIENTOS
INSERT INTO entrenamiento VALUES
(1,1,15,49,49,65,65,45,45,'2024-01-10','Audaz','Espesura'),
(1,7,20,55,40,50,50,90,35,'2024-02-01','Alegre','Electricidad Estática'),
(2,3,18,52,43,60,50,65,39,'2024-01-20','Firme','Mar Llamas'),
(3,11,42,50,45,135,95,120,55,'2023-12-05','Miedosa','Foco Interno'),
(4,9,30,45,160,30,45,70,35,'2024-01-15','Plácida','Cabeza Roca');
