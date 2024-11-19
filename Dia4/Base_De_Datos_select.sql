use AutoRental;

-- 1. Obtener todos los alquileres realizados por un cliente específico
SELECT a.ID_Alquiler, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Alquiler_Semana, a.Valor_Pagado, v.Tipo_Vehiculo, v.Placa, v.Modelo
FROM Alquiler a
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE a.ID_Cliente = 1;  -- cambiar el ID del cliente

-- 2. Lista de empleados que trabajan en una sucursal específica
SELECT e.Nombres, e.Apellidos, e.Celular, e.Correo_Electronico, s.Ciudad 
FROM Empleado e
JOIN Sucursal s ON e.ID_Sucursal = s.ID_Sucursal
WHERE e.ID_Sucursal = 1;  -- cambiar el ID de la sucursal


-- 3. Verificar todos los vehículos disponibles en una sucursal determinada
SELECT v.Tipo_Vehiculo, v.Placa, v.Modelo, v.Color, v.Puertas
FROM Vehiculo v
JOIN Alquiler a ON v.ID_Vehiculo = a.ID_Vehiculo
WHERE a.ID_Sucursal_Salida = 1  -- Cambia el ID de la sucursal según
  AND a.Fecha_Llegada < CURDATE();  -- Vehículos que ya han sido devueltos



-- 4. 
SELECT v.Placa, v.Modelo, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Pagado
FROM Alquiler a
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE a.ID_Cliente = 3;  -- Cambia el ID del cliente

-- 5.
SELECT c.Nombres, c.Apellidos, v.Placa, v.Modelo, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Pagado
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE a.Fecha_Salida = '2024-10-01';  -- Cambia la fecha


-- 6.
SELECT a.ID_Alquiler, a.ID_Cliente, c.Nombres AS Cliente, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Pagado
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
WHERE a.Fecha_Salida BETWEEN '2024-10-01' AND '2024-10-15';  -- Cambia el rango de fechas


-- 7. 
SELECT e.Nombres AS Empleado, e.Celular AS Celular_Empleado, c.Nombres AS Cliente, c.Celular AS Celular_Cliente
FROM Empleado e
JOIN Sucursal s ON e.ID_Sucursal = s.ID_Sucursal
JOIN Alquiler a ON s.ID_Sucursal = a.ID_Sucursal_Salida
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
WHERE s.ID_Sucursal = 2;


-- 8. 
SELECT c.Nombres AS Cliente, v.Placa, v.Modelo, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Pagado
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
ORDER BY a.Fecha_Salida DESC;  


-- 9. 
SELECT s.Ciudad, COUNT(a.ID_Alquiler) AS Total_Alquileres
FROM Alquiler a
JOIN Sucursal s ON a.ID_Sucursal_Salida = s.ID_Sucursal
GROUP BY s.Ciudad
ORDER BY Total_Alquileres DESC
LIMIT 1; 


-- 10. 
SELECT s.Ciudad, COUNT(a.ID_Alquiler) AS Total_Alquileres
FROM Alquiler a
JOIN Sucursal s ON a.ID_Sucursal_Salida = s.ID_Sucursal
GROUP BY s.Ciudad
ORDER BY Total_Alquileres DESC
LIMIT 1;  -- Muestra la sucursal con más alquileres


-- 11. 
SELECT v.Placa, v.Modelo, v.Tipo_Vehiculo, v.Color
FROM Vehiculo v
WHERE v.Sunroof = FALSE;


-- 12. 
SELECT s.Ciudad, SUM(a.Valor_Pagado) AS Total_Ingresos
FROM Alquiler a
JOIN Sucursal s ON a.ID_Sucursal_Salida = s.ID_Sucursal
GROUP BY s.Ciudad
HAVING s.ID_Sucursal = 1;

-- 13. 
SELECT c.Nombres, c.Apellidos, COUNT(a.ID_Alquiler) AS Total_Alquileres
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
GROUP BY c.ID_Cliente
HAVING COUNT(a.ID_Alquiler) > 1;


-- 14. 
SELECT e.Nombres, e.Apellidos, e.Celular, COUNT(a.ID_Alquiler) AS Total_Alquileres
FROM Alquiler a
JOIN Empleado e ON a.ID_Empleado = e.ID_Empleado
WHERE a.Fecha_Salida BETWEEN '2024-10-01' AND '2024-10-15'  -- Cambiar fechas
GROUP BY e.ID_Empleado;


-- 15. 
SELECT v.Tipo_Vehiculo, COUNT(v.ID_Vehiculo) AS Total_Vehiculos
FROM Vehiculo v
JOIN Alquiler a ON v.ID_Vehiculo = a.ID_Vehiculo
GROUP BY v.Tipo_Vehiculo;


-- 16. 
SELECT c.Nombres, c.Apellidos, v.Placa, v.Modelo, v.Capacidad, a.Fecha_Salida, a.Fecha_Llegada
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE v.Capacidad > 5;


-- 17. 
SELECT s.Ciudad AS Sucursal, v.Placa, v.Modelo, c.Nombres AS Cliente, a.Fecha_Salida, a.Fecha_Llegada
FROM Alquiler a
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
JOIN Sucursal s ON a.ID_Sucursal_Salida = s.ID_Sucursal
WHERE s.ID_Sucursal = 2;  -- Cambiar el ID de la sucursal


-- 18. 
SELECT v.Placa, v.Modelo, a.Porcentaje_Descuento, a.Valor_Pagado, c.Nombres AS Cliente
FROM Alquiler a
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
WHERE a.Porcentaje_Descuento > 15;


-- 19.
SELECT s.Ciudad, SUM(a.Valor_Pagado) AS Total_Ingresos
FROM Alquiler a
JOIN Sucursal s ON a.ID_Sucursal_Salida = s.ID_Sucursal
GROUP BY s.ID_Sucursal
ORDER BY Total_Ingresos DESC
LIMIT 1;  -- Solo muestra la sucursal con más ingresos


-- 20. 
SELECT c.Nombres, c.Apellidos, v.Placa, v.Modelo, DATEDIFF(a.Fecha_Llegada, a.Fecha_Salida) AS Duracion_Alquiler
FROM Alquiler a
JOIN Cliente c ON a.ID_Cliente = c.ID_Cliente
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE DATEDIFF(a.Fecha_Llegada, a.Fecha_Salida) > 7;






