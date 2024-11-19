use triggers_eventos_t2;

select * from countries;

select * from departments;

select job_title, min_salary from jobs;

select * from departments d
inner join employees e on d.employee_id = e.employee_id; 

select * from departments;
select * from employees; 
select d.department_name, l.city, avg(e.salary) as avg_salary 
from departments d
join employees e on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
group by department_id, job_id
order by department_id, job_id; 

select e.first_name,e.last_name,j.job_title,d.department_name,l.street_address from jobs j 
inner join employees e on e.job_id=j.job_id 
inner join departments d  on e.department_id=d.department_id
inner join locations l on d.location_id=l.location_id ;

DELIMITER //
CREATE function obtenerPais_Nombre(country_id char(2))
returns varchar(50) deterministic
begin
	declare country_name varchar(50);
    select country_name into country_name
    from countries
    where country_id = country_id;
    return country_name;
end
// DELIMITER ;
-- drop function obtenerPais_Nombre;
select obtenerPais_Nombre('US');

DELIMITER // 
CREATE PROCEDURE insertarRegion(in name_region varchar(50))
begin
insert into regions(name_region) values(nombre_region);
end
// DELIMITER ;
-- drop procedure insertarRegion;
call insertarRegion('Africa');

select * from regions;