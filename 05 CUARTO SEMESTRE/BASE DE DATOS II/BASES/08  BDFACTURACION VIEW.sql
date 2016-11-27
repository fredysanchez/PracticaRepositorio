/*VISTAS
Son tablas virtuales que nos sirven para variados propositos, entre ellos:
1.- Por seguridad, para ocultar de ciertos usuarios columnas o filas de una tabla
    que contienen informacion confidencial
2.- Para mantener un reporte muy utilizado que es my costoso de realizarlo para 
    el sistema.
3.- Para mantener tablas anteriores que son utilizadas en una aplicacion una vez 
    que el esquema de la BD ha cambiado.

Ejemplo 1: En la BD Facturacion, desplegar el codigo, nombre y unidades de los
productos, ocultando la cantidad en stock*/

select *from PRODUCTOS
create view v_Productos
as
select codProd as 'CODIGO_PRODUCTO',
nombreProd as 'NOMBRE_PRODUCTO',
unidades
from PRODUCTOS

select * from v_productos
select * from PRODUCTOS

insert into v_Productos values('P05','fideo','Kg')

--Ejemplo 2: Crear una vista que despliegue para cada factura, el nombre de
--cada producto,cantidad comprada, unidades, costo unitario de compra y costo
--total de cada producto

create view v_DetalleFacturas
as
select nroFact as 'NRO_FACTURA',
p.codProd as 'CODIGO_PRODUCTO',
nombreProd as 'NOMBRE_PRODUCTO',
cantidadComprada as 'CANTIDAD_COMPRADA',
unidades as 'UNIDADES',
precioUnitario as 'PRECIO_UNITARIO',
(cantidadComprada*precioUnitario) as 'VALOR_PRODUCTO'
from DETALLES d join PRODUCTOS p
on d.codProd=p.codProd

select * from v_DetalleFacturas

SELECT * FROM FACTURAS
SELECT * FROM CLIENTES
SELECT * FROM DETALLES 
SELECT * FROM PRODUCTOS  
 
insert into FACTURAS values('006', 0,'12-12-2011', 'C03')

insert into DETALLES values('006','P03',6,2.00)
insert into DETALLES values('006','P04',8,1.00)

--Veamos si las inserciones hechas en las tablas originales se reflejan en la vista
select * from v_DetalleFacturas

--Tratemos de insertar una fila en la vista v_DetalleFacturas             --No se inserta porque
insert into v_DetalleFacturas values('005','P01','Arroz',10,'libra',0.5,5)-- estos involucrada varias
																		  -- tablas en la vista				

--Crear un trigger instead of para poder insertar filas en la vista v_DetalleFacturas
CREATE TRIGGER tr_insercionV_DetalleFacturas ON v_DetalleFacturas
INSTEAD OF INSERT
AS
BEGIN
SET NOCOUNT ON
--Si no existe el producto, debe insertarse en la tabla Productos
IF (NOT EXISTS (SELECT P.codProd
    FROM Productos P, inserted I
    WHERE P.codProd = I.CODIGO_PRODUCTO))
	INSERT INTO PRODUCTOS
    SELECT CODIGO_PRODUCTO,NOMBRE_PRODUCTO,UNIDADES,null,null
    FROM inserted
ELSE
   PRINT 'YA EXISTE EL PRODUCTO'
IF (NOT EXISTS (SELECT D.nroFact, D.codProd
    FROM DETALLES D, inserted i
    WHERE D.nroFact = i.NRO_FACTURA and D.codProd=i.CODIGO_PRODUCTO))
	INSERT INTO DETALLES
    SELECT NRO_FACTURA,CODIGO_PRODUCTO, CANTIDAD_COMPRADA, PRECIO_UNITARIO
    FROM inserted
ELSE
--Si ya existe la linea de datalles, cambiar a UPDATE para que no haya
--error de clave duplicada.
   UPDATE DETALLES
		SET cantidadComprada = I.CANTIDAD_COMPRADA,
            precioUnitario = I.PRECIO_UNITARIO
   FROM DETALLES D, inserted I
   WHERE D.nroFact = i.NRO_FACTURA and D.codProd=i.CODIGO_PRODUCTO
END


--Ahora si insertemos una fila en la vista v_DetalleFacturas
insert into v_DetalleFacturas values('004','P02','Azucar',5,'libra',1.2,6)
insert into v_DetalleFacturas values('005','P01','Arroz',10,'libra',0.5,5)
/*===========================================================================*/

/*CURSORES
Los cursores permiten realizar operaciones sobre filas individuales de una tabla o sobre
filas que resultan de una consulta.
CURSORES EN LA BASE DE DATOS DE FACTURACION
1.Crear un cursor para imprimir los valores de codigoFactura,valor Factura y fechaFactura de la tabla Facturas.

Se declaran las variables que van a recibir los valores de cada fila*/
DECLARE @nroF char(3),@valorF money,@fechaF date,@textValorF char(100)
/*
Se declara el cursor FactInfo que actuara sobre el resultado del select planteado
*/
DECLARE FactInfo CURSOR FOR SELECT nroFact,valorFact,fechaFact FROM facturas--Trabaja con el cursor  SOBRE EL RESULTADO DE ESTA CONSULTA
/*
Se abre el cursor, aqui se ejecuta la consulta y se cargan los datos al cursor
*/
OPEN FactInfo
/*
Se toma la siguiente fila del conjunto de datos del cursor y guarda los datos de
cada columna en las variables indicadas
*/
FETCH NEXT FROM FactInfo INTO @nroF,@valorF,@fechaF--Apunte a la siguiente fila de FactInfo y va a guardar
/*
Para controlar si se ha llegado al fin del conjunto de registros.
(Mientras @@fetch_status = 0 la lectura ha sido correcta)
*/
WHILE @@fetch_status=0--Es una variable de sistema, guarda un indicativo de fin de registro. 
BEGIN
/*
Se construye la frase tipo texto que se va a imprimir (Print
solo puede imprimir un texto)
*/
select @textValorF='Nro de Factura='+@nroF+space(10)+'Valor Factura='+convert(char(15),@valorF)+space(10)+
'Fecha Factura='+convert(char(10),@fechaF)
PRINT @textValorF
FETCH NEXT FROM FactInfo INTO @nroF,@valorF,@fechaF
END
/*
Para cerrar el cursor y liberar los recursos
*/
CLOSE FactInfo
/*
Para eliminar el cursor y su estructura
*/
DEALLOCATE FactInfo

