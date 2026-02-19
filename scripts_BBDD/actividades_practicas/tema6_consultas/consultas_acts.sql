use gestion_deportiva;

insert into persona (dni, nombre, apellidos, fecha_nac)
values
    ('20044309P', 'Abraham', 'Teba Ojeda', '2001-09-12');

select * from persona;

insert into jugador
values
    (23, 'Extremo derecho', '9', 2);

insert into patrocinador (nombre)
values
    ('Patrocinios Juanito Palmilla');

select * from patrocinador;

insert into partido (fecha, puntos_a, puntos_b, id_equipo_a, id_equipo_b)
values
    ('2026-01-23', 3, 0, 2, 1);

select * from partido;

insert into patrocina
values
    (8, 5);

-- Nombre de los patrocinadores a excepción de aquellos que empiezan por P
    select nombre
    from patrocinador
    where nombre not like 'P%';

-- Datos de las personas mayores de 20 años
    select *
    from persona
    where timestampdiff(year, fecha_nac, now()) > 20;

-- Muestra el nombre completo en una columna llamada nombre_completo de todas las personas cuyo dni contiene la g
    select concat_ws(' ', nombre, apellidos) as nombre_completo
    from persona
    where dni like '%G%';

-- Muestra ahora las iniciales formadas por la primera letra del nombre, primera letra del apellido y el año de la fecha de nacimiento
    select concat(left(nombre, 1), left(apellidos, 1), year(fecha_nac)) as iniciales
    from persona;

-- Muestra todos los dorsales de porteros y delanteros del sistema
select dorsal from jugador
    where posicion in ('portero', 'delantero');

-- Muestra todos los jugadores del equipo 2
select * from jugador
    where id_equipo = 2;
    
-- Muestra el jugador con el nombre de su posicion mas largo
select * from jugador 
	order by length(posicion) desc 
    limit 1;
    
-- Muestra los patrocinadores que empiezan por P o acaban por A y su id es par
describe patrocinador;
select * from patrocinador where (nombre like 'P%' or nombre like '%a') and id % 2 = 0;

-- Muestra el id y el nombre del entrenador de los equipos de mairena
describe equipo;
select nombre, id_entrenador from equipo 
	where localizacion like '%mairena%';
    
-- muestra todas las localizaciones en las que hay equipos sin repetir
select distinct localizacion from equipo;

-- muestra los datos de los partidos donde ha ganado el equipo a
select * from partido 
	where puntos_a > puntos_b;
    
-- muestra los datos de los partidos donde haya una diferencia de goles de mas de 4
select * from partido
	where (puntos_a - puntos_b) >= 4 or (puntos_b - puntos_a) > 4;

-- muestra los partidos perdidos por a jugados entre enero y marzo de 2026
select * from partido
	where puntos_a < puntos_b and fecha between '2026-01-01' and '2026-03-31';