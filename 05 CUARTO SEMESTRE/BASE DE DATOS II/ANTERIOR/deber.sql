ESCUELA POLITECNICA NACIONAL
ESFOT – ASI
BASE DE DATOS II
Nombre: MAYRA VIZCAINO
Fecha: 20/09/2011


/*CREAR UN TRIGGER QUE CADA VEZ QUE SE INSERTE UNA FILA EN DETALLE 
ACTUALICE EL VALOR CORRESPONDIENTE DE LA TABLA FACTURAS*/

SELECT * FROM DETALLES
SELECT * FROM FACTURAS
SELECT * FROM PRODUCTOS
-----

create trigger tr_Detalle_update
on DETALLES
AFTER INSERT
as
declare
@precioUnitCompra money,
@cantiCompra dec(8,2),
@codPro char(3),
@nroFact char(3)
select
@precioUnitCompra =inserted.precioUnitario,
@cantiCompra=inserted.cantidadComprada,
@codPro =inserted.codProd,
@nroFact=inserted.nroFact
FROM INSERTED
--if exists(select * from dbo.DETALLES where cantidadComprada * precioUnitario
begin
--select @codFact=deleted.valorFact from deleted
update FACTURAS set valorFact=valorFact +(@cantiCompra*@precioUnitCompra ) where nroFact=@nroFact
update productos set cantidadStock=cantidadStock-@cantiCompra where codProd=@codPro
end

PROBAR EL TRIGGER
insert into detalles values('001','P01',15,0.50)
----------------------------------------------

SELECT * FROM DETALLES


create trigger tr_Detalle_fACTURA
on detalles
for insert
as
declare
@valor money,
@cantidad DEC(8,2),
@codigo CHAR(3)
select
@valor=inserted.precioUnitario,
@cantidad=inserted.cantidadComprada,
@codigo=inserted.nroFact
from inserted
begin
update facturas set valorFact=valorFact+(@valor*@cantidad) where @codigo=nroFact
end
