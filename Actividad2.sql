CREATE DATABASE empresa

use empresa

set dateformat 'ymd'

-- Crear tablas

CREATE TABLE tblCARgo(
	id_Car int PRIMARY KEY NOT NULL,
	strNombre_Car NVARCHAR(30),
	fltSalario_Car MONEY
)

CREATE TABLE tblDEPartamentos(
	id_DEP NVARCHAR(10) PRIMARY KEY NOT NULL,
	strNombre_Dep NVARCHAR(20)
)

CREATE TABLE tblCIUdades(
	id_Ciu NVARCHAR(15) PRIMARY KEY NOT NULL,
	strCodDpto_Ciu NVARCHAR(10) FOREIGN KEY REFERENCES tblDEPartamentos(id_DEP) NOT NULL,
	strNombre_Ciu NVARCHAR(15)
)

CREATE TABLE tblEMPleados(
	strNroDoc_Emp NVARCHAR(12) PRIMARY KEY NOT NULL,
	strNombre_Emp NVARCHAR(30) NOT NULL,
	strApellido_Emp NVARCHAR(30) NOT NULL,
	dtmFechaNac_Emp NVARCHAR(20) NOT NULL,
	intCargo_Emp INT FOREIGN KEY REFERENCES tblCARgo(id_Car) NOT NULL,
	intCiudad_Emp NVARCHAR(15) FOREIGN KEY REFERENCES tblCIUdades(id_Ciu) NOT NULL,
	strDireccion_Emp NVARCHAR(25),
	strTelefono_Emp NVARCHAR(10)
)

-- Borrar Tablas

DROP TABLE tblEMPleados
DROP TABLE tblCARgo
DROP TABLE tblCIUdades
DROP TABLE tblDEPartamentos

-- Insertar valores

INSERT INTO tblCARgo
(id_Car, strNombre_Car, fltSalario_Car)
VALUES
(7, 'operario', 790),
(9, 'Ayudante', 780),
(11, 'Secretaria Gral', 1100),
(20, 'Gefe Contabilidad', 3900),
(50, 'Gerente General', 7200)


INSERT INTO tblDEPartamentos
(id_DEP, strNombre_Dep)
VALUES
('Ant', 'Antioquia'),
('Val', 'Valle'),
('Bol', 'Bolivar'),
('Qui', 'Quindio'),
('Nsa', 'Norte Santander'),
('San', 'Santander')


INSERT INTO tblCIUdades
(Id_Ciu, strCodDpto_Ciu, strNombre_Ciu)
VALUES
('Tulu', 'Val', 'Tulua'),
('Cali', 'Val', 'Cali'),
('Mede', 'Ant', 'Medellin'),
('Gira', 'Ant', 'Girardota'),
('Cucu', 'Nsa', 'Cucuta'),
('Buca', 'San', 'Bucaramanga')


INSERT INTO tblEMPleados
(strNroDoc_Emp, strNombre_Emp, strApellido_Emp, dtmFechaNac_Emp, intCargo_Emp, intCiudad_Emp, strDireccion_Emp, strTelefono_Emp)
VALUES
('702040','Juan','Molina','1989/01/01',9,'Tulu','Calle15#10-10','3503030'),
('704040','Andres','Perez','1987/03/25',20,'Gira','cra2#120-125','2802030'),
('706020','Marina','Carrillo','1980/02/28',7,'Cali','cra2SUR#1D-45','3416090'),
('7068030','Rogelio','Cabrales','1970/05/15',50,'Tulu','AutopistaSurkmt-25', NULL),
('705030','Diana','Moncada','1985/01/15',20,'Mede','Diagonal25#14-29','2501030'),
('703050','Carlos','Carrillo','1988/12/31',11,'Mede','Circular15#102-32', NULL)

-- CONSULTAS
-- 1 OK
SELECT * FROM tblDEPartamentos
SELECT * FROM tblCIUdades
SELECT * FROM tblEMPleados
SELECT * FROM tblCARgo

-- 2 OK
SELECT * FROM tblEMPleados ORDER BY intCargo_Emp

-- 3 OK
SELECT * FROM tblEMPleados
WHERE (intCargo_Emp = 11) OR (intCargo_Emp = 50)

-- 4 OK
SELECT * FROM tblEMPleados
WHERE (strApellido_Emp = 'Carrillo') and (intCiudad_Emp = 'Cali')

-- 5 OK
SELECT * FROM tblEMPleados
WHERE (intCargo_Emp = 20) AND (intCiudad_Emp = 'Mede')

-- 6 OK
SELECT strNombre_Emp, strApellido_Emp, dtmFechaNac_Emp, strNroDoc_Emp FROM tblEMPleados

-- 7 OK
SELECT * FROM  tblEMPleados
WHERE strApellido_Emp LIKE 'M%'

-- 8 OK

SELECT * FROM tblEMPleados
WHERE intCiudad_Emp = 'Mede' OR intCiudad_Emp = 'Cali' OR intCiudad_Emp = 'Tulu'

-- 9 OK

SELECT * FROM tblEMPleados
WHERE intCargo_Emp = 20 OR intCargo_Emp = 50

-- 10 OK

SELECT * FROM tblCARgo
WHERE fltSalario_Car > 2000

-- 11 OK

