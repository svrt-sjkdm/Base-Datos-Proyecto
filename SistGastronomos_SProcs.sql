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
@oldID char(6)
@newID char(6),
@nombre varchar(30),
@peso float,
@ingreso date
as
begin
	update socios
	set idsocio = @newID, nombresocio = @nombre, peso = @peso, ingreso = @ingreso where idsocio = @oldID
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
	if exists (select idsocio from socios where idsocio = @id)
		delete from socios where idsocio = @id
	else
		print "El id no existe en la tabla socios"
end
