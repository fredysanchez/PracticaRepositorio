--TRANSACCIONES
--Es un conjunto de instrucciones en SQL o en otro lenguaje persistente, que deben ejecutarse
--como una sola unidad de trabajo, o se ejecutan todas las instrucciones correctamente, o no
--se realiza ninguna.
--PROPÍEDADES ACID
--Toda transacción debe cumplir 4 propiedades conocidas como propiedades ACID: Aislamiento,
--Consistencia, Aislamiento y Durabilidad.
--EJEMPLO
--En la base de datos FACTURACION una transacción es cuando un cliente compra varios productos y se emite
--una factura. El proceso a seguir es el siguiente:
--1. Consultar si el cliente ya está registrado como tal en la base de datos.
use Facturacion
go
select * from CLIENTES where nombreCli='Jose' and apellidoCli='Ayala'
--2. Si está registrado como cliente, se crea una factura para dicho cliente
select * from FACTURAS
insert into FACTURAS values ('022',0,GETDATE(),'C01')
--3.Insertar en la tabla Detalles los productos que va a comprar y su cantidad
select * from PRODUCTOS
select * from DETALLES
insert into DETALLES values('022','P01',10,1)
--4.Cada vez que se inserta una fila en la tabla Detalles, se incrementa el valorFactura
--en este caso en valorFactura=valorFactura+cantidadComprada*precioUnitario
update FACTURAS set valorFact=valorFact+10*1
where nroFact='022'
--5. Cada vez que se inserta una fila en Detalles, se debe disminuir el stock del producto
--que se está vendiendo
update PRODUCTOS set cantidadStock=cantidadStock-10 where codProd='P01'
exec sp_helptrigger productos
drop trigger tr_insert_detalle
drop trigger tr_update_detalles
drop trigger tr_delete_detalle
--Crear una transacción que agrupe a todas las instrucciones como una sola unidad de trabajo
DECLARE @Error int
begin transaction
if not exists(select * from CLIENTES where nombreCli='Jose' and apellidoCli='Ayala')
insert into CLIENTES values('C22','Jose','Ayala','099678202',null)
SET @Error=@@ERROR ---es una variable del sistema
 IF (@Error<>0) GOTO TratarError 
  insert into FACTURAS values ('024',0,GETDATE(),'C22')
  SET @Error=@@ERROR
    IF (@Error<>0) GOTO TratarError
     insert into DETALLES values('024','P01',10,1)
update FACTURAS set valorFact=valorFact+10*1
where nroFact='024'
update PRODUCTOS set cantidadStock=cantidadStock-10 where codProd='P01'
commit transaction
TratarError:
If @@Error!=0
BEGIN
PRINT 'Ha Ocurrido un error. Abortamos la transacción'
ROLLBACK TRANSACTION
END


begin try 
begin transaction
 


--se creo un Restriccion para que la fecha de factura sea menor igual que la fecha actual
set language spanish ---cambiar la configuracion al idioma español 

alter table dbo.PRODUCTOS
add constraint ck_fechaFactura
check (fechaFact <= getdate ())

--OTRA FORMA......................MEJOR ESTE EJMPLO 
BEGIN TRY;
BEGIN TRANSACTION;
if not exists(select * from CLIENTES where nombreCli='Patricio' and apellidoCli='Bossano')
insert into CLIENTES values('C22','Patricio','Bossano','099678202')
insert into FACTURAS values ('025',0,GETDATE(),'C22')
insert into DETALLES values('025','P01',270,1)
update FACTURAS set valorFact=valorFact+270*1
where nroFact='025'
update PRODUCTOS set cantidadStock=cantidadStock-270 where codProd='P01'
COMMIT TRANSACTION;
END TRY
BEGIN CATCH;---INICIO DE CATCH
ROLLBACK TRANSACTION;
RAISERROR('Error en creación de Factura, revisar', 16, 1);
RETURN;
END CATCH;--FINALIZA EL CATCH
ALTER TABLE PRODUCTOS
ADD CONSTRAINT CK_STOCK_NEGATIVO
CHECK(CANTIDADSTOCK>=0)
exec sp_helptrigger detalles
ALTER TABLE DETALLES
DISABLE TRIGGER tr_insert_detalles


--TRABAJANDO CON UN PROCEDIMIENTO ALMACENADO
create PROC sp_insercionDetalles
@codCli char(3),@codFac char(3),@codProd char(3),@cant dec(8,2),@precioU money
as
if not exists(select * from FACTURAS where @codFac=nroFact)
begin
insert into FACTURAS values (@codFac,0,GETDATE(),@codCli)
end
insert into DETALLES values(@codFac,@codProd,@cant,@precioU)
update FACTURAS set valorFact=valorFact+@cant*@precioU
where nroFact=@codFac
update PRODUCTOS set cantidadStock=cantidadStock-@cant where codProd=@codProd
BEGIN TRY;
BEGIN TRANSACTION;
exec sp_insercionDetalles 'C03','007','P02',5,1.25
COMMIT TRANSACTION;
END TRY
BEGIN CATCH;
ROLLBACK TRANSACTION;
RAISERROR('Error en creación de Factura, revisar', 16, 1);
RETURN;
END CATCH;
SELECT * FROM FACTURAS
SELECT * FROM PRODUCTOS
SELECT * FROM CLIENTES