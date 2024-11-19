# AutoRental - Sistema de Información de Alquiler de Vehículos

## Descripción

Este proyecto tiene como objetivo desarrollar un sistema de gestión de alquileres de vehículos para **AutoRental**, una empresa con una flota de vehículos en varias sucursales de diferentes ciudades. El sistema permite gestionar clientes, vehículos, sucursales, empleados y alquileres, incluyendo los cálculos de tarifas y descuentos aplicables, así como la gestión de entregas de vehículos en distintas sucursales.

## Funcionalidades Principales

- **Sucursales**: Almacenar información sobre las ciudades, direcciones y datos de contacto de las sucursales.
- **Empleados**: Gestionar los empleados que laboran en cada sucursal, incluyendo su información personal y de contacto.
- **Clientes**: Registrar los datos de los clientes, incluyendo información de contacto y residencia.
- **Vehículos**: Mantener información detallada sobre los vehículos disponibles para alquiler, como tipo, modelo, placa y características.
- **Alquileres**: Realizar la gestión de alquileres, incluyendo el cálculo de tarifas según el tipo de vehículo y duración del alquiler, además de aplicar descuentos y cargos por entregas tardías.

## Requerimientos

- **Sistema de gestión de bases de datos**: MySQL.
- **Archivos proporcionados**:
  - Base de datos con estructura ya definida.
  - Scripts para insertar datos (INSERT).
  - Consultas para seleccionar datos (SELECT).
- **Documentación adicional**: Se incluye un archivo de PDF con la documentación técnica completa del sistema, que cubre el modelo conceptual, lógico y físico de la base de datos, así como las normalizaciones y relaciones entre tablas.

## Estructura de la Base de Datos

La base de datos está organizada en las siguientes tablas:

1. **Sucursales**
   - id_sucursal (PK)
   - ciudad
   - direccion
   - telefono_fijo
   - telefono_celular
   - correo_electronico

2. **Empleados**
   - id_empleado (PK)
   - id_sucursal (FK)
   - cedula
   - nombres
   - apellidos
   - direccion
   - ciudad_residencia
   - celular
   - correo_electronico

3. **Clientes**
   - id_cliente (PK)
   - cedula
   - nombres
   - apellidos
   - direccion
   - ciudad_residencia
   - celular
   - correo_electronico

4. **Vehículos**
   - id_vehiculo (PK)
   - tipo_vehiculo
   - placa
   - referencia
   - modelo
   - puertas
   - capacidad
   - sunroof
   - motor
   - color

5. **Alquileres**
   - id_alquiler (PK)
   - id_vehiculo (FK)
   - id_cliente (FK)
   - id_empleado (FK)
   - id_sucursal_salida (FK)
   - id_sucursal_llegada (FK)
   - fecha_salida
   - fecha_llegada
   - fecha_esperada_llegada
   - valor_alquiler_semana
   - valor_alquiler_dia
   - porcentaje_descuento
   - valor_cotizado
   - valor_pagado

## Normalización de la Base de Datos

El modelo lógico ha sido normalizado hasta la **Tercera Forma Normal (3FN)** para evitar redundancia y asegurar la integridad de los datos. Los detalles de la normalización se encuentran en la documentación técnica adjunta.

## Diagrama Entidad-Relación (E-R)

El diagrama E-R muestra las relaciones entre las tablas del sistema, lo que incluye las claves foráneas y las cardinalidades de cada relación.

![Diagrama E-R](https://i.imgur.com/S4RFXG6.png)

## Instalación

1. **Importar la base de datos**:
   - Utiliza los archivos de inserción (`INSERT`) para cargar los datos iniciales en la base de datos.
   - Ejecuta los scripts de selección (`SELECT`) para realizar consultas a la base de datos y verificar la información almacenada.

2. **Requisitos de software**:
   - Asegúrate de tener MySQL para gestionar la base de datos.
   - Usa una herramienta de administración como **MySQL Workbench** para interactuar con la base de datos.

3. **Ejecutar las consultas de ejemplo**:
   - Las consultas en los archivos `SELECT` proporcionados muestran cómo obtener información sobre los alquileres, los clientes, los vehículos, y las sucursales.
   
## Ejemplo de Consultas SQL

```sql
-- obtiene la informacion de alquiler por id de veiculo: 1 
SELECT a.ID_Alquiler, a.Fecha_Salida, a.Fecha_Llegada, a.Valor_Alquiler_Semana, a.Valor_Pagado, v.Tipo_Vehiculo, v.Placa, v.Modelo
FROM Alquiler a
JOIN Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
WHERE a.ID_Cliente = 1; 

-- obtiene todos los empleados por id de sucursal: 1
SELECT e.Nombres, e.Apellidos, e.Celular, e.Correo_Electronico, s.Ciudad 
FROM Empleado e
JOIN Sucursal s ON e.ID_Sucursal = s.ID_Sucursal
WHERE e.ID_Sucursal = 1;

```
## Links de archivos adicional:

**archivo docs:**
https://docs.google.com/document/d/1lf28VEFRBZz91Nzg2Qq09-Xw7WE1bjx45hgMdogt0pc/edit?tab=t.0#heading=h.cx639fevpp57

