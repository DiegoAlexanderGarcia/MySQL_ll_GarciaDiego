create database funciones_t2;
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


-- TABLA E INSERCIONES DE EXPERIMENTOS
CREATE TABLE productos (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    PRIMARY KEY (id)
);

-- drop table ordenes;
CREATE TABLE ordenes (
    id INT auto_increment,
    cliente_id INT,
    precio DECIMAL(10,2),
    categoria_cliente VARCHAR(10),
    PRIMARY KEY (id)
);