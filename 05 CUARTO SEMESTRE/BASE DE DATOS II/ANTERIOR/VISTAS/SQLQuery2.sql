use biblioteca

-- vistas (views)
--Son tablas virtuales q estan formadas por consultas preconstruidas y q son muy utilizadas 
-- en un ambiente de bases de datos por dos razones:
-- 1. Por seguridad cuando se quiere ocultar a un usuario ciertas columnas o filas de una tabla
-- 2. Por rendimiento, cuando se necesita realizar con frecuencias consultas complejas y costosas en rendimiento


-- EJEMPLO 1: Crear una vista q despliegue el codigo y el nombre de los usuarios de la biblioteca

create view datosusuario as
select U_codigo as codigo,U_nombre+''+U_apellido as nombre from Usuario

select * from datosusuario 

-- Inserciones en la vistas

insert into datosusuario (codigo)values ('U05')

-- Insercion en la tabla original

insert into Usuario values ('U06','Carlos','Fuentes')

select nombre from datosusuario d join Prestamo p
on d.codigo=p.U_codigo

--EJEMPLO 2 CREAR UNA VISTA Q DESPLIEGUE LOS NOMBRES Y LOS APELLIDOS 
-- DE LOS USUARIOS Q HICIERON RESERVACIONES ESTA SEMANA

/*create view datosreservaciones as
select U_nombre,U_Apellido as codigo,U_nombre+''+U_apellido as nombre from Usuario u join reserva r
on u.U_codigo=r.U_codigo

select * from datosreservaciones
select * from reserva*/

create view reservasemana as
select nombre, fechaReserva from datosusuario d join reserva r
on d.codigo = r.U_codigo
and DATEPART(WEEK,fechaReserva)=DATEPART(week,getdate()) 

select * from reservasemana
select * from reserva

insert into reserva values ('R03','U03','L03','2011-10-18')

insert into reservasemana values ('','')


/*1.Determinar las vistas de los titulos de los libros y el numero de copia 
junto al numero de veces q se han prestado*/

select * from dbo.Libro
select * from dbo.Historico

create view LibrosMasPrestados as
select titulo, Cp_nro from Libro l join Historico h 
on l.L_codigo=h.L_codigo

select * from LibrosMasPrestados

create view LibrosMasPrestados as
select sum(H_nroDiasPrestamo) 
from dbo.Historico 



create view LibrosMasPrestadossss as
select titulo, count (h.Cp_nro) as 'numero'from Libro l join Historico h 
on l.L_codigo=h.L_codigo
group by titulo

select * from LibrosMasPrestadossss


select * from Historico
-------------------------------------------------------------------
alter view LibrosMasPrestadosss as
select sum(h.H_nroDiasPrestamo) ,t.titulo  
from Historico h inner join Libro b
on a.L_codigo=b.L_codigo
group by b.titulo

select * from NroDias 




create view NumlibrosPrestados as 
select COUNT (b.L_codigo)as '#prestamo',a.titulo,b.cp_


/*2. Hacer una vista q despliegue el titulo del libro q mas dias ha estado prestado*/
select * from dbo.Libro
select * from dbo.Historico


create view tituloPrest as
select SUM (H_nroDiasPrestamo)as 'titulo+Prestado'from dbo.Historico 
group by L_codigo


SELECT MAX (titulo+Prestado) as 'maximoPrestamo'FROM tituloPrest
group by L_codigo






/*3. Hacer una lista q despliegue el titulo de los libros q nunca se han prestado */


create view LibrosNoPrestados as
select titulo
from libro 
where L_codigo not in (select L_codigo from dbo.Historico)

select * from LibrosNoPrestados