/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  TRANSACCIONES
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 12 DE 2015*/
  
--BASE DE DATOS RIFA
--TRANSACCIONES

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

/*=============== Tarea 5: Transacciones en la BD Rifa ==============*/
/**En la BD Rifa, crear una transacción que registre la compra de dos boletos por el estudiante Julio Benitez.*/
/* 1. Comprobar si el estudiante Julio Benitez está ya registrado, caso contrario insertar en la Tabla Correspondiente.*/
/* 2. Seleccionar dos números de boleto que no estén todavia vendidos y agregarles a ESTUDIANTEBOLETO.*/
/* 3. Utilizar el bloque TRY para controlar que no existan errores.*/
/* 4. Comprobar que funciona la transacción con valores que generan error.*/

--EJECUTA SIN ERRORES
BEGIN TRY
BEGIN TRANSACTION
	if not exists(select * from Estudiantes e where e.nombreEstudiante='Julio' 
	and e.apellidoEstudiante='Benitez')
	insert into Estudiantes values ('1723561459','Julio','Benitez','099678202')
	insert into EstudianteBoleto values(3,'1723561459')
	insert into EstudianteBoleto values(30,'1723561459')
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	RAISERROR('Error en creacion de Registro EstudianteBoleto, revisar',16,1)
	RETURN
END CATCH

--VERIFICACION
select e.ciEstudiante,e.apellidoEstudiante, e.nombreEstudiante, eb.nroBoleto 
from Estudiantes e inner join EstudianteBoleto eb on e.ciEstudiante=eb.ciEstudiante
where e.nombreEstudiante='Julio' and e.apellidoEstudiante='Benitez'

--EJECUTA CON ERRORES
BEGIN TRY
BEGIN TRANSACTION
	if not exists(select * from Estudiantes e where e.nombreEstudiante='Julio' 
	and e.apellidoEstudiante='Benitez')
	insert into Estudiantes values ('1723561459','Julio','Benitez','099678202')
	insert into EstudianteBoleto values(3,'1725644152')
	insert into EstudianteBoleto values(30,'1725644152')
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	RAISERROR('Error en creacion de Registro EstudianteBoleto, revisar',16,1)
	RETURN
END CATCH



