-- ACT 1
show grants; -- Entrando como ROOT
show grants for 'root'@'localhost'; -- mostrar permisos seleccionando el usuario concreto
-- la @ es para ver los permisos locales(localhost) o globales(%)
show grants for current_user(); -- mostrar permisos de usuario acual usando funcion

-- ACT 2
create user 'Administrador'@'%' identified by 'pass_admin';
grant all privileges on *.* to 'Administrador'@'%' with grant option;

-- ACT 3
-- hecho

-- ACT 4
select *
from mysql.user; -- Entrando como Administrador
select user(); -- Entrando como Administrador

-- ACT 5
show grants; -- Entrando como Administrador

--