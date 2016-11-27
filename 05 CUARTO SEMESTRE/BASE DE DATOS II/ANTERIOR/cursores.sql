---03/Octubre/2007
/*CURSORES*/



--se declara el cursor FactIn

SET LANGUAGE SPANISH


--CURSORES
--Los cursores permiten realizar operaciones sobre filas individuales de una tabla o sobre
--filas que resultan de una consulta.
/**********************CURSORES EN LA BASE DE DATOS FACTURACIÓN**********************/
--select * from Facturas
--Crear un cursor para imprimir los valores de codigoFactura, valor Factura y
--fechaFactura de la tabla Facturas
--se declaran las variables que van a recibir los valores de cada fila
DECLARE @nroF char(3),@valorF money, @fechaF date, @textValorF char(100)
--Se declara el cursor FactInfo que actuará sobre el resultado del select planteado
DECLARE FactInfo CURSOR FOR SELECT nroFact,valorFact,fechaFact FROM facturas
--Se abre el cursor, aqui se ejecuta la consulta y se cargan los datos al cursor
OPEN FactInfo
--Se toma la siguiente fila del conjunto de datos del cursor y guarda los datos de
--cada columna en las variables indicadas
FETCH NEXT FROM FactInfo INTO @nroF,@valorF,@fechaF
--Para controlar si se ha llegado al fin del conjunto de registros
--(Mientras @@fetch_status = 0 la lectura ha sido correcta)
WHILE @@fetch_status = 0
BEGIN
--Se construye la frase tipo texto que se va a imprimir (Print solo puede imprimir un texto)
select @textValorF='Nro de Factura='+@nroF+space(10)+'Valor Factura='+
convert(char(6),@valorF)+space(10)+'Fecha Factura='+convert(char(10),@fechaF)
PRINT @textValorF
FETCH NEXT FROM FactInfo INTO @nroF,@valorF,@fechaF
END
--Para cerrar el cursor y liberar los recursos
CLOSE FactInfo
--Para eliminar el cursor y su estructura
DEALLOCATE FactInfo
--EL CURSOR UTILIZA LOS NUEVOS DATOS SI SE HAN ACTUALIZADO LAS FILAS LUEGO DE CREARLO
--Usar el depurador para comprobarlo, realizando una ejecucion paso a paso y haciendo una
--modificacion durante la ejecucion en modo de depuracion. Esto es porque por defecto el
--cursor es dinamico. Si en la declaracion del cursor se especifico como estatico, es decir
DECLARE FactInfo CURSOR STATIC FOR SELECT ...
--en este caso no se reconoceran los cambios hasta que el cursor sea reabierto.
--Tambien se puede declarar a un cursor KEYSET
DECLARE FactInfo CURSOR KEYSET FOR SELECT...
--En este caso el cursor reconocera los cambios por update o delete, pero no las inserciones
--Tambien se puede declarar un cursor FAST_FORWARD que es solo de avance y solo de lectura, lo que
--lo hace muy rapido.
--MOVERSE POR EL CURSOR EN FORMA NO ORDENADA
--las instrucciones FIRST, PRIOR, NEXT y LAST (en combinación con la sentencia FETCH)
--perimitirán acceder a la primera, previa, próxima y última fila respectivamente. Por otra parte
--las opciones ABSOLUTE y RELATIVE permitirán avanzar o retroceder una cantidad determinada de registros
--(en forma absoluta o relativa al registro actual) pudiéndose utilizar, además de constantes, variables
--del tipo smallint, tinyint o int para indicar la magnitud del desplazamiento.

DECLARE @nroF char(3),@valorF money, @fechaF date, @textValorF char(100),@dos int=2
DECLARE FactInfo CURSOR STATIC SCROLL FOR SELECT nroFact,valorFact,fechaFact FROM facturas
OPEN FactInfo
FETCH NEXT FROM FactInfo INTO @nroF,@valorF,@fechaF
WHILE @@fetch_status = 0
BEGIN
select @textValorF='Nro de Factura='+@nroF+space(10)+'Valor Factura='+convert(char(6),@valorF)+
space(10)+'Fecha Factura='+convert(char(10),@fechaF)
PRINT @textValorF
FETCH RELATIVE @dos FROM FactInfo INTO @nroF,@valorF,@fechaF
END
CLOSE FactInfo
DEALLOCATE FactInfo
--OJO, la opcion SCROLL es por defecto, no es necesaria escribirle como en este ejemplo.
--ACTUALIZACION DE DATOS EN LOS CURSORES (Aunque no es recomendable por cuestiones de rendimiento)
DECLARE @nroF char(3),@valorF money
DECLARE FactInfo CURSOR DYNAMIC forward_only FOR SELECT nroFact,valorFact FROM facturas
OPEN FactInfo
FETCH NEXT FROM FactInfo INTO @nroF,@valorF
WHILE @@fetch_status = 0
BEGIN
update FACTURAS set valorFact=20 where nroFact=@nroF
FETCH NEXT FROM FactInfo INTO @nroF,@valorF
END
CLOSE FactInfo
DEALLOCATE FactInfo
--OTRA FORMA
DECLARE @nroF char(3),@valorF money
DECLARE FactInfo CURSOR DYNAMIC forward_only FOR SELECT nroFact,valorFact FROM facturas
OPEN FactInfo
FETCH NEXT FROM FactInfo INTO @nroF,@valorF
WHILE @@fetch_status = 0
BEGIN
update FACTURAS set valorFact=5 where CURRENT of factInfo
FETCH NEXT FROM FactInfo INTO @nroF,@valorF
END
CLOSE FactInfo
DEALLOCATE FactInfo

--CREAR UN PROCEDIMIENTO ALMACENADO QUE INCLUYA UN CURSOR PARA INCLUIR UN DESCUENTO DE 5%
--A LOS CLIENTES QUE HAN COMPRADO MAS 100 DOLARES
--Primero se va a insertar en la tabla Clientes la columna Descuentos
alter table Clientes add Descuentos dec(8,2)
select * from CLIENTES


create proc sp_Descuentos
as
declare ClienteDescuento cursor
for
select c.codCli,sum(valorFact) as 'Total Comprado'--sobre esta consulta va a trabajar el cursor
from Clientes c join Facturas f
on c.codCli=f.codCli
group by c.codCli


open ClienteDescuento
declare @codCli char(3), @totalFact money
fetch next from ClienteDescuento into @codCli,@totalFact
while @@fetch_status = 0   ---mientras el fetch sea igual a cero haga lo siguiente
begin
if(@totalFact>100)---si total factura >100
begin
update CLIENTES set Descuentos=0.05 where codCLi=@codCli   ---actuliza clientes 
end
fetch next from ClienteDescuento into @codCli,@totalFact
end
close ClienteDescuento

deallocate ClienteDescuento

exec sp_Descuentos


select * from CLIENTES
select * from FACTURAS



update FACTURAS set valorFact=80 where nroFact ='002'

update FACTURAS set valorFact=50 where nroFact = ''