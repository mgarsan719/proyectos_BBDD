-- Cabecera
drop database if exists daw_fishing;
create database daw_fishing;
use daw_fishing;

-- Tablas 
create table especie(
	ID bigint primary key auto_increment,
    nombre_comun varchar(250),
    nombre_cientifico varchar(250),
    origen varchar(250)
);

create table señuelo(
	ID bigint primary key auto_increment,
    nombre varchar(250),
    marca varchar(250),
    precio decimal(16,2)
);

create table provincia(
	ID bigint primary key auto_increment,
    nombre varchar(250),
    pais varchar(250)
);

create table 