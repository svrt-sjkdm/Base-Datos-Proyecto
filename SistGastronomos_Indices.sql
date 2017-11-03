-- Creacion de indices para las llaves primarias de las tablas

-- Indice en tabla socios
create unique clustered index socioIndex
	on socios(idsocio)
go

-- Indice en tabla gustan
create unique clustered index gustanIndex
	on gustan(idsocio, idplatillo)
go

-- Indice en tabla platillos
create unique clustered index platillosIndex
	on platillos(idplatillo)
go

-- Indice en tabla horario
create unique clustered index horarioIndex
	on horario(idhorario)
go

-- Indice en tabla ingredientes
create unique clustered index ingIndex
	on ingredientes(iding)
go

-- Indice en tabla temporada
create unique clustered index tempIndex
	on temporada(idtemp)
go

-- Indice en tabla son
create unique clustered index sonIndex
	on son(idtemp, iding)
go

-- Indice en tabla hechos
create unique clustered index hechosIndex
	on hechos(idplatillo, iding)
go

-- Indice en tabla sirven
create unique clustered index sirvenIndex
	on sirven(idplatillo, idhorario)
go