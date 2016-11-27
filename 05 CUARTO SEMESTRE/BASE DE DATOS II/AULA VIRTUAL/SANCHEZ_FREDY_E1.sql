/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  EVALUACION N| 1
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 19 DE 2015*/
  
--BASE DE DATOS PRESTAMOBIBLIOTECA
create database PrestamoBiblioteca
go

use PrestamoBiblioteca
go

CREATE TABLE Autores (
	A_codigo char(3) PRIMARY KEY,
	A_nombre varchar(100),
	A_apellido varchar(50)
)

CREATE TABLE Usuarios (
	U_codigo char(3) PRIMARY KEY,
	U_ci char(10),
	U_nombre varchar(50),
	U_apellido varchar(50),
	U_telef char(9)
)

CREATE TABLE Libros (
	L_codigo char(3) PRIMARY KEY,
	L_titulo varchar(100),
	L_AñoPublicacion int

)

CREATE TABLE Prestamos (
	U_codigo char(3),
	L_codigo char(3),
	fecha_prestamo date,
	fecha_devolucion date,
	PRIMARY KEY(fecha_prestamo,L_codigo),
	FOREIGN KEY(U_codigo) REFERENCES Usuarios (U_codigo),
	FOREIGN KEY(L_codigo) REFERENCES Libros (L_codigo)
)

CREATE TABLE Escribe (
	A_codigo char(3),
	L_codigo char(3),
	PRIMARY KEY(A_codigo,L_codigo),
	FOREIGN KEY(A_codigo) REFERENCES Autores (A_codigo),
	FOREIGN KEY(L_codigo) REFERENCES Libros (L_codigo)
)
--Selecciones
CREATE PROC SP_SELECCIONES
AS
	SELECT *FROM dbo.Autores 
	SELECT *FROM dbo.Escribe
	SELECT *FROM dbo.Libros
	SELECT *FROM dbo.Prestamos
	SELECT *FROM dbo.Usuarios


insert into Libros values('L01','Fundamentos de BD','2006')
insert into Libros values('L02','Programacion en java','2005')
insert into Libros values('L03','PRgramacion con C#','2010')
insert into Libros values('L04','El arte de diseñar bases de datos','2011')


insert into Autores values('A01','John','Deitel')
insert into Autores values('A02','Luis','Joyanes')
insert into Autores values('A03','Peter','Koth')
insert into Autores values('A04','John','Silverchatz')

insert into Usuarios values('U01','1700987600','Carlos','Ayerve','099234556')
insert into Usuarios values('U02','1099067899','Ana','Puente','087567773')
insert into Usuarios values('U03','0400123455','Pedro','Andrade',null)


insert into Prestamos values('U01','L01','15-03-2011','16-03-2011')
insert into Prestamos values('U01','L02','15-03-2011','16-03-2011')
insert into Prestamos values('U02','L01','17-03-2011','19-03-2011')
insert into Prestamos values('U02','L03','20-03-2011','22-03-2011')
insert into Prestamos values('U03','L02','25-03-2011','26-03-2011')


insert into Escribe values('A01','L02')
insert into Escribe values('A02','L03')
insert into Escribe values('A03','L01')
insert into Escribe values('A04','L01')
insert into Escribe values('A01','L03')

EXEC SP_SELECCIONES
/*GRUPO 2 */
--==================================================================

/*En la BD PrestamoBiblioteca, realizar los siguientes ejercicios:
1.-Agregar a la tabla Usuarios una columna NRO_PRESTAMOS en donde se registre el número 
   de préstamos que ha realizado cada usuario. Luego, crear un trigger que cada vez que se 
   inserta una fila en la tabla PRESTAMOS,  se incremente el NRO_PRESTAMOS del usuario correspondiente.*/
--Añadir la columna descuento.
ALTER TABLE USUARIOS ADD NRO_PRESTAMOS INT null default 0
--Actualizaciones
UPDATE USUARIOS SET NRO_PRESTAMOS=0 WHERE U_CODIGO ='U03'
--Creacion del Trigger
CREATE TRIGGER TR_ACTPRESTAMOS
ON PRESTAMOS AFTER INSERT
AS
DECLARE @_UCODIGO CHAR(3),
		@_LCODIGO CHAR(3),
		@_FECHAPRESTAMO DATE,
		@_FECHADEVOLUCION DATE
SELECT  @_UCODIGO=INSERTED.U_CODIGO, @_LCODIGO=INSERTED.L_CODIGO,@_FECHAPRESTAMO=INSERTED.FECHA_PRESTAMO, @_FECHADEVOLUCION=INSERTED.FECHA_DEVOLUCION
FROM INSERTED
UPDATE USUARIOS SET NRO_PRESTAMOS=NRO_PRESTAMOS+1
WHERE  @_UCODIGO=U_CODIGO

--Prueba del TRIGGER
insert into Prestamos values('U01','L03','19-10-2014','20-10-2015')
insert into Prestamos values('U02','L03','10-10-2014','11-10-2015')

