use almacen;

select * from almacen;

-- Ver cuantos dias de diferencia hay desde hoy hasta que se comercializo o se comercializaran los huawei free clips
select timestampdiff(day, now(), fecha_comer) as dias_para_comercializar 
from almacen 
where producto = 'Huawei Free Clips';

-- Ver el nombre de producto y el precio redondeado de todos los productos iphone (id proveedor = 27)
select producto, round(precio_unit) as precio_redondeado 
from almacen 
where id_proveedor = 27 or precio_unit > 500;

-- Ver el nombre de producto y el precio redondeado de todos los productos iphone 
-- (id proveedor = 27) o que sea de algun otro proveedor pero que su precio sea > 500€. 
-- Todos los productos que se muestren deben cumplir que su cantidad sea inferior 
-- estrictamente a la cantidad maxima que podemos almacenar de ellos
 select producto, round(precio_unit) as precio_redondeado 
from almacen 
where (id_proveedor = 27 or precio_unit > 500) and cantidad < cantidad_max;

-- muestra aquellos productos que su cantidad maxima es un numero par, que esten adquridas 
-- por proveedores cuyo id este entre 20 y 30 y su nombre tenga la i o la a
describe almacen;
select * 
from almacen 
where cantidad_max % 2 = 0 and id_proveedor between 20 and 30 and (producto like '%a%' or producto like '%i%');

-- muestra aquellos productos adquiridos en 2024 cuya diferencia entre cant max y actual 
-- supera las 30 unidades o su precio unitario es inferior a 500
select * 
from almacen 
where year(fecha_comer) = 2024 and ((cantidad_max - cantidad) > 30 or precio_unit < 500);

-- muestra aquellos productos adquiridos en 2024 cuya diferencia entre cant max y actual 
-- supera las 30 unidades o su precio unitario es inferior a 500 para todos aquellos 
-- productos adquiridos a los proveedores 27 o 29
select * 
from almacen 
where year(fecha_comer) = 2024 and ((cantidad_max - cantidad) > 30 or precio_unit < 500) and id_proveedor in (27, 29);

-- muestra el producto mas caro
select * 
from almacen 
order by precio_unit desc
limit 1;

select * 
from almacen 
where precio_unit = (select max(precio_unit) from almacen);

-- muestra el producto mas caro de cada proveedor
select max(precio_unit), id_proveedor from almacen
group by id_proveedor;

-- muestra el total de precio de producto por cada proveedor
select sum(precio_unit), id_proveedor from almacen
group by id_proveedor;

-- muestra el numero de productos que tiene cada proveedor
select count(producto) as num_productos, id_proveedor 
from almacen 
group by id_proveedor;

-- para cada proveedor muestra la cantidad total de productos que se tienen en el almacen
select id_proveedor, sum(cantidad) as cantidad_productos 
from almacen 
group by id_proveedor;

-- para cada proveedor muestra la cantidad total de productos que se tienen en el almacen ordenado de mayor a menor
select id_proveedor, sum(cantidad) as cantidad_productos 
from almacen 
group by id_proveedor 
order by cantidad_productos desc;

-- para cada proveedor muestra la cantidad total de productos que se tienen en el almacen ordenado de mayor a menor para los proveedores 26 y 29
select id_proveedor, sum(cantidad) as cantidad_productos 
from almacen 
where id_proveedor in(26, 29)
group by id_proveedor 
order by cantidad_productos desc;

-- para cada proveedor muestra la cantidad total de productos que se tienen en el almacen ordenado de mayor a menor para los proveedores 26 y 29 siempre que dicha cantidad sea mayor a 120
select id_proveedor, sum(cantidad) as cantidad_productos 
from almacen 
where id_proveedor in(26, 29)
group by id_proveedor 
having cantidad_productos > 120
order by cantidad_productos desc;




