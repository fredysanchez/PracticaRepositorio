--TRANSACCIONES
/*ES UN CONJUNTO DE INSTRUCCIONES EN SQL O EN OTRO LENGUAJE PERSISTENTE, Q DEBE EJECUTARSE COMO UNA SOLA UNIDAD DE TRABAJO 
O SE EJECUTAN TODAS LAS INSTRUCCIONES CORRECTAMENTE O NO SE REALIZA NINGUNA*/
--PROPIEDADES ACID
/*toda transacciondebe cumplir 4 propiedades conocidas como propiedades ACID aislamiento, cosistencia, aislamiento y durabilidad*/
--EJEMPLO	
/*en la base de datos facturacion una transaccion es cuando un cliente compra varios productos y????????? una factura, el proceso 
a seguir es el siguiente*/

--1 consultar si el cliente ya esta registrado como tal en la base de datos

use Facturacion
go
select * 
from CLIENTES 
where nombreCli='jose' and apellidoCli ='ayala'

--2 si esta registrado como cliente, se crea una factura para dicho cliente
select * from FACTURAS
insert into FACTURAS values ('022',0, GETDATE(),'C01')

--3 INSERTAR EN LA TABLA DETALLES LOS PRODUCTOS QUE VAN A COMPRAR Y SU CANTIDAD

SELECT* FROM PRODUCTOS
SELECT *FROM DETALLES
INSERT INTO DETALLES VALUES ('022','P01',10,0)

--4 CADA VEZ QUE SE INSERTE UNA FILA EN LA TABLA DETALLES SE INCREMENTA EL VALOR DE LA FACTURA
--EN ESTE CASO EN VALOR FACTURA=VALOR FACTURA + CANTIDAD COMPRADA+ PRECIO UNITARIO
UPDATE FACTURAS SET valorFact=valorFact+cantidadcomprada+preciounitario
where nroFact='022'

--5 cada vez que se inserte una fila en detalles, se debe disminuir el stock del producto
--que se esta vendiendo

update PRODUCTOS set cantidadStock=cantidadStock- 10 
where codProd='p01'

--para ver que triggers estan 
exec sp_helptrigger productos
drop trigger tr_detalles
declare @error int

begin transaction 
if not exists (select * from CLIENTES where nombreCli= 'jose' and apellidoCli ='ayala')
insert into CLIENTES values ('c22', 'jose', 'ayala', '095258789', null)
set @error=@@ERROR
if (@error<>0) goto tratarerror
insert into FACTURAS values ('022',0, GETDATE(),'C01')
INSERT INTO DETALLES VALUES ('022','P01',10,0)
IF (SELECT +())
update FACTURAS set valorFact=valorFact+10*1
where nroFact ='022'
update PRODUCTOS set cantid
adStock=cantidadStock- 10 where codProd='p01'
commit transaction
END TRY
trantarerror:
if(@@ERROR<>0) then
begin


---COMO HARIAMOS PARA QUE EL STOCK DE LA CANTIDAD SEA EL ADECUADO PARA VENDER



 
begin transaction 
if not exists (select * from  dbo.PRODUCTOS where cantidadStock = '290'AND codProd = 'P01')
insert into dbo.PRODUCTOS values ('P01','HARINA',)
set @error=@@ERROR
if (@error<>0) goto tratarerror
