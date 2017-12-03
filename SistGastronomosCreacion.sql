/*
Proyecto base de datos 2018-1.
En este apartado se crea la base de datos para el sistema gastronomo, asi como las tablas correspondientes.
Para la creación de la base de datos se requiere estar en la base de datos master.
Realizado por:
	-Hernández Bravo David Gustavo
	-Ramirez Nuñez Daniel
*/


use master
go

create database SISTEMA_GASTRONOMOS
go

use SISTEMA_GASTRONOMOS
go

--Se verifica que estemos en la base de datos creada.
select db_name()
go

--Se crean las tablas de nuestra base de datos
create table platillos(
idplatillo char(6),
nombreplatillo varchar(20),
constraint const_plat check (idplatillo like 'PLA[0-9][0-9][0-9]')
)
go

create table socios(
idsocio char(6),
nombresocio varchar(30) not null,
peso float,
ingreso date not null,
constraint const_socs check (idsocio like 'SOC[0-9][0-9][0-9]')
)
go

create table gustan(
idplatillo char(6),
idsocio char(6),
constraint const_gust check (idplatillo like 'PLA[0-9][0-9][0-9]' and idsocio like 'SOC[0-9][0-9][0-9]')
)
go

create table horario(
idhorario int,
nomhorario varchar(15),
constraint const_hor check (idhorario between 1 and 4)
)
go

create table sirven(
idplatillo char(6),
idhorario int,
constraint const_sirv check (idplatillo like 'PLA[0-9][0-9][0-9]' and (idhorario between 1 and 4))
)
go

create table ingredientes(
iding varchar(10),
nombreing varchar(30) not null,
constraint const_ing check (iding like 'ING[0-9][0-9][0-9]')
)
go

create  table hechos(
idplatillo char(6),
iding char(6),
constraint const_h check (idplatillo like 'PLA[0-9][0-9][0-9]' and iding like 'ING[0-9][0-9][0-9]')
)
go

create table temporada(
idtemp int,
nombretemp varchar(10) not null,
constraint const_temp check (idtemp between 1 and 4)
)
go

create table son(
idtemp int,
iding char(6),
constraint const_son check ( (idtemp between 1 and 4) and iding like 'ING[0-9][0-9][0-9]')
)
go
