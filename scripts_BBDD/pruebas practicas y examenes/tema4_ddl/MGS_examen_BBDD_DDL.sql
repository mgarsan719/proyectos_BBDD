-- Cabecera
drop database if exists tallerCoches;
create database tallerCoches;
use tallerCoches;

-- Creacion de tablas (ACTS 1 Y 2)
create table propietario(
	ID bigint primary key auto_increment not null,
    DNI char(9) unique not null,
    nombre varchar(250),
    es_mayor_edad boolean default true,
    apellidos varchar(250)
);

create table vehiculo(
	num_vastidor char(17) primary key,
    combustible varchar(250),
    marca varchar(250),
    modelo varchar(250),
    ID_propietario bigint,
    
    constraint fk_vehiculo_propietario foreign key(ID_propietario) references propietario(ID),
    constraint chck_combustible check ((combustible) = 'Gasoil' or 'Gasolina' or 'Electrico')
);

create table pieza(
	ID bigint primary key auto_increment,
    fecha_fabricacion date,
    marca varchar(250),
    modelo varchar(250),
    
    constraint chck_fecha_fab check ((fecha_fabricacion >= '1981-01-01'))
);

create table empleado(
	ID bigint primary key auto_increment,
    nombre varchar(250),
    salario decimal(4,2),
    
    constraint chck_salario check ((salario) <= 2300)
);

create table arreglo(
	fecha date,
    precio decimal(16,2),
    num_vastidor_vehiculo char(17),
    ID_pieza bigint,
    ID_empleado bigint,
    
    primary key(fecha, num_vastidor_vehiculo, ID_pieza, ID_empleado),
    constraint fk_arreglo_vehiculo foreign key(num_vastidor_vehiculo) references vehiculo(num_vastidor),
    constraint fk_arreglo_pieza foreign key(ID_pieza) references pieza(ID),
	constraint fk_arreglo_empleado foreign key(ID_empleado) references empleado(ID)
);

-- Cambios necesarios para eliminar pieza (ACT 3)
alter table arreglo drop constraint fk_arreglo_pieza;
alter table arreglo add constraint fk_arreglo_pieza foreign key(ID_pieza) references pieza(ID) on delete cascade;

delete from pieza where id=1;

-- Añadir campo cilindrada en tabla vehiculo (ACT 4)
alter table vehiculo add column cilindrada int default 2000;

-- Cambios necesarios para eliminar campo fecha_fabricacion (ACT 4)
alter table pieza drop constraint chck_fecha_fab;
alter table pieza drop column fecha_fabricacion;