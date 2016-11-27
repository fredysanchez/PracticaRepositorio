--SCRIPT DE CREACIÓN DE BASE DE DATOS DE REPORTES DE VENTAS

create database ReporteVentas
go

use ReporteVentas

CREATE TABLE Vendedor (
V_codigo int PRIMARY KEY,
V_nombre varchar(100),
V_areaVentas varchar(100) check(V_areaVentas in('Norte','Centro','Sur'))
)

CREATE TABLE Clientes (
C_codigo char(3) PRIMARY KEY,
C_nombre varchar(100) unique
)

CREATE TABLE Ventas (
Vt_codigo char(3) PRIMARY KEY,
Vt_fecha date,
Vt_valor money  check(Vt_valor>=1000),
V_codigo int references Vendedor(V_codigo),
C_codigo char(3)
)

ALTER TABLE Ventas ADD FOREIGN KEY(C_codigo) REFERENCES Clientes (C_codigo)

CREATE TABLE VentasMes (
Vm_mes int check(Vm_mes between 1 and 12),
Vm_año int check(Vm_año between 2000 and year(getdate())),
Vm_ventaTotalMes money,
V_codigo int,
PRIMARY KEY(V_codigo,Vm_mes,Vm_año),
FOREIGN KEY(V_codigo) REFERENCES Vendedor (V_codigo)
)


insert into Vendedor values(100,'Carlos Auz','Centro')
insert into Vendedor values(171,'José Ayala','Norte')
insert into Vendedor values(120,'Marta Vaca','Sur')

insert into Clientes values('C01','Macosa')
insert into Clientes values('C02','xyz')
insert into Clientes values('C05','abc')
insert into Clientes values('C08','bbc')

insert into Ventas values('V21','2011-01-12',10000,171,'C02')
insert into Ventas values('V22','2011-01-12',5000,171,'C05')
insert into Ventas values('V23','2011-01-27',7000,171,'C05')
insert into Ventas values('V24','2011-01-28',7000,171,'C08')
insert into Ventas values('V14','2010-01-28',5000,171,'C02')
insert into Ventas values('V15','2010-12-15',10000,171,'C01')
insert into Ventas values('V11','2010-01-28',5000,100,'C01')
insert into Ventas values('V12','2010-09-28',3000,100,'C08')




INSERT INTO VentasMes values(1,2011,29000,171)
INSERT INTO VentasMes values(1,2010,5000,171)
INSERT INTO VentasMes values(12,2010,10000,171)
INSERT INTO VentasMes values(1,2010,5000,100)
INSERT INTO VentasMes values(9,2010,3000,100)

select * from VentasMes
update  ventasmes set Vm_mes=1 where Vm_mes=12 and V_codigo=100 

/*CONSULTAS

1. Encontrar el valor total vendido por el vendedor José Ayala el año 2010.*/
select SUM(Vm_ventaTotalMes) from Vendedor v inner join VentasMes Vm
on v.V_codigo=Vm.V_codigo
where Vm_año=2010 and V_nombre like 'José Ayala'

--2. Encontrar el nombre del cliente que mas ha comprado.
select C_nombre, SUM(Vt_valor) as 'Total Compras' from Clientes c inner join Ventas v on c.C_codigo=v.C_codigo
group by C_nombre order by 2 desc
SELECT *FROM VentasMes 
SELECT *FROM Ventas 

SELECT *FROM Clientes 

SELECT *FROM Clientes 
SELECT *FROM Vendedor 

insert into Ventas values('001','2011-09-11',3000,100,'C05')
insert into Ventas values('002','2011-09-17',2000,100,'C01')
insert into Ventas values('003','2011-09-12',5000,171,'C01')
delete from Ventas 
select *from VentasMes  
-- Crear un trigger en la base de datos de Reporte Ventas para que, cuando se inserte, 
--se actualice o se borre una fila de la tabla Ventas, se modifique tambien el atributo 
--Vm_VentaTotalMes de la tabla VentasMes

CREATE TRIGGER tr_insert_ventas
ON Ventas
AFTER INSERT
AS

DECLARE @fecha date,
@vendedor int,
@totalMes money

--obtener datos
SELECT
@fecha=INSERTED.Vt_fecha,
@vendedor=INSERTED.V_codigo
FROM INSERTED

SELECT @totalMes=(SELECT SUM(Vt_valor)FROM Ventas AS V
					WHERE MONTH(V.Vt_fecha)=MONTH(@fecha)
					AND YEAR(V.Vt_fecha)=YEAR(@fecha)
					AND V.V_codigo=@vendedor
					GROUP BY V_codigo)
					drop trigger tr_insert_ventas

