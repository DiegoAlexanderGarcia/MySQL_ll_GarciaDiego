use funciones_t2;

-- ¿Qué es una funcion deterministica y una funcion no deterministica?

-- Funcion Deterministica: Siempre devuelven el mismo resultado para un conjunto dado de parámetros de entrada.
-- Crear una funcion para calcular el area de un circulo 
DELIMITER //
CREATE FUNCTION areaCirculo (radio DOUBLE)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE area DOUBLE; -- Crear una variable interna
    SET area = 3.14 * radio*radio;
    RETURN area;
END // 
DELIMITER ;

-- Utilizar una funcion 
select areaCirculo(3);
----------------------------------------------------------------------------------
-- Función que calcule el IVA de los productos
DELIMITER //
CREATE FUNCTION totalIVA(precio DECIMAL(10,2),tasaIVA DECIMAL (5,2))
RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
	RETURN precio+ (precio*tasaIVA);
END //
DELIMITER ;

-- Uso de función creada
Select nombre , totalIVA(precio,totalIVARand(12)) as precioConIVA from productos;
----------------------------------------------------------------------------------
-- Eliminar una función existente 
Drop function if exists totalIVA;
-- Drop function if exists totalIVARand;
-- Función que calcule el IVA de los productos (No deterministico)
DELIMITER //
CREATE FUNCTION totalIVARand(precio DECIMAL(10,2))
RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
	RETURN precio+ (precio* RAND());
END //
DELIMITER ;

select totalIVARand(12);
-----------------------------------------------------------------------------------
DELIMITER //
Create function ingreso_promedio_cliente (cliente_id_interno INT)
returns decimal(10,2)
deterministic
begin
	declare ingreso decimal (10,2);
    select avg(precio) into ingreso from ordenes where cliente_id_interno = cliente_id; -- AVERAGE
    return ingreso;
end //
DELIMITER ;

drop function ingreso_promedio_cliente;

select ingreso_promedio_cliente (10);
-------------------------------------------------------------------------------------


select * from empleado;
select * from departamento;

-- #1
select apellido1 from empleado;

-- #2
select distinct apellido1 from empleado;

-- #3
select * from empleado;

-- #4
select nombre, apellido1, apellido2 from empleado;

-- #5
select id_departamento from empleado;

-- #6
select distinct id_departamento from empleado;

-- #7
select concat_ws('' ,nombre, ' ', apellido1, ' ', apellido2) as nombre_completo from empleado;

-- #8
select upper(concat_ws('' ,nombre , ' ', apellido1 , ' ', apellido2)) as nombre_completo from empleado;

-- #9
select lower(concat_ws('' , nombre , ' ', apellido1 , ' ', apellido2)) as nombre_completo from empleado;

-- #10
select REGEXP_REPLACE(nif,'[^0-9]','') as numeros , REGEXP_REPLACE(nif,'[^A-Z]','') as letras from empleado order by id;

-- #11
DELIMITER //
create function presupuesto_actual (presupuestos double, gasto double)
returns double deterministic
begin
	declare total double;
	set total = presupuestos - gasto;
    return total;
end //
DELIMITER ;

select e.id , left(e.nif,8) as 'Dígitos', right(e.nif,1) as 'Letra'
from empleado e;

drop function presupuesto_actual;
select nombre, presupuesto_actual(presupuesto, gastos) as presupuesto_actual from departamento;

-- #12
select nombre, presupuesto_actual(presupuesto, gastos) as presupuesto_actual from departamento
order by presupuesto_actual desc;

-- #13
select nombre from departamento
order by nombre asc;

-- #14
select nombre from departamento
order by nombre desc;

-- #15
select concat_ws('', apellido1, ' ', apellido2) as apellidos, nombre from empleado
order by 1,2 asc;

-- #16
select nombre, max(presupuesto) as presupuesto from departamento
group by nombre order by presupuesto desc
limit 3;  

-- #17
select nombre, min(presupuesto) as presupuesto from departamento
group by nombre order by presupuesto
limit 3;

-- #18
select nombre, max(gastos) as gastos from departamento
group by nombre order by gastos desc
limit 2;

-- #19
select nombre, min(gastos) as gastos from departamento
group by nombre order by gastos
limit 2;

-- #20
select * from empleado
limit 2,5;

-- #21
select nombre, presupuesto from departamento
where presupuesto >= 150000;

-- #22
select nombre, gastos from departamento
where gastos <= 5000;

-- #23
select nombre, presupuesto from departamento 
where presupuesto >= 100000 AND presupuesto <= 200000;

-- #24
select nombre , presupuesto from departamento where presupuesto < 100000 or presupuesto > 200000;

-- #25
select nombre , presupuesto from departamento where presupuesto between 100000 and 200000;


-- #26
select nombre , presupuesto from departamento where presupuesto not between 100000 and 200000;


-- #27
select nombre , gastos , presupuesto from departamento where gastos > presupuesto;

-- #28
select nombre , gastos , presupuesto from departamento where gastos < presupuesto;


-- #29
select nombre , gastos , presupuesto from departamento where gastos = presupuesto;


-- #30
select * from empleado where apellido2 is null;


-- #31
select * from empleado where apellido2 is not null;


-- #32
select * from empleado where apellido2 = 'López';


-- #33
select * from empleado where apellido2 = 'Díaz' or apellido2 = 'Moreno';

-- #34
select * from empleado where apellido2 in ('Díaz' , 'Moreno');

-- #35
select nombre , apellido1 , apellido2 from empleado where id_departamento = 3;

-- #36
select nombre , apellido1 , apellido2 from empleado where id_departamento in (2,4,5);

-- Consultas multitabla (Composición interna)

-- #1
select e.* , d.* from empleado e left join departamento d on e.id_departamento = d.id;


-- #2
select e.* , d.* from empleado e left join departamento d on e.id_departamento = d.id order by 8,4,5,3;


-- #3
select id , nombre from departamento where id in (select id_departamento from empleado);


-- #4
select id , nombre , presupuestoActual(presupuesto , gastos) as presupusto_actual from departamento where id in (select id_departamento from empleado);


-- #5
select nombre from departamento where id in (select id_departamento from empleado where nif = '38382980M');


-- #6
select nombre from departamento where id in (select id_departamento from empleado where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana');


-- #7
select * from empleado where id_departamento in (select id from departamento where nombre = 'I+D');


-- #8
select * from empleado where id_departamento in (select id from departamento where nombre in ('Sistemas','Contabilidad','I+D')) order by nombre asc;


-- #9
select nombre from empleado where id_departamento in (select id from departamento where presupuesto not between 100000 and 200000);


-- #10
select distinct nombre from departamento where id in (select id_departamento from empleado where apellido2 is null);


-- Consultas multitabla (Composición externa)

-- #1
select e.* , d.* from empleado e left join departamento d on e.id_departamento = d.id;


-- #2
select e.* from empleado e left join departamento d on d.id = e.id_departamento where e.id_departamento is null;


-- #3
select d.* from departamento d left join empleado e on d.id = e.id_departamento where e.id_departamento is null;


-- #4
select * from empleado e left join departamento d on d.id = e.id_departamento order by d.nombre;



-- Consultas resumen


-- #1
select sum(presupuesto) as presupuesto_total from departamento;


-- #2
select presupuesto from departamento;

