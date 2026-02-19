-- ACT1
-- como root:
create user 'alumno'@'%' identified by '0000'; 
grant all privileges on *.* to 'alumno'@'%' with grant option;

-- ACT2
-- como root:
alter user 'alumno'@'%' account lock;
alter user 'alumno'@'%' account unlock;

-- como alumno:
set password = '2222';
show grants;
select current_user();

-- ACT3
-- como alumno:
create database juegos;
use juegos;

create table puzle(
	id bigint primary key auto_increment,
	num_piezas int,
    edad_min int,
    nombre varchar(250)
);

create table pieza(
	id bigint primary key auto_increment,
    es_borde boolean,
    es_esquina boolean,
    num_picos int,
    id_puzle bigint,
    
    constraint pk_puzle_pieza foreign key pieza(id_puzle) references puzle(id)
);

-- ACT4
-- como alumno:
create user 'escritor'@'localhost' identified by '0000';
grant insert on juegos.* to 'escritor'@'localhost';

create user 'lector'@'localhost' identified by '0000';
grant select on juegos.* to 'lector'@'localhost';

create user 'visor'@'localhost' identified by '0000';
grant create view on juegos.* to 'visor'@'localhost';

-- ACT5
-- como escritor:
use juegos;
insert into juegos.puzle(num_piezas, edad_min, nombre) values
	(1000, 16, 'Noche estrellada'),
    (5000, 18, 'Las Meninas');
    
insert into juegos.pieza(es_borde, es_esquina, num_picos, id_puzle) values
	(true, false, 3, 1),
	(false, true, 4, 2);
    
-- como lector:
use juegos;
select * from juegos.pieza;
select * from juegos.puzle;

-- antes de crear la vista dar permisos de drop y select a visor como alumno: 
grant drop, select on juegos.* to 'visor'@'localhost';

-- como visor:
use juegos;
create or replace view ver_puzle_piezas as
	select 
		puzle.id id_puzle,
		puzle.nombre nombre_puzle,
		puzle.num_piezas num_piezas_puzle,
		puzle.edad_min edad_min_puzle,
		pieza.id id_pieza,
		pieza.es_borde es_borde_pieza,
		pieza.num_picos num_picos_pieza
	from juegos.puzle, juegos.pieza 
    where puzle.id = pieza.id_puzle;
    
-- ACT6
-- como root:
revoke all privileges, grant option from 'alumno'@'%';
grant select on juegos.ver_puzle_piezas to 'alumno'@'%';

-- como alumno:
use juegos;
select * from juegos.ver_puzle_piezas;

-- ACT7
-- como root:
show grants for 'visor'@'localhost';
revoke select, drop on juegos.* from 'visor'@'localhost'; -- si volvemos a ejecutar el show grants veremos que solo tiene permiso de create view

drop user 'visor'@'localhost';
select * from mysql.user; -- veremos que ya no esta