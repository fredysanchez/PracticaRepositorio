
/*DEBER */
--PARA VER QUE TRIGER TENIAMOS EJECUTANDO 
EXEC sp_helptrigger Prestamo
--primero desabilitamos los triggers
alter table dbo.Prestamo
DISABLE TRIGGER tr_insert_prestamo,tr_delete_prestamo,tr_delete_prestamo2


/*TRANSACCIONES EN LA BD BIBLIOTECA
1. Diseñar una transacción que registre el préstamo de un libro.*/
USE BIBLIOTECA
GO
select * from Usuario
select * from dbo.Libro

BEGIN TRY;
BEGIN TRANSACTION;
if not exists(select * from Usuario where U_nombre= 'JUAN' and U_apellido='VIZCAINO')--1ero revisamos si es un usuario registrado 
insert into Usuario values('U08','JUAN','VIZCAINO') ---si no esta registrado insertamos un usuario 
SELECT Li.titulo,Li.L_codigo ,Cl.Cp_estado --verificar si ese libro existe
FROM Libro Li  INNER JOIN copiaLibro Cl    --si existen copias disponibles porque si no hay copias disponibles no se puede prestar 
ON Cl.L_codigo = Li.L_codigo
WHERE Li.titulo='EL QUIJOTE DE LA MANCHA'
insert into Prestamo values('P07','U03','L01','1','2011-12-13','2011-12-14','2') --insetar los datos del prestamo que son la fecha y los dias que el requiere el libro 
update dbo.copiaLibro set Cp_estado='P' where L_codigo='L01' and Cp_nro='1' --en la tabla copia libro poner que esta prestado 
select * from Libro,reserva ---verificar si estuvo reservado el libro  
where Libro.L_codigo= reserva.L_codigo
delete from reserva where L_codigo='L01' --debemos borrar la reservacion 

COMMIT TRANSACTION;
END TRY
BEGIN CATCH;

ROLLBACK TRANSACTION;
RETURN;
END CATCH;

--2.-EJEMPLO  transaccion de devolucion de un libro 
USE BIBLIOTECA
GO
BEGIN TRY;
BEGIN TRANSACTION;

select * from dbo.Libro
select * from dbo.copiaLibro
SELECT titulo Li, Cp_estado Cl ---Revisamos que libros se encuentran prestados
FROM Libro Li INNER JOIN copiaLibro Cl 
ON Cl.L_codigo = Li.L_codigo
WHERE Cp_estado = 'P'

delete from  dbo.copiaLibro where L_codigo='L01' and Cp_estado = 'P' --Borrar el prestamo 
update dbo.copiaLibro set Cp_estado='D' where L_codigo='L01' and Cp_nro='1' --Poner en copia libro la copia que se entrego disponible 
--los datos de prestamo pasarle a la tabla historico y calcular en esta misma tabla la multa si esq corresponde

SELECT  H_fechaPrestamo, H_nroDiasPrestamo , H_multa FROM Historico INNER JOIN Prestamo 
ON Historico.U_codigo =Prestamo.U_codigo AND H_multa<>0
COMMIT TRANSACTION;
END TRY
BEGIN CATCH;

ROLLBACK TRANSACTION;
RETURN;
END CATCH;











BEGIN TRY;
BEGIN TRANSACTION;


if not exists(select * from Usuario where U_apellido='Andrade' and U_nombre='Mirian')
insert into Usuario values ('U03','Andrade','Mirian')
select Libro.L_codigo, Libro.titulo, copiaLibro.Cp_estado from Libro  
inner join copiaLibro  on Libro.L_codigo=copiaLibro.L_codigo 
where Libro.titulo='PROGRAMACION EN JAVA'

insert into Prestamo values('1','U03','L03','1','2011-08-20','2011-08-23','3')
update copiaLibro set Cp_estado='P' where L_codigo='L03' and Cp_nro='1'
delete from reserva where U_codigo='U03' and L_codigo='L03'
COMMIT TRANSACTION;
END TRY
BEGIN CATCH;

ROLLBACK TRANSACTION;
RETURN;
END CATCH;



