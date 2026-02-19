-- 1. Crear usuario global con nombre y apellidos con contraseña y bloqueado por defecto, que sea admin (todos los permisos de manera global)

-- como root:
create user 'mario_garcia'@'%' identified by '0000' account lock;
grant all privileges on *.* to 'mario_garcia'@'%';

-- desbloquear usuario, conectar como usuario, cambiar contraseña como usuario, mostrar privilegios, mostrar nombre usuario conectado

-- como root:
alter user 'mario_garcia'@'%' account unlock; 

-- como mario_garcia:
set password = '2222';
show grants;
select current_user();

-- 2. El usuario crea este esquema de base de datos

-- como mario_garcia:
drop database if exists fp_dual;
create database fp_dual;
use fp_dual;

create table alumno(
	id bigint primary key auto_increment,
    nombre varchar(250),
    apellidos varchar(250)
);

create table empresa(
	cif char(9) primary key,
    sede varchar(250),
    nombre varchar(250)
);

create table convenio(
	fecha_convenio date,
    id_alumno bigint,
    cif_empresa char(9),
	es_dual boolean,

    constraint pk_convenio primary key(fecha_convenio, id_alumno, cif_empresa),
    constraint fk_alumno_convenio foreign key(id_alumno) references alumno(id),
	constraint fk_empresa_convenio foreign key(cif_empresa) references empresa(cif)
); 


-- 3. El user admin crea dos otros usuarios: lector (consulta) y escritor (insercion)

-- como mario_garcia:
create user 'escritor'@'localhost' identified by '0000';
create user 'lector'@'localhost' identified by '0000'; 
 
-- como root:
grant all privileges on *.* to 'mario_garcia'@'%' with grant option;

-- como mario_garcia:
grant insert on fp_dual.* to 'escritor'@'localhost'; 
grant select on fp_dual.* to 'lector'@'localhost';

-- 4. El escritor haga un insert en cada tabla y el lector las lea

-- como mario_garcia: (necesitamos permiso de select)
grant select on fp_dual.* to 'escritor'@'localhost';

-- como escritor:
use fp_dual;
insert into fp_dual.alumno(nombre, apellidos) values
	('Juan', 'Palmilla');

insert into fp_dual.empresa(cif, sede, nombre) values
	('45478568O', 'Sevilla', 'Ayesa');
    
insert into fp_dual.convenio values
	('2026-05-15', 1, '45478568O', true);
    
-- como lector:
use fp_dual;

select * from fp_dual.alumno;
select * from fp_dual.empresa;
select * from fp_dual.convenio;

-- 5. Al usuario lector puede crear vistas y hace vista de todas las tablas

-- como mario_garcia:
grant create view, drop on fp_dual.* to 'lector'@'localhost';

-- como lector:
use fp_dual;
create or replace view vista_fp_dual as
	select 
		alumno.id id_alumno,
        alumno.nombre nombre_alumno,
        alumno.apellidos apellidos_alumno,
		empresa.nombre nombre_empresa,
		empresa.cif cif_empresa,
		empresa.sede sede_empresa,
        convenio.fecha_convenio,
        convenio.es_dual es_dual_convenio
    from alumno, convenio, empresa
	where alumno.id = convenio.id_alumno AND empresa.cif = convenio.cif_empresa;
    
    select * from vista_fp_dual;
    
-- 6. Quitar a admin todos los permisos y dejar solo para ver select para la vista creada
    
-- como root:
revoke all privileges, grant option from 'mario_garcia'@'%';
grant select on fp_dual.vista_fp_dual to 'mario_garcia'@'%';

-- como mario_garcia:
use fp_dual;
select * from vista_fp_dual;
