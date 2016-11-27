/* 1. Siempre que se inserta una fila en la tabla PRESTAMO,en la tabla COPIA se cambia a prestado='S'*/

create trigger tr_insert_prestamo
on PRESTAMO
after insert
as
update COPIALIBRO set Cp_estado='P' from COPIALIBRO C, INSERTED I --inserted es una tabla temporal que guarda las filas que se han insertado en este caso en la tabla prestamo
where C.L_CODIGO=I.L_CODIGO and C.Cp_nro=I.Cp_nro

select * from copialibro
select * from prestamo


insert into prestamo values(1,'U01','L01',1,GETDATE(),null,1)

insert into prestamo values(2,'U02','L01',2,GETDATE(),null,1)

insert into Prestamo values(3,'U03','L04',1,'2011-11-09',NULL,3)




create trigger tr_insert_prestamo
on Prestamo
after insert
as
update copiaLibro set Cp_estado='S' from copiaLibro C, INSERTED I ---TABLA TEMPORAL Q ALMACENA LA FILA Q ESTAMOS INSERTANDO
where C.isbn = I.isbn and C.Cp_nro=I.Cp_nro

SELECT * FROM  copiaLibro
-------------------------------------------------------------
/*2.Siempre que se inserta una fila en la tabla PRESTAMO,
se elimina de la tabla RESERVACION la fila correspondiente, si es que existe*/
create trigger tr_insert_prestamo2 --tr de triger inser de la accion q va hacer 
on Prestamo--sore la tabla prestamo
after insert
as
declare  --declaracion de variables si son variables globales empiezan con doble @
@a char(3),
@b  char(3)
select
@a=INSERTED.L_codgo, --extraiga el codigo y ponga en la variable 
@b=INSERTED.U_codigo
from
INSERTED
if exists(select * from reserva R, INSERTED I --si esq existe al menos una fila en reservacion q se haya reservado con ese libro y ese usuario debemos borrar

where R.L_codgo=I.L_codgo and U_codigo=I.U_codigo) begin 
delete from reserva
where isbn = @a and usuarioNro=@b 
end

select * from reserva
---------------------------------------------------
/* 3. Siempre que se borra una fila de la tabla PRESTAMO, en la tabla COPIA se cambia a prestado ='D'*/
create trigger tr_delete_prestamo --TR ES EL TRIGER
on PRESTAMO
after delete
as
update copiaLibro set Cp_estado='D' from copiaLibro C, DELETED D --despues de una insercion en la tabla p restamo actualice 
where C.L_codigo =D.L_codigo and C.Cp_nro=D.Cp_nro

delete from prestamo where P_codigo=1 --aqui se borra el libro que esta prestado de la tabla prestamo y aparece en copiLibro como disponible
---Realizamos los select para comprobar
SELECT * FROM copiaLibro
SELECT * FROM Prestamo



/*4. Siempre que se borra una fila de la tabla PRESTAMO, se inserta en HISTORICO 
la fila con los datos correspondientes al prestamo que se borra*/
/*es decir cada vez q borramos en la tabla prestamo debe guardarse en historico lo q hemos echo
createtrigger tr_delete_prestamo2*/
SELECT * FROM Prestamo
SELECT * FROM Historico

create trigger tr_delete_prestamo2
on Prestamo
after delete
as
declare
@a char(3),
@b char(3),
@c int,
@d datetime,
@e datetime,
@f int
select
@a=DELETED.U_codigo,
@b=DELETED.L_codigo,
@c=DELETED.Cp_nro,
@d=DELETED.P_fechaPrestamo,
@e=DELETED.P_fechaDevuelve,
@f=DELETED.nroDiasPrestamo
from DELETED
insert into HISTORICO values(@a,@b,@c,@d,@e,@f,null)
--codigo para probar lo q se hace con el triger
delete from prestamo where p_codigo =2

--selecccioonamos las tablas para ver lo q hicimos

select * from Prestamo
select * from Historico
select * from copiaLibro

/*5. Cada vez que se actualiza la fecha de devolución en una fila de la tabla HISTORICO, se calcula los dias de retraso y la multa, conociendo que la multa
es de 0,50 dólares por dia.*/

select * from Prestamo
select * from Historico --en esta tabla podemos ver q la multa esta null
select * from copiaLibro

create trigger tr_update_historico --en delete esta los valores antigus de la fila q se actualizo y en insert los valores nuevos de la fila 
on Historico
after update
as
declare
@a datetime,
@b datetime,
@c datetime
select
@a=INSERTED.H_fechaPrestamo,
@b=INSERTED.H_fechaDevuelve
from INSERTED
select @c=dateadd(dd,H_nroDiasPrestamo,INSERTED.H_fechaPrestamo) from INSERTED
update Historico  set H_multa=datediff(dd,@a,@b)*0.5
from Historico H, INSERTED I where H.L_codigo=I.L_codigo and H.Cp_nro= I.Cp_nro
and H.H_fechaPrestamo=I.H_fechaPrestamo


SELECT * FROM Prestamo

update Historico set H_fechaDevuelve= '2011-09-14'where U_codigo = 'U02'
update Historico set H_fechaDevuelve= '2011-09-14'where U_codigo = 'U01'
update Historico set H_fechaDevuelve= '2011-09-14'where U_codigo = 'U01'

-----------------DEBER
---COMO MODIFICAR AL TRIGGER PARA QU CUANDO SE ENTREGUE ANTES NO APARESCA  VALOR NEGATIVO
--HACER LOS SIGUIENTES TRIGERS EN LA BASE DE DATOS REPORTE VENTAS
--CADA VES Q SE INSERTA UNA NUEVA FILA EN LA TABLA VENTASSE DEBE INCREMENTAR EL TOTAL DE VENTAS DEL MES PARA EL VENDEDOR
---Y HACER TAMBIEN CUANDO SE ACTUALIZA O CUANDO SE BORRA
---Y QUE PAS SI CAMBIA EL VALOR vT_VALOR SE DEBE ACTUALIZAR EN LA TABLA VENTAS MES

insert into Historico values ('U03','L01','1','2011-09-25','2011-09-30','10')
insert into Historico values ('U01','L02','1','2011-09-25','2011-09-30','10')
