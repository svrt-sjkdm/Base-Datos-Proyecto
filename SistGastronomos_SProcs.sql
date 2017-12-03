/*
Proyecto base de datos 2018-1.
En este script se crean 3 procedimientos almacenados en la tabla socios para: insertar, borrar y actualizar.
Realizado por:
	-Hernández Bravo David Gustavo
	-Ramirez Nuñez Daniel
*/

use master
go

use SISTEMA_GASTRONOMOS
go

---------------------------------------------- Procedimientos de insertar datos
-- Procedimiento para insertar en tabla de socios
if object_id('sp_inserta') is not null
begin
	drop procedure sp_inserta_socios
end

create proc sp_inserta
@id char(6),
@nombre varchar(30),
@peso float,
@ingreso date
as
begin
    insert into socios (idsocio, nombresocio, peso, ingreso)
    values (@id, @nombre, @peso, @ingreso)
end

-- Procedimiento para actualizar en tabla socios
if object_id('sp_actualiza') is not null
begin
	drop procedure sp_actualiza
end
go

create proc sp_actualiza
@id char(6),
@nombre varchar(30),
@peso float,
@ingreso date
as
begin
	update socios
	set idsocio = @id, nombresocio = @nombre, peso = @peso, ingreso = @ingreso where idsocio = @id
end

-- Procedimiento para borrar en tabla socios
if object_id('sp_borra') is not null
begin
	drop procedure sp_borra
end
go

create proc sp_borra
@id char(6)
as
begin
	delete from socios where idsocio = @id
end