--Selecciones
SELECT *FROM dbo.Prestamos
SELECT *FROM dbo.Usuarios

/*2.-Crear una vista que despliegue el nombre y apellido de cada usuario, el título de cada libro que ha solicitado préstamo,
     la fecha de préstamo y la fecha de devolución. Luego crear un trigger que permita el ingreso de filas a través de la vista.*/
CREATE  VIEW V_INFORMACION
AS
SELECT  NOMBRE=U.U_NOMBRE ,APELLIDO=U.U_APELLIDO,TITULO_lIBRO=L_TITULO,P.FECHA_PRESTAMO, P.FECHA_DEVOLUCION 
FROM USUARIOS U INNER JOIN PRESTAMOS P ON U.U_CODIGO=P.U_CODIGO INNER JOIN LIBROS L ON P.L_CODIGO=L.L_CODIGO 

--Prueba de la VISTA
SELECT *FROM V_INFORMACION

--Creacion del trigger INSTEAD OF
CREATE  TRIGGER tr_insercionV_INFORMACION 
ON V_INFORMACION
INSTEAD OF INSERT
AS
BEGIN
SET NOCOUNT ON
--Si no existe el usuario, debe insertarse en la tabla USUARIOS
IF (NOT EXISTS (SELECT U.U_nombre,U.U_APELLIDO
    FROM USUARIOS U, inserted I
    WHERE U.U_NOMBRE = I.NOMBRE AND U.U_APELLIDO= I.APELLIDO))
	INSERT INTO USUARIOS
    SELECT 'U12',NULL,NOMBRE,APELLIDO,NULL,0
    FROM INSERTED
ELSE
   PRINT 'USUARIO REGISTRADO'
IF (NOT EXISTS (SELECT  P.U_codigo
    FROM PRESTAMOS P, INSERTED I
    WHERE  P.fecha_devolucion=i.FECHA_DEVOLUCION and p.fecha_prestamo=i.FECHA_PRESTAMO))
	INSERT INTO Prestamos
    SELECT 'U12','L01',FECHA_PRESTAMO, FECHA_DEVOLUCION
    FROM inserted
END
--Insersion de datos en V_INFORMACION
insert into V_INFORMACION values('Juan','Castro','Fundamentos de BD','12-11-2014','13-10-2015')

SELECT *FROM V_INFORMACION
SELECT *FROM dbo.Prestamos
SELECT *FROM dbo.Usuarios
SELECT *FROM dbo.Libros
/*3.-Crear una transacción que ingrese un nuevo préstamo del libro 'Fundamentos de BD' realizado por el usuario Carlos Jiménez
     el día de hoy, y lo devolverá en 3 días.*/
BEGIN TRY
BEGIN TRANSACTION
	if not exists(select * from Usuarios e where e.U_nombre='Carlos' 
	and e.U_apellido='Jiménez')
	insert into Usuarios values ('U05','1478569532','Carlos','Jiménez','099678202',default)
	insert into Prestamos values('U05','L01','19-10-2015','22-10-2015')
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	RAISERROR('Error en creacion del registo, revisar',16,1)
	RETURN
END CATCH

/*Conteste las siguientes preguntas:
1.-¿Qué procesos se realizan internamente en la BD cuando se ejecuta la instrucción Escribir(Q)?*/

	/*OPERACIONES ESCRIBIR(Q)

	La informacion siempre se almacena en disco y esta organizada(almacenada) en bloques.
	Operacion de escritura.- tiene 2 fases
	1. Se escribe la variable de manera local en el espacio de la transicion para luego esta ser llevada al buffer de datos 
	   donde se almacena en un bloque.

	2. Del buffer de datos se debe trasladar el bloque al que contiene a la variable Q hasta el disco.


/*2.-Explique en qué consisten las propiedades ACID. Describa a cada una de ellas.*/
/*PROPIEDADES ACID.- 
Toda transaccion debe cumplir 4 propiedades conocidas como propiedades ACID: 
Atomicidad,Consistencia, Aislamiento y Durabilidad.

	1: PROPIEDAD DE ATOMICIDAD.- Se realizan todas las transaccones en forma correcta 
	o no se realiza ninguna.
			DESHACER.-El sistema coloca los valores anteriores. 
			ROLLBACK.- Deshacer todo los que hizo el programa determinado.
			-Es controlada por el gestor de transacciones.
			
	2: PROPIEDAD DE COHERENCIA O CONSISTENCIA.-No es controlada por el SO son producidas 
	por fallas del programador.
		-Es controlada por el programador
		
	3: PROPIEDAD DE AISLAMIENTO.- La transaccion T1 y T2 deben mostrar los mismos resultados 
	al ejecutarse concurrentemente o individualmente.
		-Es controlada por el gestor de concurrencia.
		
	4: PROPIEDAD DE DURABILIDAD.- Luego que una transaccion se ejecuta los cambios realizados
	por esa transaccion permanecen en el tiempo. 
		-Es controlada por el subsitema de recuperacion de la base de datos.

