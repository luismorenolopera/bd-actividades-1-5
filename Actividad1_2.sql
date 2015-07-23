-- crear bd
CREATE DATABASE arrendamiento

-- usar bd
use arrendamiento

-- crear tabla propiedad
CREATE TABLE propiedad(
	codigoPropiedad INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	tipo NVARCHAR(20),
	direccion NVARCHAR(30),
	ciudad NVARCHAR(30),
	habitaciones INT,
	servicios INT,
	tipoCocina NVARCHAR(30),
	garage NVARCHAR(30),
	sala INT,
	comedor INT
)

INSERT INTO propiedad
(tipo, direccion, ciudad, habitaciones, servicios, tipoCocina, garage, sala, comedor)
VALUES
('apartamento', 'calle 45', 'medellin', 3, 2, 'integral', 'si', 1, 1),
('casa', 'calle 50', 'envigado', 4, 3, 'semi integral', 'no', 2, 1)

SELECT * FROM propiedad
