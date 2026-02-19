-- Cabecera
drop database if exists Agencia_viajes;
create database Agencia_viajes;
use Agencia_viajes;

-- Tablas
create table proveedor(
	ID bigint primary key auto_increment,
    CIF char(9) unique not null,
    nombre varchar(250) unique not null,
    pais varchar(250),
    url varchar(250) default 'www.default.es'
);

create table agente(
	ID bigint primary key auto_increment,
	nombre varchar(250) unique not null,
    apellidos varchar(250),
    telefono char(9),
    tipo char(1),
    
    -- Restricciones
    constraint comprueba_tipo check (upper(tipo) in ('C', 'N'))
);

create table booking(
	localizador char(6) primary key,
    f_checkin date,
    precio_coste decimal(5,2),
    precio_venta decimal(5,2),
    ID_proveedor bigint,
    ID_agente bigint,
    
    -- Restricciones
    constraint fk_booking_proveedor foreign key (ID_proveedor) references proveedor(ID),
    constraint fk_booking_agente foreign key (ID_agente) references agente(ID),
    constraint comprueba_Pventa check(precio_venta > precio_coste)
);

-- Insercion de datos
insert into proveedor(CIF, nombre, pais) values
	('R5502108C', 'Jet2Travel', 'España'),
    ('D76506849', 'Corendon', 'Turquía');

select * from proveedor;

describe agente;

insert into agente(nombre, apellidos, telefono, tipo)  values
	('Eduardo', 'Ruiz Salvador', '953639337', 'C'),
    ('Elisa', 'Cáceres Pulido', '971408799', 'N');

select * from agente;

describe booking;

insert into booking(localizador, f_checkin, precio_coste, precio_venta, ID_proveedor, ID_agente) values
	('ZN5DSC', '2022-10-19', 150.12, 299.9, 1, 1),
    ('SF3XSR', '2022-12-30', 194.64, 275, 1, 2),
	('XL14LH', '2023-04-06', 701, 881.50, 2, 1);
    
select * from booking;

-- Alteracion de constraints para el borrado de datos
alter table booking drop constraint fk_booking_proveedor;
alter table booking add constraint fk_booking_proveedor foreign key (ID_proveedor) references proveedor(ID) on delete cascade;

-- Borrar el proveedor Corendon
select * from proveedor;
delete from proveedor where ID=2;
select * from proveedor;

-- Cambiar el id de Elisa
alter table booking drop constraint fk_booking_agente;
alter table booking add constraint fk_booking_agente foreign key (ID_agente) references agente(ID) on update cascade;
update agente set ID=7 where ID=2;
select * from agente;

-- Nuevo tipo de agente 'ST'
alter table agente drop constraint comprueba_tipo;
alter table agente modify tipo char(2);
alter table agente add constraint comprueba_tipo check (upper(tipo) in ('C', 'N', 'ST'));

-- Borrar todas las tablas del sistema
drop table booking;
drop table proveedor;
drop table agente;
