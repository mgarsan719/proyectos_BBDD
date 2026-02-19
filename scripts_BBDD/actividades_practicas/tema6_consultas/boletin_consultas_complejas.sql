use banco;
-- 1. Mostrar el saldo medio de todas las cuentas de la entidad bancaria.
describe cuenta;
select round(avg(saldo), 2) as media_saldo 
from cuenta;

-- 2. Mostrar la suma de los saldos de todas las cuentas bancarias.
select sum(saldo) as suma_saldo 
from cuenta;

-- 3. Mostrar el saldo mínimo, máximo y medio de todas las cuentas bancarias.
select min(saldo) as saldo_minimo, max(saldo) as saldo_maximo, avg(saldo) as saldo_medio 
from cuenta;

-- 4. Mostrar la suma de los saldos y el saldo medio de las cuentas bancarias agrupadas
-- por su código de sucursal.
select sum(saldo) as suma_saldos, avg(saldo) as media_saldos, cod_sucursal 
from cuenta
group by cod_sucursal;

-- 5. Para cada cliente del banco se desea conocer su código, la cantidad total que tiene
-- depositada en la entidad y el número de cuentas abiertas.
select cod_cliente, sum(saldo) as saldo_total, count(cod_cuenta) as cuentas_totales 
from cuenta
group by cod_cliente;

-- 6. Retocar la consulta anterior para que aparezca el nombre y apellidos de cada cliente
-- en vez de su código de cliente.
select * from movimiento;
describe cliente;
select 
	concat_ws(' ', cl.nombre, cl.apellidos) as nombre_completo_cliente, 
	sum(saldo) as saldo_total, 
    count(cod_cuenta) as cuentas_totales 
from cuenta cu 
	join cliente cl on cu.cod_cliente = cl.cod_cliente
group by cl.cod_cliente;

-- 7. Para cada sucursal del banco se desea conocer su dirección, el número de cuentas
-- que tiene abiertas y la suma total de saldo que hay en ellas.
describe sucursal;
select 
	suc.cod_sucursal, 
	direccion, 
    count(cu.cod_cuenta) as sucursales_totales, 
    sum(cu.saldo) as saldo_total
from sucursal suc
	join cuenta cu on suc.cod_sucursal = cu.cod_sucursal
group by cu.cod_sucursal;

-- 8. Mostrar el saldo medio y el interés medio de las cuentas a las que se le aplique un
-- interés mayor del 10%, de las sucursales 1 y 2
select 
	round(avg(saldo), 2) as saldo_medio, 
	round(avg(interes), 2) as interes_medio 
from cuenta
where interes > 2.5 and cod_sucursal in(1, 2);

-- 9. Mostrar los tipos de movimientos de las cuentas bancarias, sus descripciones y el
-- volumen total de dinero que se manejado en cada tipo de movimiento.
select * from cuenta;
select tmov.cod_tipo_mov, tmov.descripcion, sum(importe) as dinero_movido
from movimiento mov
	join tipo_movimiento tmov on mov.cod_tipo_mov = tmov.cod_tipo_mov
group by tmov.cod_tipo_mov;

-- 10. Mostrar cuál es la cantidad media que sacan de cajero los clientes de nuestro banco.
select 
	concat_ws(' ', cl.nombre, cl.apellidos) as nombre_completo, 
	round(avg(mov.importe), 2) as media_retirada_cajero
from movimiento mov
	join cuenta cu on mov.cod_cuenta = cu.cod_cuenta 
    join cliente cl on cu.cod_cliente = cl.cod_cliente
where mov.cod_tipo_mov = 2
group by cl.cod_cliente;

-- 11. Calcular la cantidad total de dinero que emite la entidad bancaria clasificada según
-- los tipos de movimientos de salida.
select 
	tm.descripcion as tipo,
	sum(m.importe) as total_dinero
from tipo_movimiento tm
	join movimiento m on tm.cod_tipo_mov = m.cod_tipo_mov
where tm.salida=1
group by tm.descripcion;

-- 11.2
select 
	if(tm.salida = 1, 'salida', 'entrada') as tipo,
	sum(m.importe) as total_dinero
from tipo_movimiento tm
	join movimiento m on tm.cod_tipo_mov = m.cod_tipo_mov
group by tm.salida;

-- 17
select cu.cod_cliente, sum(cu.cod_cuenta)
from cuenta cu
where cu.cod_cuenta not in (select cod_cuenta from movimiento)
group by cu.cod_cliente;

-- 19
select s.*
from sucursal s
	join cuenta cu using (cod_sucursal)
group by s.cod_sucursal
having sum(cu.saldo) > s.capital_anio_anterior;

-- 20
select m.* 
from movimiento m;
select cu.cod_cuenta, cu.saldo, tm.descripcion, sum(m.importe) as total_tipo_mov
from cuenta cu
	join movimiento m using(cod_cuenta)
    join tipo_movimiento tm using(cod_tipo_mov)
group by cu.cod_cuenta, cu.saldo, tm.descripcion
having total_tipo_mov > cu.saldo * 0.20;

-- 21
select m.* 
from movimiento m;
select cu.cod_cuenta, cu.saldo, tm.descripcion, sum(m.importe) as total_tipo_mov
from cuenta cu
	join movimiento m using(cod_cuenta)
    join tipo_movimiento tm using(cod_tipo_mov)
where cu.cod_sucursal != 4
group by cu.cod_cuenta, cu.saldo, tm.descripcion
having total_tipo_mov > cu.saldo * 0.1;





