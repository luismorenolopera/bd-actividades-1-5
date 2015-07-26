CREATE DATABASE datosatv3

USE datosatv3

CREATE TABLE numeros (
	id_Num INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	dato FLOAT,
	dato2 FLOAT
)

DROP TABLE numeros

SELECT * FROM numeros

INSERT INTO numeros
(dato, dato2)
VALUES
(1, 13),
(45, 2),
(23, 4),
(12, 5),
(3, 9),
(12, 1),
(2, 2)

CREATE TABLE ventas (
	id_venta INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	cod_Vendedor NVARCHAR(15) NOT NULL,
	precio_venta MONEY
)

INSERT INTO ventas
(cod_Vendedor, precio_venta)
VALUES
('10302', 10000),
('10231', 11000000),
('12319', 2120213),
('13123', 21930192),
('2123', 120872)

SELECT * FROM ventas

-- 1 OK

SELECT dato - dato2 FROM numeros

-- 2 OK

IF (SELECT dato + dato2 FROM numeros WHERE id_Num = 2) > 25
	SELECT dato * dato2 FROM numeros WHERE id_Num = 2
ELSE
	SELECT dato / dato2 FROM numeros WHERE id_Num = 2

-- 3 OK
DROP FUNCTION f_promedio

CREATE FUNCTION dbo.f_promedio
(
	@valor1 FLOAT, @valor2 FLOAT, @valor3 FLOAT
)
RETURNS FLOAT
AS
BEGIN 
	RETURN (@valor1 + @valor2 + @valor3) / 3
END

SELECT id_Num, dato, dato2, dbo.f_promedio(id_Num, dato, dato2) AS Promedio
FROM numeros

-- 4 OK

IF (SELECT precio_venta FROM ventas WHERE id_venta = 2) > 1000000
	SELECT precio_venta * 0.10 AS Porcentaje10 FROM ventas WHERE id_venta = 2
ELSE
	SELECT precio_venta * 0.2 AS Porcentaje2 FROM ventas WHERE id_venta = 2


-- 5 OK

DECLARE @LADO INT
SET @LADO = 20

SELECT @LADO * @LADO

-- 6 OK

DECLARE @SALARIO FLOAT
SET @SALARIO = 1000000

SELECT @SALARIO * 0.08 AS [Auxilio de transporte]

-- 7 OK

DECLARE @contador INT
SET @contador = 1

WHILE(@contador < 11)
BEGIN
	PRINT(@contador)
	SET @contador = @contador + 1
END

-- 8 OK

DECLARE @I INT
SET @I = 1

WHILE(@I < 21)
BEGIN
	PRINT(@I * 2)
	SET @I = @I +1
END

-- 9 OK

DECLARE @BASE FLOAT
SET @BASE = 30

DECLARE @ALTURA FLOAT
SET @ALTURA = 45

PRINT(@BASE * @ALTURA / 2)

-- 10 OK 

DECLARE @NOTA1 FLOAT
SET @NOTA1 = 5

DECLARE @NOTA2 FLOAT
SET @NOTA2 = 3

DECLARE @NOTA3 FLOAT
SET @NOTA3 = 3

DECLARE @NOTA4 FLOAT
SET @NOTA4 = 3

DECLARE @PROM FLOAT
SET @PROM = (@NOTA1 + @NOTA2 + @NOTA3 + @NOTA4) / 4

PRINT(@PROM)

-- 11 OK


CREATE TABLE estudiantes (
	id_est INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	nombre NVARCHAR(30),
	nota1 FLOAT,
	nota2 FLOAT
)

INSERT INTO estudiantes
(nombre, nota1, nota2)
VALUES
('Luis', 5, 4),
('Juan', 1, 2)

SELECT * FROM estudiantes

SELECT AVG(nota1 + nota2) AS [Promedio General] FROM estudiantes

-- 12 OK

CREATE TABLE empleados (
	codigo INT PRIMARY KEY NOT NULL,
	nombre NVARCHAR(30),
	peso FLOAT,
	anio_nacimiento DATE,
	altura FLOAT
)

INSERT INTO empleados
(codigo, nombre, peso, anio_nacimiento, altura)
VALUES
(101, 'Carlos', 80, '1983', 1.90),
(102, 'Maria', 60, '1981', 1.70)

SELECT * FROM empleados

DECLARE @peso FLOAT
SELECT @peso = peso FROM empleados WHERE codigo = 102

DECLARE @AL FLOAT
SELECT @AL = altura FROM empleados WHERE codigo = 102

DECLARE @IMC FLOAT
SET @IMC = @peso/ (@AL * @AL)

PRINT(@IMC)

IF @IMC < 18.5
	PRINT('bajo peso')
ELSE IF @IMC >= 18.5 AND @IMC < 25
	PRINT('normal')
ELSE IF @IMC >= 25 AND @IMC < 30
	PRINT('pre obesidad')
ELSE IF @IMC >= 30 AND @IMC < 35
	PRINT('obesidad 1')
ELSE IF @IMC >= 35 AND @IMC < 40
	PRINT('obesidad 2')
ELSE if @IMC > 40
	PRINT('obesidad 3')