--SI YA EXISTE UN REGISTRO X MES Y AÑO SOLO LO ACTUALIZO
IF EXISTS(SELECT*FROM VentasMes AS VM WHERE Vm_mes=MONTH(@fecha)AND Vm_año=YEAR(@fecha)AND VM.V_codigo=@vendedor)
BEGIN
	UPDATE VentasMes SET Vm_ventaTotalMes=@totalMes WHERE VentasMes.Vm_mes=MONTH(@fecha)AND
	VentasMes.Vm_año=YEAR(@fecha)AND V_codigo=@vendedor
END
ELSE
BEGIN
	INSERT INTO VentasMes VALUES (MONTH(@fecha),YEAR(@fecha),@totalMes,@vendedor)
END

--TRIGGER DE ELIMINACIÓN EN LA TABLA VENTAS

CREATE TRIGGER tr_delete_ventas
ON Ventas
AFTER DELETE
AS

DECLARE @fecha date,
@vendedor int,
@totalMes money

--OBTENGO DATOS DE LA VENTA ELIMINADA
SELECT
@fecha=DELETED.Vt_fecha,
@vendedor=DELETED.V_codigo
FROM DELETED

SELECT @totalMes = (SELECT SUM(Vt_valor)FROM Ventas AS V
					WHERE MONTH(V.Vt_fecha)=MONTH(@fecha)
					AND YEAR(V.Vt_fecha)=YEAR(@fecha)
					AND V.V_codigo=@vendedor
					GROUP BY V_codigo)

--SI YA EXISTE UN REGISTRO X MES Y AÑO SOLO LO ACTUALIZO
IF EXISTS(SELECT*FROM VentasMes AS VM WHERE Vm_mes=MONTH(@fecha)AND Vm_año=YEAR(@fecha)AND VM.V_codigo=@vendedor)
BEGIN
	UPDATE VentasMes SET Vm_ventaTotalMes=@totalMes WHERE VentasMes.Vm_mes=MONTH(@fecha)AND
	VentasMes.Vm_año=YEAR(@fecha)AND V_codigo=@vendedor
END

--TRIGGER DE ACTUALIZACIÓN EN LA TABLA VENTAS

CREATE TRIGGER tr_update_ventas
ON Ventas
AFTER UPDATE
AS

DECLARE @fecha date,
@vendedor int,
@totalMes money

--OBTENER DATOS DE LA VENTA ELIMNINADA
SELECT
@fecha=DELETED.Vt_fecha,
@vendedor=DELETED.V_codigo
FROM DELETED

SELECT @totalMes=(SELECT SUM(Vt_valor)FROM Ventas AS V
					WHERE MONTH(V.Vt_fecha)=MONTH(@fecha)
					AND YEAR(V.Vt_fecha)=YEAR(@fecha)
					AND V.V_codigo=@vendedor
					GROUP BY V_codigo)

--ACTUAIZACION SI YA EXISTE EL REGISTRO
IF EXISTS(SELECT*FROM VentasMes AS VM WHERE Vm_mes=MONTH(@fecha)AND Vm_año=YEAR(@fecha)AND 
VM.V_codigo=@vendedor)
BEGIN
	UPDATE VentasMes SET Vm_ventaTotalMes=@totalMes WHERE VentasMes.Vm_mes=MONTH(@fecha)AND
	VentasMes.Vm_año=YEAR(@fecha)AND V_codigo=@vendedor
END

--OBTENGO DATOS DE LA VENTA ACTUALIZADA
SELECT @fecha=INSERTED.Vt_fecha,
@vendedor=INSERTED.V_codigo
FROM INSERTED


SELECT @totalMes=(SELECT SUM(Vt_valor)FROM VentasASV
					WHERE MONTH(V.Vt_fecha)=MONTH(@fecha)
					AND YEAR(V.Vt_fecha)=YEAR(@fecha)
					AND V.V_codigo=@vendedor
					GROUP BY V_codigo)

--SI YA EXISTE UN REGISTRO X MES Y AÑO SOLO LO ACTUALIZO
IF EXISTS(SELECT*FROM VentasMes AS VM WHERE Vm_mes=MONTH(@fecha)AND Vm_año=YEAR(
@fecha)AND VM.V_codigo=@vendedor)
BEGIN
	UPDATE VentasMes SET Vm_ventaTotalMes=@totalMes WHERE VentasMes.Vm_mes=MONTH(@fecha)AND
	VentasMes.Vm_año=YEAR(@fecha)AND V_codigo=@vendedor
END
ELSE
BEGIN
	INSERT INTO VentasMes VALUES (MONTH(@fecha),YEAR(@fecha),@totalMes,@vendedor)
END

DROP TRIGGER  tr_insert_ventas

--DEL INGENIERO TRIGGERS


--MODIFICACIÓN AL TRIGGER QUE CALCULA LA MULTA EN LA TABLA HISTORICO DE LA BASES DE DATOS BIBLIOTECA

