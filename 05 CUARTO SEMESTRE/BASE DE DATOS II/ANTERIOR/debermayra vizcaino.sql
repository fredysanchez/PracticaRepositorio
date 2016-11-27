/*/                               ESCUELA POLITECNICA NACIONAL
                                        ESFOT – ASI
                                     BASE DE DATOS II
Nombre: MAYRA VIZCAINO
Fecha: 20/09/2011
                                          DEBER
*/
--EJERCICIO DE TRIGGER BDD FACTURACION
/*OJO: En cada trigger tambien tomar en cuenta que con cada inserción, modificación o borrado de 
--filas en la tabla DETALLES, tambien se afecta la cantidaddisponible en el stock de productos.*/

/*CREAR UN TRIGGER QUE CADA VEZ QUE SE INSERTE UNA FILA EN DETALLE 
ACTUALICE EL VALOR CORRESPONDIENTE DE LA TABLA FACTURAS*/

SELECT * FROM DETALLES
SELECT * FROM FACTURAS
SELECT * FROM PRODUCTOS
-----

create trigger tr_Detalle_update
on DETALLES
for INSERT
as
declare
@precioUnitCompra money,
@cantiCompra decimal(8,2),
@codPro char(3),
@nroFact char(3)
select
@precioUnitCompra =inserted.precioUnitario,
@cantiCompra=inserted.cantidadComprada,
@codPro =inserted.codProd,
@nroFact=inserted.nroFact
FROM inserted
begin
update FACTURAS set valorFact=valorFact +(@cantiCompra*@precioUnitCompra ) where nroFact=@nroFact
update PRODUCTOS set cantidadStock=cantidadStock-@cantiCompra where codProd=@codPro
end

--PROBAR EL TRIGGER
insert into dbo.DETALLES values('001','P02',10,0.70)
----------------------------------------------

/*2. Crear un trigger que cuando se modifique la cantidad o el precio unitario en una fila 
de la tabla DETALLES, se modifique el valor de la factura en el valor correspondiente.*/

SELECT * FROM dbo.PRODUCTOS
SELECT * FROM dbo.DETALLES
SELECT * FROM dbo.FACTURAS

CREATE TRIGGER tr_update_detalles
ON dbo.DETALLES
AFTER UPDATE
AS
DECLARE
@nroFact CHAR(3),
@codProd CHAR (3),
@cantidadComprada DECIMAL(8,2),
@precioUnitario MONEY
SELECT 
@nroFact = INSERTED.nroFact,
@codProd = INSERTED.codProd,
@cantidadComprada = INSERTED.cantidadComprada,
@precioUnitario = INSERTED.precioUnitario
FROM INSERTED
BEGIN
 UPDATE dbo.FACTURAS SET valorFact = @cantidadComprada * @precioUnitario WHERE nroFact = @nroFact
 update PRODUCTOS set cantidadStock=cantidadStock-(@cantidadComprada) where @codProd=codProd
END


--3. Crear un trigger que cuando se borre una fila de la tabla DETALLES se disminuya el valor  de la factura en el valor correspondiente.


select * from DETALLES
select * from FACTURAS
select * from PRODUCTOS


create  trigger tr_Detalle_delete
on dbo.DETALLES
AFTER delete
as
declare
@precioUnitario money,
@cantidadComprada dec(8,2),
@codProducto char(3),
@nroFact char(3)
select
@precioUnitario=deleted.precioUnitario,
@cantidadComprada=deleted.cantidadComprada,
@codProducto=deleted.codProd,
@nroFact=deleted.nroFact
from deleted
begin
update  dbo.FACTURAS set valorFact=valorFact-(@precioUnitario*@cantidadComprada) where @nroFact=nroFact
update  dbo.PRODUCTOS set cantidadStock= cantidadStock+(@cantidadComprada) where @codProducto=codProd
end 

