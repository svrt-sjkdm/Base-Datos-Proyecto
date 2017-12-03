/*
Proyecto base de datos 2018-1.
En este script se crean los triggers de insertar, borrar y actualizar que permiten
tener una mayor integridad en los datos.
Realizado por:
	-Hernández Bravo David Gustavo
	-Ramirez Nuñez Daniel
*/
use master
go

use SISTEMA_GASTRONOMOS
go

-- TRIGGERS DE BORRADO

-- Al borrar en tabla socios, borrar en tabla gustan
create trigger borraSocio
	on socios
	for delete as
	begin
		delete socios from socios, deleted where socios.idsocio = deleted.idsocio
		delete gustan from gustan, deleted where gustan.idsocio = deleted.idsocio
	end
go

-- Al borrar en la tabla platillo, borrar en tabla sirven ,tabla hechos y en tabla gustan
create trigger borraPlatillo
	on platillos
	for delete as
	begin
		delete platillos from platillos, deleted where platillos.idplatillo = deleted.idplatillo
		delete hechos from hechos, deleted where hechos.idplatillo = deleted.idplatillo
		delete gustan from gustan, deleted where gustan.idplatillo = deleted.idplatillo
	end
go

-- Al borrar en la tabla ingrediente, borrar en tabla son y en tabla hechos
create trigger borraIngrediente
	on ingredientes
	for delete as
	begin
		delete ingredientes from ingredientes, deleted where ingredientes.iding = deleted.iding
		delete son from son, deleted where son.iding = deleted.iding
	end
go

-- Al borrar en la tabla horario, borrar en sirven
create trigger borraHorario
	on horario
	for delete as
	begin
		delete horario from horario, deleted where horario.idhorario = deleted.idhorario
		delete sirven from sirven, deleted where sirven.idhorario = deleted.idhorario
	end
go

-- Al borrar en la tabla temporada, borrar en son
create trigger borraTemporada
	on temporada
	for delete as
	begin
		delete temporada from temporada, deleted where temporada.idtemp = deleted.idtemp
		delete son from son, deleted where son.idtemp = deleted.idtemp
	end
go

-- TRIGGERS DE INSERTAR

-- Al insertar en gustan, verificar que idsocio existe en socios e idplatillo exista en platillos
create trigger insertaGustan
	on gustan
	for insert as
	if exists ( select socios.idsocio from socios, inserted where socios.idsocio = inserted.idsocio)
		begin
			if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla platillos"
				end
		end
	else if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
		begin
			if exists ( select socios.idsocio from socios, inserted where socios.idsocio = inserted.idsocio)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla socios"
				end
		end
	else
		begin
			rollback transaction
			print "Error: verifica que la PK existe en las tablas platillos y socios"
		end
go

-- Al insertar en sirven, verificar que idplatillo exista en platillos e idhorario existe en horario
create trigger insertaSirven
	on sirven
	for insert as
	if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
		begin
			if exists ( select horario.idhorario from horario, inserted where horario.idhorario = inserted.idhorario)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK existe en la tabla horarios"
				end
		end
	else if exists ( select horario.idhorario from horario, inserted where horario.idhorario = inserted.idhorario)
		begin
			if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK existe en la tabla platillos"
				end
		end
	else
		begin
			rollback transaction
			print "Error: veritfica que la PK existe en las tablas horario y platillos"
		end
go

-- Al insertar en hechos, verificar que idplatillo exista en platillos e iding existe en ingredientes
create trigger insertaHechos
	on hechos
	for insert as
	if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
		begin
			if exists ( select ingredientes.iding from ingredientes, inserted where ingredientes.iding = inserted.iding)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla ingredientes"
				end
		end
	else if exists ( select ingredientes.iding from ingredientes, inserted where ingredientes.iding = inserted.iding)
		begin
			if exists ( select platillos.idplatillo from platillos, inserted where platillos.idplatillo = inserted.idplatillo)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla platillos"
				end
		end
	else
		begin
			rollback transaction
			print "Error: verifica que la PK existe en las tablas ingredientes y platillos"
		end
go

-- Al insertar en son, verificar que iding exista en ingredientes e idtemp existe en temporada
create trigger insertaSon
	on son
	for insert as
	if exists ( select ingredientes.iding from ingredientes, inserted where ingredientes.iding = inserted.iding)
		begin
			if exists ( select temporada.idtemp from temporada, inserted where temporada.idtemp = inserted.idtemp)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla temporada"
				end
		end
	else if exists ( select temporada.idtemp from temporada, inserted where temporada.idtemp = inserted.idtemp)
		begin
			if exists ( select ingredientes.iding from ingredientes, inserted where ingredientes.iding = inserted.iding)
				print "Registro agregado con exito"
			else
				begin
					rollback transaction
					print "Error: verifica que la PK exista en la tabla ingredientes"
				end
		end
	else
		begin
			rollback transaction
			print "Error: verifica que la PK existe en las tablas ingredientes y temporada"
		end
go

-- TRIGGERS DE ACTUALIZACION

-- Al actualizar un socio (id), actualizar en tabla gustan
create trigger actualizaSocio
	on socios
	for update as
	if update (idsocio)
	begin
		update socios set idsocio = inserted.idsocio
			from socios, deleted, inserted where deleted.idsocio = socios.idsocio
		update gustan set idsocio = inserted.idsocio
			from gustan, inserted, deleted where deleted.idsocio = gustan.idsocio
	end
go

-- Al actualizar un platillo (id), actualizar en tabla gustan, sirven, hechos
create trigger actualizaPlatillo
	on platillos
	for update as
	if update (idplatillo)
	begin
		update platillos set idplatillo = inserted.idplatillo
			from platillos, deleted, inserted where deleted.idplatillo = platillos.idplatillo
		update gustan set  idplatillo = inserted.idplatillo
			from gustan, deleted, inserted where deleted.idplatillo = gustan.idplatillo
		update sirven set idplatillo = inserted.idplatillo
			from sirven, deleted, inserted where deleted.idplatillo = sirven.idplatillo
		update hechos set idplatillo = inserted.idplatillo
			from hechos, deleted, inserted where deleted.idplatillo = hechos.idplatillo
	end
go

-- Al actualizar un horario (id), actualizar en tabla sirven
create trigger actualizaHorario
	on horario
	for update as
	if update (idhorario)
	begin
		update horario set idhorario = inserted.idhorario
			from horario, deleted, inserted where deleted.idhorario = horario.idhorario
		update sirven set idhorario = inserted.idhorario
			from sirven, deleted, inserted where deleted.idhorario = sirven.idhorario
	end
go

-- Al actualizar una temporada (id), actualizar en tabla son
create trigger actualizaTemporada
	on temporada
	for update as
	if update (idtemp)
	begin
		update temporada set idtemp = inserted.idtemp
			from temporada, deleted, inserted where deleted.idtemp = temporada.idtemp
		update son set idtemp = inserted.idtemp
			from son, deleted, inserted where deleted.idtemp = son.idtemp
	end
go

-- Al actualizar un ingrediente (id), actualizar en tabla son y hechos
create trigger actualizaIngrediente
	on ingredientes
	for update as
	if update (iding)
	begin
		update ingredientes set iding = inserted.iding
			from ingredientes, deleted, inserted where deleted.iding = ingredientes.iding
		update hechos set iding = inserted.iding
			from hechos, deleted, inserted where deleted.iding = hechos.iding
	end
go


-- dump transaction SISTEMA_GASTRONOMOS with no_log
