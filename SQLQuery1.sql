-- crear base de datos
create database prueba

-- abrir bd
use prueba

-- crear tabla
create table personas
(
iden int primary key,
nom1 nvarchar(30) not null,
nom2 nvarchar(30),
apelli1 nvarchar(30) not null,
apelli2 nvarchar(30),
fecha_nacimiento date not null,
salario money
)
-- consultas
select * from personas

-- insertar
insert into personas
(iden, nom1, nom2, apelli1, apelli2, fecha_nacimiento, salario)
values
(1037646018, 'Luis', 'David', 'Moreno', 'Lopera', '29/10/1995', 10000),
(132131, 'Santiago', null, 'Moreno', 'Lopera', '21/01/2005', 2000)

