/*1.realizar un procedimiento almacenado que despliegue los nombres y apellidos de los estudiantes
 que no tienen deudas.*/
 
 select * from Usuario
 select * from Historico
 
 create procedure pa_UsuariosinDeuda
 @valor money
 as
 	select U_nombre,U_apellido,H_fechaDevuelve,H_nroDiasPrestamo,H_multa from dbo.Usuario u
    inner join dbo.Historico h
	on h.U_codigo=u.U_codigo
	where H_multa=@valor

-------------------------
DECLARE @RC int
DECLARE @valor money
-- TODO: Set parameter values here.
EXECUTE @RC = [BIBLIOTECA].[dbo].[pa_UsuariosinDeuda] 
   @valor=0.00

/*2.un procedimeinto almcenado que despliegue el nuemro de copias disponibles de un titulo 
     q se ingresa como parametro EJ:si ingreso libro de prg debe aparecer disponible  copia 
     numero 1,copia n2*/
 
 select * from copiaLibro
 select * from Libro
 
 create procedure pa_NumeroCopias
 @titulo varchar(100)
 as
 select titulo,L_añoPublicacion,L_editorial,L_tipo,Cp_nro,Cp_estado from dbo.Libro l inner join dbo.copiaLibro cl
 on cl.L_codigo=l.L_codigo
 where @titulo=titulo
 
----------------------------- 
DECLARE @RC int
DECLARE @titulo varchar(100)
-- TODO: Set parameter values here.
EXECUTE @RC = [BIBLIOTECA].[dbo].[pa_NumeroCopias] 
   @titulo ='Programacion en Java'



  /*3.un PA que despliegue el titulo del libro mas prestado*/
 
 
 /*4.hacer un PA que ingrese como parametro el nom de un autro y que como parametro de salida el
  num de libros*/ 
 
 
 use BIBLIOTECA
 
 select * from Prestamo
 