/*NOTA: EL CURSOR UTILIZA LOS NUEVOS DATOS SI SE HAN ACTUALIZADO LAS FILAS LUEGO DE CREARLO
Usar el depurador para comprobarlo, realizando una ejecucion paso a paso y haciendo una
modificacion durante la ejecucion en modo de depuracion. Esto es porque por defecto el
cursor es dinamico. Si en la declaracion del cursor se especifico como estatico, es decir:

DECLARE FactInfo CURSOR STATIC FOR SELECT ...
en este caso no se reconoceran los cambios hasta que el cursor sea reabierto. Tambien se puede declarar
a un cursor KEYSET
DECLARE FactInfo CURSOR KEYSET FOR SELECT...
En este caso el cursor reconocera los cambios por update o delete, pero no las inserciones
Tambien se puede declarar un cursor FAST_FORWARD que es solo de avance y solo de lectura, lo
que lo hace muy rapido.
MOVERSE POR EL CURSOR EN FORMA NO ORDENADA
Las instrucciones FIRST, PRIOR, NEXT y LAST (en combinacion con la sentencia FETCH) 
permitiran acceder a la primera, previa,proxima y ultima fila respectivamente. Por otra parte
las opciones ABSOLUTE y RELATIVE permitiran avanzar o retroceder una cantidad determinada de registros
(en forma absoluta o relativa al registro actual) pudiendose utilizar, ademas de constantes,
variables del tipo smallint, tinyint o int para indicar la magnitud del desplazamiento.

2.
Cursor para imprimir las filas impares de la consulta utilizando la opcion RELATIVE
*/
DECLARE @nroF char(3),@valorF money, @fechaF date,@textValorF char(100),@dos int=2
DECLARE FactInfo CURSOR STATIC SCROLL FOR SELECT nroFact, valorFact,fechaFact FROM facturas
OPEN FactInfo
FETCH NEXT FROM FactInfo INTO @nroF, @valorF,@fechaF
WHILE @@fetch_status=0
BEGIN
select @textValorF ='Nro de Factura='+@nroF+space(10)+'Valor Factura='+convert(char(12),@valorF)+
space(10)+'Fecha Factura='+convert(char(10),@fechaF)
PRINT @textValorF
FETCH RELATIVE @dos FROM FactInfo INTO @nroF, @valorF,@fechaF--RELATIVE @dos desde el punto que esta el cursor salte una y coge la siguiente instruccion
END
CLOSE FactInfo
DEALLOCATE FactInfo

/*
OJO, la opcion SCROLL es por defecto, no es necesaria escribirle como en este ejemplo.

ACTUALIZACION DE DATOS EN LOS CURSORES
(Aunque no es recomendable por cuestiones de rendimiento)
Cursor dinamico.- siempre esta actualizando los valores de su consulta
c. estatico.- no toma en cuenta las nuevas filas solamente las que iniciaron con el cursor
3. Crear un cursor que actualice el valor de las facturas (todas tendran un valorFact=5)
*/
DECLARE @nroF char(3),@valorF money
DECLARE FactInfo CURSOR DYNAMIC forward_only
FOR SELECT nroFact,valorFact FROM facturas
OPEN FactInfo
FETCH NEXT FROM FactInfo INTO @nroF, @valorF
WHILE @@fetch_status=0
BEGIN
update FACTURAS set valorFact=5 where CURRENT of factInfo
FETCH NEXT FROM FactInfo INTO @nroF,@valorF
END
CLOSE FactInfo
DEALLOCATE FactInfo

select *from FACTURAS
/*
4.Crear un procedimiento almacenado que incluya un cursor para incluir un descuento de 5%
a los clientes que han comprado mas 100 dolares.

Primero se va a insertar en la tabla Clientes la columna Descuentos
*/
alter table Clientes add Descuentos dec(8,2)
select * from CLIENTES
/*
Se crea el procedimiento almacenado 
*/
create proc sp_Descuentos 
as declare ClienteDescuento cursor for 
select c.codCli,sum(valorFact) as 'Total Comprado'
from Clientes c join Facturas f on c.codCli=f.codCli
group by c.codCli
open ClienteDescuento
declare @codCli char(3),@totalFact money
fetch next from ClienteDescuento into @codCli, @totalFact
while @@fetch_status=0
begin
	if (@totalFact>100)
	begin
		update CLIENTES set Descuentos=0.05 where codCLi=@codCli
	end
	fetch next from ClienteDescuento into @codCli,@totalFact
end
close ClienteDescuento
deallocate ClienteDescuento
/*
ejecutando el PA*/
update FACTURAS set valorFact=120 where nroFact='001'
update FACTURAS set valorFact=530 where nroFact='004'
exec sp_Descuentos
select * from CLIENTES
select * from FACTURAS
exec sp_depends clientes