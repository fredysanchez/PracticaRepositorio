/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  TRIGGERS Y PROCESOS ALMACENADOS
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 5 DE 2015*/
  
--BASE DE DATOS REPORTE DE VENTAS
--a.- TRIGGERS
--b.- PROCEDIMIENTOS ALMACENADOS

--Creacion y uso de la base de datos.
CREATE DATABASE REPORTEVENTAS
GO
USE REPORTEVENTAS
GO

--Creacion de las tablas.
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

--Inserccion de datos.
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

--PA SELECCIONES
	create procedure sp_Selecciones
	as
		select *from dbo.CLIENTES
		select *from dbo.VENDEDORES
		select *from dbo.VENTAS
		select *from dbo.VENTASMENSUALES

	exec sp_Selecciones

/*DEBER: EJERCICIOS DE APLICACION ** FECHA:2015-10-05*/

--TRIGGERS SOBRE LA BD REPORTE DE VENTAS

/* 1.- Crear un trigger que cada vez que se inserte una fila en la tabla VENTAS,
       se acumule el valor de la venta en el total de ventas mensuales
       para el vendedor que realiza la venta.*/
	create trigger tr_ActTotalVentasMensuales
	on VENTAS after insert
	as
	declare @_ventaCodigo char(3), @_ventaFecha date, @_ventaMonto money, @_clienteCodigo char(3), 
	        @_vendedorCodigo char(3)
	select  @_ventaCodigo=inserted.ventaCodigo,@_ventaFecha=inserted.ventaFecha,@_ventaMonto=inserted.ventaMonto, 
	        @_clienteCodigo=inserted.clienteCodigo, @_vendedorCodigo=inserted.vendedorCodigo from inserted
	        if exixts
	update  VENTASMENSUALES set totalVentas=totalVentas+@_ventaMonto
	where   @_vendedorCodigo=vendedorCodigo and MONTH(@_ventaFecha)=mes and YEAR(@_ventaFecha)=año

	insert into VENTAS values('vt6','2012-1-04',2000,'c02','v01')
	
	exec sp_Selecciones
  
/* 2.- Crear un trigger que cuando se borre una fila de la tabla VENTAS,
       se descuente el valor de esa venta de la tabla VENTAS MENSUALES  
       en el mes que corresponda.*/
	create trigger tr_DelTotalVentasMensuales
	on VENTAS after delete
	as
	declare @_ventaCodigo char(3), @_ventaFecha date, @_ventaMonto money, @_clienteCodigo char(3), 
	        @_vendedorCodigo char(3)
	select  @_ventaCodigo=deleted.ventaCodigo,@_ventaFecha=deleted.ventaFecha,@_ventaMonto=deleted.ventaMonto, 
	        @_clienteCodigo=deleted.clienteCodigo, @_vendedorCodigo=deleted.vendedorCodigo from deleted
	update  VENTASMENSUALES set totalVentas=totalVentas-@_ventaMonto
	where   @_vendedorCodigo=vendedorCodigo and MONTH(@_ventaFecha)=mes and YEAR(@_ventaFecha)=año

	delete from VENTAS where ventaCodigo='vt5'
	
	exec sp_Selecciones
       
/* 3.- Crear un trigger que cuando se actualice una fila de la tabla VENTAS,
       se modifique el valor de esa venta de la tabla VENTAS MENSUALES 
       en el mes que corresponda.*/
    create trigger tr_UpTotalVentasMensuales
	on VENTAS after update
	as
	declare @_ventaCodigo char(3), @_ventaFecha date, @_ventaMonto money, @_clienteCodigo char(3), 
	        @_vendedorCodigo char(3)
	select  @_ventaCodigo=deleted.ventaCodigo,@_ventaFecha=deleted.ventaFecha,@_ventaMonto=deleted.ventaMonto, 
	        @_clienteCodigo=deleted.clienteCodigo, @_vendedorCodigo=deleted.vendedorCodigo from deleted
	
	declare @_ventaMontoi money
	select  @_ventaMontoi=inserted.ventaMonto from inserted
	
    update  VENTASMENSUALES set totalVentas=totalVentas-@_ventaMonto+ @_ventaMontoi
	where   @_vendedorCodigo=vendedorCodigo and MONTH(@_ventaFecha)=mes and YEAR(@_ventaFecha)=año
	
	update  VENTAS set ventaMonto=8000 where ventaCodigo='vt1'

	exec sp_Selecciones
	
