USE universidad_T2;

-- Devuelve todos los datos del alumno más joven.
select * from alumno
where fecha_nacimiento = (
select max(fecha_nacimiento)
from alumno
);

-- Devuelve un listado con los profesores que no están asociados a un departamento.
select * from profesor
where id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
select * from departamento
left join profesor on departamento.id = profesor.id_departamento
where id_departamento is null;

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
select * from profesor
left join asignatura on profesor.id = asignatura.id_profesor
where profesor.id_departamento is not null and asignatura.id_profesor is null;


-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.* from asignatura a
where a.id_profesor is null;

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select distinct d.* ,a.nombre from departamento d
left join profesor on profesor.id_departamento = d.id
left join asignatura a on a.id_profesor = profesor.id
where a.id_profesor is null




/*
Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

Devuelve un listado con los profesores que no están asociados a un departamento.

Devuelve un listado con los departamentos que no tienen profesores asociados.

Devuelve un listado con los profesores que no imparten ninguna asignatura.

Devuelve un listado con las asignaturas que no tienen un profesor asignado.

Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
*/