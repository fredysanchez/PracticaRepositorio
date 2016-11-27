--EJERCICIOS TRIGGER SOBRE LA BD REPORTE DE VENTAS
--TRIGGER QUE EVITA QUE SE BORRE MAS DE UN CLIENTE A LA VEZ
create trigger tr_borrarCliente
on Clientes
after delete
as
if(select COUNT(*) from deleted)>1
begin
PRINT('NO PUEDE BORRAR MAS DE UN USUARIO A LA VEZ EN LA TABLA CLIENTES')
rollback transaction
end

--PROBANDO EL TRIGGER
select * from Clientes

insert into CLIENTES values('c04','FGH')
insert into CLIENTES values('c05','XCV')
insert into CLIENTES values('c06','MKL')

delete from Clientes where clienteCodigo='c01' and clienteCodigo='c02'
delete from Clientes where clienteCodigo='c03'

--PARA DESHABILITAR UN TRIGGER
Alter table Clientes
disable trigger tr_borrarCliente

--PARA HABILITAR UN TRIGGER
Alter table Clientes
enable trigger tr_borrarCliente

--PARA BORRAR UN TRIGGER
drop trigger tr_borrarCliente

--QUE TRIGGER AFECTAN A LA TABLA
exec sp_depends Ventasmensuales

--PARA OBTENER LA DEFINICION DE UN TRIGGER
exec sp_helptext tr_borrarCliente
exec sp_helptext tr_ActTotalVentasMensualesA

--PARA VER LOS TRIGGERS QUE ESTAN ACTUANDO SOBRE UNA TABLA
exec sp_helptrigger Clientes

--TRIGGERS INSTEAD OF (EN VEZ DE)
-- Estos triggers ejecutan un grupo de instrucciones automaticamente cuando se trata de insertar,
-- actualizar o borrar una fila de una tabla, pero estas instrucciones se ejecutan en vez de la inserción,
-- actualización o borrado.

--Crear un trigger que impida borrar filas de la tabla cliente
create trigger tr_borrarVentas
on VENTAS instead of delete
as
raiserror('NO SE PUEDE BORRAR FILAS DE ESTA TABLA',10,1)

SELECT * FROM VENTAS

delete from VENTAS where ventaCodigo='vt1'