/*
Proyecto base de datos 2018-1.
En este script se da de alta 10 registros dentro de las tablas creadas en SISTEMA_GASTRONOMOS.
Realizado por:
	-Hernández Bravo David Gustavo
	-Ramirez Nuñez Daniel
*/

use master
go

--Cambio a SISTEMA_GASTRONOMOS
use SISTEMA_GASTRONOMOS
go

--Inserciones en platillos
insert into platillos(idplatillo,nombreplatillo)
values('PLA001','Enchiladas')
insert into platillos(idplatillo,nombreplatillo)
values('PLA002','Pescado empanizado')
insert into platillos(idplatillo,nombreplatillo)
values('PLA003','Quesadillas')
insert into platillos(idplatillo,nombreplatillo)
values('PLA004','Tacos de suadero')
insert into platillos(idplatillo,nombreplatillo)
values('PLA005','Tacos al pastor')
insert into platillos(idplatillo,nombreplatillo)
values('PLA006','Pozole')
insert into platillos(idplatillo,nombreplatillo)
values('PLA007','Consome de pollo')
insert into platillos(idplatillo,nombreplatillo)
values('PLA008','Coctel de camarones')
insert into platillos(idplatillo,nombreplatillo)
values('PLA009','Chuletas de cerdo')
insert into platillos(idplatillo,nombreplatillo)
values('PLA010','Picadillo')
go

--Inserciones en socios
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC001','Pablo Barragan Lopez',95.3,'1996/06/23')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC002','Jaime Duran',78.1,'1998/03/15')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC003','David Alducin',83.0,'2000/07/29')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC004','Maria Eugenia Sanchez',60.0,'1989/10/12')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC005','Rodrigo Fernandez',95.3,'1985/01/07')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC006','Francisca Aguilar',57,'2003/08/24')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC007','Viridiana Arrieta',53.2,'1999/10/31')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC008','Guadalupe Ortiz',69,'2000/03/01')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC009','Domingo Rosales',94.0,'1993/05/11')
insert into socios(idsocio,nombresocio,peso,ingreso)
values('SOC010','Maria Bravo Aguilar',51.4,'2005/04/29')
go

--Inserciones en gustan
insert into gustan(idplatillo,idsocio)
values('PLA009','SOC004')
insert into gustan(idplatillo,idsocio)
values('PLA003','SOC007')
insert into gustan(idplatillo,idsocio)
values('PLA005','SOC005')
insert into gustan(idplatillo,idsocio)
values('PLA002','SOC005')
insert into gustan(idplatillo,idsocio)
values('PLA001','SOC008')
insert into gustan(idplatillo,idsocio)
values('PLA002','SOC003')
insert into gustan(idplatillo,idsocio)
values('PLA010','SOC009')
insert into gustan(idplatillo,idsocio)
values('PLA004','SOC006')
insert into gustan(idplatillo,idsocio)
values('PLA009','SOC010')
insert into gustan(idplatillo,idsocio)
values('PLA007','SOC002')
insert into gustan(idplatillo,idsocio)
values('PLA008','SOC001')
go

--Inserciones en horario
insert into horario(idhorario,nomhorario)
values(1,'Desayuno')
insert into horario(idhorario,nomhorario)
values(2,'Comida')
insert into horario(idhorario,nomhorario)
values(3,'Cena')
go

--Inserciones en sirven
insert into sirven(idplatillo,idhorario)
values('PLA001',2)
insert into sirven(idplatillo,idhorario)
values('PLA001',1)
insert into sirven(idplatillo,idhorario)
values('PLA008',2)
insert into sirven(idplatillo,idhorario)
values('PLA008',1)
insert into sirven(idplatillo,idhorario)
values('PLA002',2)
insert into sirven(idplatillo,idhorario)
values('PLA003',2)
insert into sirven(idplatillo,idhorario)
values('PLA004',2)
insert into sirven(idplatillo,idhorario)
values('PLA005',2)
insert into sirven(idplatillo,idhorario)
values('PLA006',2)
insert into sirven(idplatillo,idhorario)
values('PLA007',2)
insert into sirven(idplatillo,idhorario)
values('PLA009',2)
insert into sirven(idplatillo,idhorario)
values('PLA010',2)
go

--inserciones en ingredientes
insert into ingredientes(iding,nombreing)
values('ING001','Tortillas')
insert into ingredientes(iding,nombreing)
values('ING002','Camarones')
insert into ingredientes(iding,nombreing)
values('ING003','Catsup')
insert into ingredientes(iding,nombreing)
values('ING004','Cebolla')
insert into ingredientes(iding,nombreing)
values('ING005','Limones')
insert into ingredientes(iding,nombreing)
values('ING006','Chiles verdes')
insert into ingredientes(iding,nombreing)
values('ING007','Chiles rojos')
insert into ingredientes(iding,nombreing)
values('ING008','Queso Oaxaca')
insert into ingredientes(iding,nombreing)
values('ING009','Maiz')
insert into ingredientes(iding,nombreing)
values('ING010','Rabanos')
go

--inserciones en hechos
insert into hechos(idplatillo,iding)
values('PLA001','ING001')
insert into hechos(idplatillo,iding)
values('PLA001','ING006')
insert into hechos(idplatillo,iding)
values('PLA001','ING007')
insert into hechos(idplatillo,iding)
values('PLA003','ING001')
insert into hechos(idplatillo,iding)
values('PLA003','ING008')
insert into hechos(idplatillo,iding)
values('PLA008','ING003')
insert into hechos(idplatillo,iding)
values('PLA008','ING002')
insert into hechos(idplatillo,iding)
values('PLA004','ING001')
insert into hechos(idplatillo,iding)
values('PLA004','ING004')
insert into hechos(idplatillo,iding)
values('PLA004','ING005')
go

--Inserciones en temporada
insert into temporada(idtemp,nombretemp)
values(1,'Primavera')
insert into temporada(idtemp,nombretemp)
values(2,'Verano')
insert into temporada(idtemp,nombretemp)
values(3,'Otoño')
insert into temporada(idtemp,nombretemp)
values(4,'Invierno')
go

--Inserciones en son
insert into son(idtemp,iding)
values(1,'ING001')
insert into son(idtemp,iding)
values(1,'ING002')
insert into son(idtemp,iding)
values(1,'ING003')
insert into son(idtemp,iding)
values(2,'ING004')
insert into son(idtemp,iding)
values(2,'ING005')
insert into son(idtemp,iding)
values(2,'ING006')
insert into son(idtemp,iding)
values(3,'ING007')
insert into son(idtemp,iding)
values(3,'ING008')
insert into son(idtemp,iding)
values(4,'ING009')
insert into son(idtemp,iding)
values(4,'ING010')
go
