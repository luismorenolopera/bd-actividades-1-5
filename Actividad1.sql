-- usar bd

use Empresaxy

-- crear bd
create database Empresaxy

-- crear tablas
create table tbl_producto(
	codigoProducto int identity(1,1) primary key,
	nombre_producto nvarchar(30) not null,
	valor money not null
)

create table tbl_cliente(
	cedula nvarchar(20) primary key not null,
	nombre nvarchar(30) not null,
	apellido nvarchar(30) not null,
	telefono nvarchar(15),
	ingresos money
)

create table tbl_factura(
	idFactura int identity(1, 1) primary key,
	codigoProducto int foreign key references tbl_producto(codigoProducto),
	cedula nvarchar(20) foreign key references tbl_cliente(cedula),
	cantidad int
)

-- borrar tablas
drop table tbl_producto
drop table tbl_cliente
drop table tbl_factura

-- consultas
select * from tbl_producto
select * from tbl_cliente
select * from tbl_factura

-- borrar
delete from tbl_producto
where nombre_producto='Banano';

-- ingresar productos
insert into tbl_producto
(nombre_producto, valor)
values
('Queso', 2000),
('Leche', 2000),
('Arroz', 1700),
('Salchicha', 2500),
('Galletas', 1500),
('Sopa', 3000),
('Frijoles', 3000),
('Cerdo', 5000),
('Res', 4000),
('Pescado', 8000),
('Huevo', 300),
('Yogurt', 1000),
('Cafe', 2000),
('Manzana', 1000),
('Pera', 1000),
('Uvas', 3000),
('Piña', 2000),
('Limon', 500),
('Banano', 100),
('Zanahoria', 300),
('Vino', 10000)

-- ingresar clientes
insert into tbl_cliente
(cedula, nombre, apellido, telefono, ingresos)
values
('23124121', 'Luis', 'Moreno', '213-12-11', 1430000),
('23124122', 'Daniel', 'Osorio', '213-12-12', 2010000),
('23124123', 'Alexis', 'Incapie', '213-12-13', 1430000),
('23124124', 'Elsa', 'Mesa', '213-12-14', 200000),
('23124125', 'Elvira', 'Naranjo', '213-12-15', 200000),
('23124126', 'Emilia', 'Incapie', '213-12-16', 1430000),
('23124127', 'Emilio', 'Mesa', '213-12-17', 2210000),
('23124128', 'Ema', 'Naranjo', '213-12-18', 2410000),
('23124129', 'Emanuel', 'Incapie', '213-12-19', 2300000),
('231241210', 'Encarnación', 'Mesa', '213-12-20', 1200000),
('231241211', 'Enrique', 'Naranjo', '213-12-21', 500000),
('231241212', 'Eric', 'Palacios', '213-12-22', 500000),
('231241213', 'Erica', 'Mosquera', '213-12-23', 400000),
('231241214', 'Ernesto', 'Palacios', '213-12-24', 800000),
('231241215', 'Esmeralda', 'Mosquera', '213-12-25', 1000000),
('231241216', 'Esperanza', 'Palacios', '213-12-26', 2200000),
('231241217', 'Eufemio', 'Mosquera', '213-12-27', 5000000),
('231241218', 'Eulalia', 'Perez', '213-12-28', 9800000),
('231241219', 'Eva', 'Rivera', '213-12-29', 1000000),
('231241220', 'Ezequiel', 'Tabares', '213-12-30', 1000000)


-- ingresar facturas
insert into tbl_factura
(codigoProducto, cedula, cantidad)
values
(2, '23124123', 2),
(3, '23124124', 3),
(4, '23124125', 4),
(5, '23124125', 5),
(6, '23124126', 6),
(7, '23124127', 7),
(8, '23124128', 8),
(9, '23124129', 9),
(10, '231241215', 10),
(11, '231241220', 11)