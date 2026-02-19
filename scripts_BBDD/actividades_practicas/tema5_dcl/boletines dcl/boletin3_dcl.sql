-- ACT1 como root
create user 'usuario_test'@'localhost' identified by '0000' account lock;

-- ACT2 como root
create database prueba;
use prueba;
drop table if exists tabla1;
create table tabla1 (

	ID bigint auto_increment primary key,
    nombre varchar(250)
);

insert into tabla1 (nombre) VALUES
	('Gustabo'),
    ('Antonio'),
    ('Sara');

grant select on prueba.tabla1 to 'usuario_test'@'localhost';

-- ACT3 
alter user 'usuario_test'@'localhost' account unlock; -- desbloqueamos el usuario para poder iniciar sesion como root

set password = '1234'; -- como el usuario usuario_test

-- ACT4
rename user 'usuario_test'@'localhost' to 'usuario_test2'@'localhost'; -- como root

-- ACT5
-- para crear la vista como el usuario, hay que darle permisos
grant create view on prueba.* to 'usuario_test2'@'localhost'; -- como root
grant drop on prueba.* to 'usuario_test2'@'localhost'; -- como root
grant select on prueba.* to 'usuario_test2'@'localhost'; -- como root

-- ahora creamos la vista como el usuario_test2
create or replace view info_tabla1 as
select * from tabla1;
    
select * from info_tabla1; -- y vemos si funciona

-- ACT6
grant create user on *.* to 'usuario_test2'@'localhost'; -- como root

create user 'consulta_info'@'localhost' identified by '0000'; -- como usuario_test2

grant select on *.* to 'usuario_test2'@'localhost' with grant option; -- le damos permiso de select y permisos manejables como root

grant select on prueba.info_tabla1 to 'consulta_info'@'localhost'; -- como usuario_test2

-- ACT7
use prueba; -- como consulta_info
select * from info_tabla1; -- como consulta_info

-- ACT8
revoke all privileges on *.* from 'usuario_test2'@'localhost'; -- quitamos todos los privilegios como root
grant select on prueba.tabla1 to 'usuario_test2'@'localhost'; -- como root

show grants; -- como usuario_test2

-- ACT9
grant all privileges on *.* to 'usuario_test2'@'localhost'; -- como root

show grants; -- como usuario_test2

-- ACT10
select * from mysql.user; -- como root
drop user 'consulta_info'@'localhost'; -- como root
