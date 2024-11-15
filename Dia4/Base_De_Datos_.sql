CREATE DATABASE AutoRental;
USE AutoRental;

drop database AutoRental;

CREATE TABLE Sucursal (
    ID_Sucursal INT AUTO_INCREMENT PRIMARY KEY,
    Ciudad VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono_Fijo VARCHAR(20),
    Telefono_Celular VARCHAR(20),
    Correo_Electronico VARCHAR(100)
);

CREATE TABLE Ciudad (
    ID_Ciudad INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Ciudad VARCHAR(100)
);


CREATE TABLE Empleado (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Cedula VARCHAR(20),
    Nombres VARCHAR(100),
    Apellidos VARCHAR(100),
    Direccion VARCHAR(255),
    ID_Ciudad INT,
    Celular VARCHAR(20),
    Correo_Electronico VARCHAR(100),
    ID_Sucursal INT,
    FOREIGN KEY (ID_Ciudad) REFERENCES Ciudad(ID_Ciudad),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

CREATE TABLE Cliente (
	ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Cedula VARCHAR(20),
    Nombres VARCHAR(100),
    Apellidos VARCHAR(100),
    Direccion VARCHAR(255),
    ID_Ciudad INT,
    Celular VARCHAR(20),
    Correo_Electronico VARCHAR(100),
    FOREIGN KEY (ID_Ciudad) REFERENCES Ciudad(ID_Ciudad)
);

CREATE TABLE Vehiculo (
    ID_Vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Vehiculo VARCHAR(50),
    Placa VARCHAR(20),
    Referencia VARCHAR(50),
    Modelo INT,
    Puertas INT,
    Capacidad INT,
    Sunroof BOOLEAN,
    Motor VARCHAR(50),
    Color VARCHAR(50)
);

CREATE TABLE Alquiler (
    ID_Alquiler INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Empleado INT,
    ID_Vehiculo INT,
    ID_Sucursal_Salida INT,
    Fecha_Salida DATE,
    ID_Sucursal_Llegada INT,
    Fecha_Llegada DATE,
    Fecha_Esperada_Llegada DATE,
    Valor_Alquiler_Semana DECIMAL(10, 2),
    Valor_Alquiler_Dia DECIMAL(10, 2),
    Porcentaje_Descuento DECIMAL(5, 2),
    Valor_Cotizado DECIMAL(10, 2),
    Valor_Pagado DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo),
    FOREIGN KEY (ID_Sucursal_Salida) REFERENCES Sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Sucursal_Llegada) REFERENCES Sucursal(ID_Sucursal)
);

