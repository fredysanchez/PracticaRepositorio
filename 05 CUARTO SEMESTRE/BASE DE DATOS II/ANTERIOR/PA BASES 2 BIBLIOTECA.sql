/* TRABAJO EN CLASE 27 SEPTIEMBRE

SP PARA DETERMINAR EL TOTAL DE DOLARES COMPRADO POR EL CLIENTE */

SELECT CLIENTES.nombreCli, CLIENTES.apellidoCli, SUM (FACTURAS.valorFact)AS 'TOTAL COMPRADO'
FROM CLIENTES INNER JOIN FACTURAS
on CLIENTES


----procedimientos almacenados CON VALORES POR DEFECTO
}--TOTAL DE  VENTAS POR PRODUCTO

CREATE PROC sp_ventasPorProducto 
@prod varchar (100)= 'Arroz'
as
select SUM (cantidadComprada)from PRODUCTOS p join DETALLES d
on p.codProd = d.codProd
where nombreProd =@prod
}--PRUEBA
exec sp_ventasPorProducto --Por defecto el producto es arroz

exec sp_ventasPorProducto 'Azucar'

select * from FACTURAS
select * from DETALLES
select * from PRODUCTOS
select * from CLIENTES

--procedimientos almacenados con parametros de salida
--este es un procedimiento q ingresemos el mes y año como parametro de entrada y 
--se obtena el total de ventas de este periodo como parametro de salida
create proc sp_VentaPorMes1
@mes int,
@año int,
@totalVenta money output  --indicamos q es un parametro de salida
as
set @totalVenta = (select  SUM (cantidadComprada*precioUnitario)from FACTURAS f
join DETALLES d on f.nroFact =d.nroFact
where MONTH (fechaFact)=@mes and YEAR(fechaFact)=@año)



declare @salida money
exec sp_ventasPorMes1 '03','2011',@salida output
select 'El valor de venta es ',@salida

---PARA BORRAR EL SP
DROP PROCEDURE sp_ventasPorMes
---hacer procedimientos almacenados sobre la BDD BIBLIOTECA