SELECT * FROM tblDEPartamentos
WHERE strNombre_Dep LIKE '%[Ut]%'

-- 12 OK

SELECT * FROM tblDEPartamentos
WHERE strNombre_Dep LIKE '%[a]%' AND  strNombre_Dep LIKE '%[c]%'

-- 13 OK

SELECT * FROM tblCARgo
WHERE fltSalario_Car BETWEEN 2000 AND 5000

-- 14 OK

SELECT * FROM tblEMPleados
WHERE dtmFechaNac_Emp BETWEEN '19830101' AND '19881231'


-- 15 OK

INSERT INTO tblCARgo
(id_Car, strNombre_Car, fltSalario_Car)
VALUES
(60, 'Mensajero', 850),
(40, 'Jefe de sistemas', 3850)


-- 16 OK

SELECT TOP 1 * FROM tblEMPleados
ORDER BY dtmFechaNac_Emp DESC

-- 17 OK

SELECT TOP 2 * FROM tblDEPartamentos
ORDER BY strNombre_Dep ASC

-- 18

INSERT INTO tblCIUdades
(Id_Ciu, strCodDpto_Ciu, strNombre_Ciu)
VALUES
('Envi', 'Ant', 'Envigado'),
('Tur', 'Bol', 'Turbaco'),
('Arm', 'Qui', 'Armenia')

-- 19 OK	

INSERT INTO tblEMPleados
(strNroDoc_Emp, strNombre_Emp, strApellido_Emp, dtmFechaNac_Emp, intCargo_Emp, intCiudad_Emp, strDireccion_Emp, strTelefono_Emp)
VALUES
('98005005', 'Juan Camilo', 'Torres Marin', '1978/03/25', 60, 'Envi', 'Calle nro. 15sur-25', '277 15 60'),
('32800900', 'Maria Antonia', 'Acevedo Gardeazabal', '1972/04/15', 40, 'Tur', 'Av 2 Nro 68 Norte 4', '520 20 20'),
('150300600', 'Juan', 'Martelo', '1988/02/28', 20, 'Tulu', 'Transv 1# 85-20', '123 10 20')


-- 20 OK
-- Juan Camilo Torres Marin
UPDATE tblEMPleados
SET intCargo_Emp = 40, strDireccion_Emp = 'calle 84 d nro 123- 2', strTelefono_Emp = '444 41 41'
WHERE strNroDoc_Emp = '98005005'

-- Maria Acevedo
UPDATE tblEMPleados
SET intCargo_Emp = 20, strDireccion_Emp = 'calle 21 e nro 145 - 32', strTelefono_Emp = '524 00 00'
WHERE strNroDoc_Emp = '32800900'


-- Juan Martelo
UPDATE tblEMPleados
SET intCargo_Emp = 60, strDireccion_Emp = 'calle 89 a nro 101 - 06', strTelefono_Emp = ' 210 03 02'
WHERE strNroDoc_Emp = '150300600' 

-- 21 OK

UPDATE tblCARgo
SET strNombre_Car = 'Mensajero categoria 1'
WHERE id_Car = 60

-- 22 OK

UPDATE tblEMPleados
SET strTelefono_Emp = '3598978'
WHERE strNroDoc_Emp = '704040'

-- 23 OK

UPDATE tblCARgo
SET fltSalario_Car = 2500
WHERE id_Car BETWEEN 20 AND 30

-- 24  OK

ALTER TABLE tblCIUdades ADD intCod_Postal_CIU INT

UPDATE tblCIUdades
SET intCod_Postal_CIU = 0

ALTER TABLE tblCIUdades CHANGE intCod_Postal_CIU intCod_Postal_CIU INT NOT NULL

-- 25 

UPDATE tblCIUdades
SET intCod_Postal_CIU = 760001
WHERE id_Ciu = 'Cali'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 540001
WHERE id_Ciu = 'Cucu'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 055420
WHERE id_Ciu = 'Envi'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 051030
WHERE id_Ciu = 'Gira'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 050001
WHERE id_Ciu = 'Mede'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 055860
WHERE id_Ciu = 'Arm'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 680001
WHERE id_Ciu = 'Buca'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 763021
WHERE id_Ciu = 'Tulu'

UPDATE tblCIUdades
SET intCod_Postal_CIU = 131001
WHERE id_Ciu = 'Tur'

-- 26 OK

SELECT * FROM tblEMPleados
WHERE intCiudad_Emp IN 
(
	SELECT id_Ciu FROM tblCIUdades
	WHERE strCodDpto_Ciu IN
	(
		SELECT id_DEP FROM tblDEPartamentos
		WHERE strNombre_Dep = 'Antioquia'
	)
)


-- 27 OK

SELECT * FROM tblEMPleados
WHERE MONTH(dtmFechaNac_Emp) >= 1 AND MONTH(dtmFechaNac_Emp) <= 6

-- 28 OK

SELECT * FROM tblEMPleados
WHERE

-- 29 OK

SELECT DISTINCT strNombre_Emp FROM tblEMPleados

-- 30 OK

SELECT * FROM tblCIUdades
WHERE strNombre_Ciu LIKE '%G%'

-- 31 OK

DELETE FROM tblCIUdades
WHERE Id_Ciu = 'Cucu'

DELETE FROM tblCIUdades
WHERE Id_Ciu = 'Buca'


