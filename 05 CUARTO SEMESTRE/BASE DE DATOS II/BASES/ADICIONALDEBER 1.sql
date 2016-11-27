-- Escuela Politecnica Nacional
-- Escuela de Formacion de Tecnologos.
-- Base de Datos II.
-- Oscar Llumiquinga.


CREATE DATABASE REPORTEVENTAS1
GO
USE REPORTEVENTAS1
GO

CREATE TABLE VENDEDORES (
vendedorCodigo char(3) PRIMARY KEY,
vendedorNombre varchar(100),
vendedorApellido varchar(100)
)

CREATE TABLE CLIENTES (
clienteCodigo char(3) PRIMARY KEY,
clienteNombre varchar(100)
)

CREATE TABLE VENTAS (
ventaCodigo char(3) PRIMARY KEY,
ventaFecha date,
ventaMonto money,
clienteCodigo char(3),
vendedorCodigo char(3),
FOREIGN KEY(vendedorCodigo) REFERENCES VENDEDORES (vendedorCodigo)
)

ALTER TABLE VENTAS ADD FOREIGN KEY(clienteCodigo) REFERENCES CLIENTES (clienteCodigo)
CREATE TABLE VENTASMENSUALES (
vendedorCodigo char(3),
mes int,
año int,
totalVentas money,
PRIMARY KEY(mes,año,vendedorCodigo),
FOREIGN KEY(vendedorCodigo) REFERENCES VENDEDORES (vendedorCodigo)
)

insert into VENDEDORES values('v01','Luis','Ayala')
insert into VENDEDORES values('v02','Ana','Puente')

insert into CLIENTES values('c01','ABC')
insert into CLIENTES values('c02','XYZ')
insert into CLIENTES values('c03','RST')

insert into VENTAS values('vt1','2011-12-23',2000,'c01','v01')
insert into VENTAS values('vt2','2011-12-23',2000,'c02','v02')
insert into VENTAS values('vt3','2011-12-30',5000,'c02','v01')
insert into VENTAS values('vt4','2012-01-01',2000,'c03','v02')
insert into VENTAS values('vt5','2012-01-04',3000,'c02','v02')

insert into VENTASMENSUALES values ('v01',12,2011,7000)
insert into VENTASMENSUALES values ('v02',12,2011,2000)
insert into VENTASMENSUALES values ('v02',1,2012,5000)
insert into VENTASMENSUALES values ('v01',1,2012,0)



--TRIGGERS SOBRE LA BD REPORTE DE VENTAS
-- 1. Crear un trigger que cada vez que se inserte una fila en la tabla VENTAS, 
-- se acumule el valor de la venta en el total de ventas mensuales para el vendedor que realiza la venta.

create trigger tr_insert_ventas
on ventas
after insert
as 

declare 
@a char(3),
@b money,
@c datetime

select
@a=inserted.vendedorcodigo,
@b=inserted.ventamonto,
@c=inserted.ventafecha
from inserted

if exists(select month(ventafecha),year(ventafecha) from ventasmensuales v, inserted I 
where v.vendedorcodigo=I.vendedorcodigo and mes = month(ventafecha) and año=year(ventafecha))
begin
update ventasmensuales set totalventas = totalventas+@b
where (mes=month(@c) and año=year(@c) and vendedorcodigo=@a)
end
else
begin
insert into ventasmensuales values (@a,month(@c),year(@c),@b)
end


-- 2. Crear un trigger que cuando se borre una fila de la tabla VENTAS, 
-- se descuente el valor de esa venta de la tabla VENTAS MENSUALES en el mes que corresponda.

create trigger tr_delete_ventas
on ventas
after delete
as

declare 
@a char(3),
@b money,
@c date

select
@a=deleted.vendedorcodigo,
@b=deleted.ventamonto,
@c=deleted.ventafecha
from deleted

update ventasmensuales set totalventas = totalventas - @b
where (mes=month(@c) and año=year(@c) and vendedorcodigo=@a 


-- 3. Crear un trigger que cuando se actualice una fila de la tabla VENTAS, se modifique el valor 
-- de esa venta de la tabla VENTAS MENSUALES en el mes que corresponda.

create trigger tr_update_ventas
on ventas
after update
as

declare 
@a char(3),
@b money,
@c datetime,
@d money,
@e date


select 
@d = ventas.ventamonto,
@e = ventas.ventafecha
from ventas

select
@a=inserted.vendedorcodigo,
@b=inserted.ventamonto,
@c=inserted.ventafecha
from inserted


update ventasmensuales set mes=month(@c), año=year(@c)
where (mes=month(@e) and año=year(@e))
update ventasmensuales set totalventas = totalventas - @d +@b
where (mes=month(@c) and año=year(@c))
update ventasmensuales set vendedorcodigo = @a
where (mes=month(@c) and año=year(@c))




--PROCEDIMIENTOS ALMACENDOS SOBRE LA BD REPORTE DE VENTAS
-- 1. Crear un PA que reciba como parámetro el nombre de un vendedor y despliegue el total de ventas 
-- que ha realizado.

create proc sp_Total_Ventas_Vendedor
@nombre varchar(100),
@apellido varchar(100)
as
select sum(totalVentas) as TOTAL_VENTAS from VENTASMENSUALES vm inner join 
VENDEDORES v on vm.vendedorCodigo=v.vendedorCodigo
where @nombre=vendedorNombre and @apellido=vendedorApellido

exec sp_Total_Ventas_Vendedor 'Ana','Puente'

select *from VENTASMENSUALES
select *from VENDEDORES


-- 2. Crear un PA que despliegue el total de ventas realizado por todos los vendedores en un mes y un año
-- que se reciben como parámetros.

create proc sp_Total_Ventas_mes_año
@mes int,
@año int
as
select mes,año,sum(totalVentas) as TOTAL_VENTAS from dbo.VENTASMENSUALES
where @mes=mes and @año=año
group by mes,año


exec sp_Total_Ventas_mes_año @mes=1,@año=2012

exec sp_Total_Ventas_mes_año @mes=12,@año=2011


-- 3. Crear un PA que despliegue el nombre del vendedor, la fecha y el monto de todas las compras 
-- realizadas por un cliente cuyo nombre se recibe como parámetro.

create proc sp_Nombre_Vendedor
@nombre varchar(100)
as
select vendedorNombre,vendedorApellido,ventaFecha, sum(ventaMonto) as Compras_Total from VENTAS vt inner join 
VENDEDORES v on vt.vendedorCodigo=v.vendedorCodigo inner join CLIENTES c on vt.clienteCodigo=c.clienteCodigo
where @nombre=clienteNombre
group by vendedorNombre,vendedorApellido,ventaFecha

exec sp_Nombre_Vendedor 'XYZ'

select *from VENTAS
select *from CLIENTES
select *from VENDEDORES