/*Cada vez que se actualiza la fecha de devolución en una fila
de la tabla HISTORICO, se calcula los dias de retraso y la multa,
conociendo que la multa es de 0,50 dólares por dia.*/

alter trigger tr_update_historico
on historico
after update
as
declare
@cod char(3),
@nCopia int,
@a date,--Variable para recuperar la fechaPrestamo
@b date,--Variable para recuperar la fecha que devuelve
@c int, --Nro de dias que se tarda en entregar
@d int --Aqui se guarda el numero de dias de prestamo
select
@cod=inserted.L_codigo,
@nCopia=inserted.Cp_nro,
@a=INSERTED.H_fechaPrestamo,
@b=INSERTED.H_fechaDevuelve,
@d=Inserted.H_nroDiasPrestamo
from INSERTED
select @c=datediff(dd,@a,@b)from inserted

if @c>=@d
begin
update HISTORICO set H_multa=(@c-@d)*0.5
where Historico.L_codigo=@cod and Historico.Cp_nro=@nCopia
and Historico.H_fechaPrestamo=@a
end
else
begin
update HISTORICO set H_multa=0
where Historico.L_codigo=@cod and Historico.Cp_nro=@nCopia
and Historico.H_fechaPrestamo=@a
end

--TRIGGERS SOBRE LA BASE DE DATOS REPORTE VENTAS

--TRIGGER 1
/*Cada vez que se inserta una fila en la tabla ventas, en la tabla ventasMes se incrementa el valor de la venta a VM_ventaTotalMes*/

create trigger tr_Venta_all
on ventas
for insert
as
declare
@mes int,
@anio int,
@valor money,
@vendedor int

select
@mes=MONTH(inserted.Vt_fecha),
@anio=YEAR(inserted.Vt_fecha),
@valor=inserted.Vt_valor,
@vendedor=inserted.V_codigo
from inserted
if exists(select * from VentasMes where V_codigo=@vendedor and Vm_mes=@mes and Vm_año=@anio)
begin
update VentasMes set Vm_ventaTotalMes=Vm_ventaTotalMes+@valor where V_codigo=@vendedor and Vm_mes=@mes and Vm_año=@anio
end
else begin
insert into VentasMes values(@mes,@anio,@valor,@vendedor)
end

--PROBAR EL TRIGGER
select * from ventas
select * from ventasmes

delete from ventas
delete from ventasmes

insert into Ventas values('V13','2010-01-29',2000,100,'C02')
insert into Ventas values('V16','2010-02-28',2000,100,'C02')


--TRIGGER 2
/*Cada vez que se cambia el valor de venta enuna fila de la tabla ventas, en la tabla ventasMes se cambia el valor de la venta en VM_ventaTotalMes */

create trigger tr_Venta_update
on ventas
for update
as
declare
@mes int,
@anio int,
@valorNuevo money,
@vendedor int,
@valorViejo money
select
@mes=MONTH(inserted.Vt_fecha),
@anio=YEAR(inserted.Vt_fecha),
@valorNuevo=inserted.Vt_valor,
@vendedor=inserted.V_codigo
from inserted

select @valorViejo=deleted.Vt_valor from deleted
update VentasMes set Vm_ventaTotalMes=
Vm_ventaTotalMes+@valorNuevo-@valorViejo 
where V_codigo=@vendedor and Vm_mes=@mes and Vm_año=@anio

--PROBAR EL TRIGGER
update Ventas set Vt_valor=4500 where Vt_codigo='V13'


--TRIGGER 3
/* Cada vez que se borra una fila de la tabla Ventas, se disminuye el total de ventas del vendedor correspondiente en la tabla VentasMes */

create trigger tr_Venta_delete
on ventas
for delete
as
declare
@mes int,
@anio int,
@valor money,
@vendedor int,
@fecha date

select
@mes=MONTH(deleted.Vt_fecha),
@anio=YEAR(deleted.Vt_fecha),
@valor=deleted.Vt_valor,
@vendedor=deleted.V_codigo,
@fecha=deleted.Vt_fecha
from deleted

if exists(select * from Ventas where V_codigo=@vendedor and MONTH(@fecha)=@mes and @anio=YEAR(@fecha))
begin 
update VentasMes set Vm_ventaTotalMes=Vm_ventaTotalMes-@valor where V_codigo=@vendedor and Vm_mes=@mes and Vm_año=@anio
end
else begin
delete VentasMes where V_codigo=@vendedor and Vm_mes=@mes and Vm_año=@anio
end

--PROBAR EL TRIGGER
select * from clientes
select * from Vendedor
select * from ventas
select * from ventasMes

insert into ventas values('001','2011-09-11',3000,100,'C05')
insert into ventas values('002','2011-09-17',2600,100,'C01')
insert into ventas values('003','2011-09-12',5000,171,'C01')