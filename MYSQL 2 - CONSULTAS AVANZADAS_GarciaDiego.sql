USE universidad_T2;
select apellido1, apellido2, nombre from alumno
order by 1,2,3 asc;

-- select * from alumno
select nombre,apellido1,apellido2
from alumno where telefono is null;

select * from asignatura;
select * from asignatura where cuatrimestre = 1
and curso = 3 and id_grado = 7;

select * from grado;

select nombre from asignatura
where id_grado = 4;

select a.nombre from asignatura a
inner join grado on a.id_grado = grado.id
where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

select * from alumno_se_matricula_asignatura;

select * from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join asignatura a on asm.id_asignatura = a.id
inner join curso_escolar ce on ce.id = asm.id_curso_escolar
where ce.anyo_inicio = '2017' and ce.anyo_fin = '2018';

-- cuanto alumnos hay
select count(*) from alumno al;

-- cuantos alumnos nacidos en 1999
select count(*) total_alumno from alumno al
WHERE year (fecha_nacimiento) = 1999;

select * from alumno al;

/*
Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. 
El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar 
ordenado de mayor a menor por el número de profesores.
*/
select * from profesor;
select * from departamento;

select departamento.nombre departameto, count(*) total_profesor from profesor 
inner join departamento on departamento.id = profesor.id_departamento
group by departamento.nombre
order by total_profesor desc;

/*
Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
Estos departamentos también tienen que aparecer en el listado.
*/
select departamento.nombre, count(profesor.id) total_profesor from profesor 
left join departamento on departamento.id = profesor.id_departamento and profesor.id is not null
group by departamento.nombre

/*
Devuelve un listado con el nombre de todos los grados existentes en la base de datos y 
el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. 
Estos grados también tienen que aparecer en el listado. 
El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.


Devuelve un listado con el nombre de todos los grados existentes en la base de datos 
y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.


Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos 
que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, 
tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
Ordene el resultado de mayor a menor por el número total de crédidos.


Devuelve un listado que muestre cuántos alumnos se han matriculado 
de alguna asignatura en cada uno de los cursos escolares. 
El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar 
y otra con el número de alumnos matriculados.


Devuelve un listado con el número de asignaturas que imparte cada profesor. 
El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
El resultado estará ordenado de mayor a menor por el número de asignaturas.
*/