--PROCEDIMIENTOS ALMACENDOS SOBRE LA BD REPORTE DE VENTAS

/* 1.- Crear un PA que reciba como parámetro el nombre de un vendedor y 
	   despliegue el total de ventas que ha realizado.*/
	create proc sp_TotalVentasVendedor @_vendedorNombre varchar(100)
	as
	select TotalVentas=count(ventaCodigo),vendedorApellido, vendedorNombre  from  VENDEDORES v inner join VENTAS ve 
		 on v.vendedorCodigo=ve.vendedorCodigo
	where  v.vendedorNombre=@_vendedorNombre
	group  by vendedorApellido, vendedorNombre 

	exec sp_TotalVentasVendedor 'Luis'
	exec sp_TotalVentasVendedor 'Ana'

	exec sp_Selecciones
	
	create proc sp_TotalVentasVendedor1 @_vendedorNombre varchar(100)
	as
	select distinct v.vendedorNombre, v.vendedorApellido, TotalVEntas=SUM(totalVentas)  
	FROM VENTASMENSUALES vm inner join VENDEDORES v on vm.vendedorCodigo=v.vendedorCodigo
	where vendedorNombre = @_vendedorNombre 
	GROUP BY vendedorNombre,vendedorApellido
	
	exec sp_TotalVentasVendedor1 'Luis'
	exec sp_TotalVentasVendedor1 'Ana'
  
/* 2.- Crear un PA que despliegue el total de ventas realizado por todos los vendedores en un mes
       y un año que se reciben como parámetros.*/
	create  proc sp_TotalVentasMes @_mes int, @_año int
	as 
	select TotalVentas=count(*),Mes=MONTH(ventaFecha),Año=YEAR(ventaFecha) from  VENTAS 
	where  MONTH(ventaFecha)= @_mes and YEAR(ventaFecha)= @_año
	group  by MONTH(ventaFecha),YEAR(ventaFecha)

	exec sp_TotalVentasMes 12,2011
	exec sp_TotalVentasMes 1,2012
	
	create  proc sp_TotalVentasMes1 @_mes int, @_año int
	as 
	select distinct v.vendedorNombre,v.vendedorApellido, TotalVentas=SUM(totalVentas)  
	from VENTASMENSUALES vm inner join VENDEDORES v on vm.vendedorCodigo=v.vendedorCodigo
	where mes= @_mes and año=@_año
	group  by vendedorNombre,vendedorApellido

	exec sp_TotalVentasMes1 12,2011
	exec sp_TotalVentasMes1 1,2012
	
    
/* 3.- Crear un PA que despliegue el nombre del vendedor, la fecha y el monto de todas las compras
       realizadas por un cliente cuyo nombre se recibe como parámetro.*/
	create proc sp_CienteDatos @_clienteNombre varchar (100)
	as
	select clienteNombre, vendedorNombre, vendedorApellido ,ventaFecha,ventaMonto from  CLIENTES c inner join VENTAS ve
	on c.clienteCodigo=ve.clienteCodigo inner join VENDEDORES v on  v.vendedorCodigo =ve.vendedorCodigo
	where  c.clienteNombre=@_clienteNombre 

	exec sp_CienteDatos 'ABC'
	exec sp_CienteDatos 'XYZ'
	exec sp_CienteDatos 'RST'

	exec sp_Selecciones