/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  CURSORES
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 12 DE 2015*/
  
--BASE DE DATOS RIFA
--CURSORES

--Creasion y uso de la BD Rifa
create database Rifa
go
use Rifa
go

--Creacion de las tablas
CREATE TABLE Estudiantes(
	ciEstudiante char(10) PRIMARY KEY,
	nombreEstudiante varchar(20),
	apellidoEstudiante varchar(20),
	telefEstudiante char(10)
)

CREATE TABLE Boleto(
	nroBoleto int PRIMARY KEY
)

CREATE TABLE EstudianteBoleto(
	nroBoleto int PRIMARY KEY references Boleto(nroBoleto),
	ciEstudiante char(10) references Estudiantes(ciEstudiante)
)

CREATE TABLE Premios(
	nroPremio int PRIMARY KEY,
	descripcionPremio varchar(100),
	nroBoleto int references EstudianteBoleto(nroBoleto)
)
	/*===================== Insercion de datos ==================*/
insert into Estudiantes values ('1700067893','Edgar','Patiño','0987654321')
insert into Estudiantes values ('1745678930','Marta','Carrera','0956776549')
insert into Estudiantes values ('1000067891','Jose','Armas',null)
insert into Estudiantes values ('0400067893','Ana','Puente','0956754321')
insert into Estudiantes values ('1704567893','Miguel','Cevallos','0879054321')
insert into Estudiantes values ('0950067867','Antonio','Chavez','0677654390')
insert into Estudiantes values ('0700067856','Margoth','Rios','0887654334')

select * from Estudiantes

declare @i int
select  @i=1
while   @i<=1000
begin
		insert into Boleto values (@i)
		set @i+=1
end

select * from Boleto

insert into EstudianteBoleto values(34,'1700067893')
insert into EstudianteBoleto values(790,'1700067893')
insert into EstudianteBoleto values(687,'1700067893')
insert into EstudianteBoleto values(345,'1745678930')
insert into EstudianteBoleto values(1,'1000067891')
insert into EstudianteBoleto values(760,'1000067891')
insert into EstudianteBoleto values(5,'0400067893')
insert into EstudianteBoleto values(10,'0400067893')
insert into EstudianteBoleto values(80,'0400067893')
insert into EstudianteBoleto values(67,'1704567893')
insert into EstudianteBoleto values(999,'1704567893')
insert into EstudianteBoleto values(55,'1704567893')
insert into EstudianteBoleto values(115,'1704567893')
insert into EstudianteBoleto values(678,'0950067867')
insert into EstudianteBoleto values(998,'0950067867')
insert into EstudianteBoleto values(775,'0400067893')
insert into EstudianteBoleto values(891,'0950067867')
insert into EstudianteBoleto values(156,'0700067856')
insert into EstudianteBoleto values(225,'0700067856')
insert into EstudianteBoleto values(884,'0400067893')

select * from EstudianteBoleto

insert into Premios values (1,'Pasaje a Galápagos', 345)
insert into Premios values (2,'Computador',1)
insert into Premios values (3,'Tablet', 891)
insert into Premios values (4,'Celular', 67)
insert into Premios values (5,'Libro', 760)

select *from Premios

--PA Selecciones
Create proc sp_Selecciones
as
	select *from Premios
	select * from EstudianteBoleto
	select * from Boleto
	select * from Estudiantes
	
exec sp_Selecciones

/*=============== Tarea 4: Cursores en la BD Rifa ==============*/
/*1.- En la BD Rifa, crear un cursor para desplegar el valor total pagado por cada estudiante 
      por sus boletos suponiendo que cada boleto cuesta 2,50 dólares.*/      

DECLARE @_nombreEstudiante varchar(20),
		@_apellidoEstudiante varchar(20),
		@_nroBoletos int,
		@_textTotal char(100)
DECLARE ValInfo CURSOR FOR SELECT e.nombreEstudiante,e.apellidoEstudiante,count(nroBoleto) 
		FROM EstudianteBoleto eb INNER JOIN Estudiantes e
        ON e.ciEstudiante=eb.ciEstudiante
        GROUP BY e.nombreEstudiante,e.apellidoEstudiante
        ORDER BY apellidoEstudiante ASC
OPEN	ValInfo
FETCH   NEXT FROM ValInfo INTO @_nombreEstudiante,@_apellidoEstudiante,@_nroBoletos
WHILE   @@fetch_status=0
BEGIN
SELECT  @_textTotal='Datos: '+@_apellidoEstudiante+space(1)+@_nombreEstudiante+char(13)+
				    'Nº Boletos: '+convert(char(3),@_nroBoletos)+space(1)+
				    'Total: $'+convert(char(5),@_nroBoletos*2.50)+char(13)+
				    '------------------------------'
PRINT   @_textTotal
FETCH   NEXT FROM ValInfo INTO @_nombreEstudiante,@_apellidoEstudiante,@_nroBoletos
END
CLOSE   ValInfo
DEALLOCATE ValInfo
  
/*2.- Crear un cursor sobre la BD Rifa incluido en un procedimiento almacenado para desplegar
	  el nombre y apellido del ganador junto a la descripción de cada premio ganado.*/

CREATE  PROC sp_Ganador
AS
DECLARE @_nombreEstudiante varchar(20),
		@_apellidoEstudiante varchar(20),
		@_descripcionPremio varchar(100),
		@_textPremio char(100)
DECLARE Ganador CURSOR FOR SELECT  e.apellidoEstudiante, e.nombreEstudiante, P.descripcionPremio 
		FROM EstudianteBoleto eb INNER JOIN Premios P 
		ON eb.nroBoleto=P.nroBoleto INNER JOIN Estudiantes e
		ON e.ciEstudiante=eb.ciEstudiante
		ORDER BY apellidoEstudiante ASC
OPEN	Ganador
FETCH   NEXT FROM Ganador INTO @_nombreEstudiante,@_apellidoEstudiante,@_descripcionPremio
WHILE   @@fetch_status=0
BEGIN
SELECT  @_textPremio='Datos:  '+@_apellidoEstudiante+space(1)+@_nombreEstudiante+char(13)+
					 'Premio: '+@_descripcionPremio+char(13)+'--------------------------'
PRINT   @_textPremio
FETCH   NEXT FROM Ganador INTO @_nombreEstudiante,@_apellidoEstudiante,@_descripcionPremio
END
CLOSE   Ganador
DEALLOCATE Ganador

--Prueba PA-CURSOR
EXEC sp_Ganador

--Muestra todas las tablas
EXEC sp_Selecciones
