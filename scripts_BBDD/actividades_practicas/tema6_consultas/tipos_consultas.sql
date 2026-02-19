-- mostrar mensajes (como syso):
select 'hola mundo';
select 33;

-- se puede poner operadores matematicos
select 33 + 44 as suma;
select 33 / 2 as division;
select 2 * 45 as mult;
select 45 % 2 as modulo;

-- se puede poner operadores de comparacion
select 1 = 1 as comparacion;
select 2 <= 1 as menor_igual;
select 3 > 2 as mayor;

-- operadores logicos (AND ,OR XOR, NOT)
select false and false;
select true and false;
select false and true;
select true and true;

select false or false;
select true or false;
select false or true;
select true or true;

select false xor false;
select true xor false;
select false xor true;
select true xor true;

select not false;
select not true;
