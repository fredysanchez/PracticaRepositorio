/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  TRIGGERS Y PROCESOS ALMACENADOS
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 6 DE 2015*/
  
--BASE DE DATOS FACTURACION
--a.- TRIGGERS
--b.- PROCEDIMIENTOS ALMACENADOS
CREATE DATABASE BDFACTURACION
GO
USE BDFACTURACION
GO 
CREATE TABLE CLIENTES (
	codCLi char(3) PRIMARY KEY,
	nombreCli varchar(100),
	apellidoCli varchar(100),
	telefCli char(9)
)

--En la BD de Facturación crear el atributo tipoFactura en la tabla Facturas, 
--que puede recibir dos datos: contado o crédito.
CREATE TABLE FACTURAS (
	nroFact char(3) PRIMARY KEY,
	valorFact money default 0,
	fechaFact date,
	codCLi char(3),
	FOREIGN KEY(codCLi) REFERENCES CLIENTES (codCLi),
	tipoFactura VARCHAR(10)not null CHECK (tipoFactura='Credito' or tipoFactura='Contado')
)


CREATE TABLE PRODUCTOS (
	codProd char(3) PRIMARY KEY,
	nombreProd varchar(100),
	unidades varchar(50),
	cantidadStock dec(8,2),
	precioUnitarioActual money
)

CREATE TABLE DETALLES (
	nroFact char(3) not null,
	codProd char(3) not null,
	cantidadComprada dec(8,2),
	precioUnitario money,
	FOREIGN KEY(nroFact) REFERENCES FACTURAS (nroFact)
)

ALTER TABLE DETALLES ADD PRIMARY KEY(nroFact,codProd)
ALTER TABLE DETALLES ADD FOREIGN KEY(codProd) REFERENCES PRODUCTOS (codProd)

--Crear la tabla Créditos con atributos: codigoCrédito, fechaCrédito, CantidadCrédito, codCli. 
--Clave primaria codigoCrédito y es autoincrementable. 
--El atributo codCli es clave foránea que relaciona a las tablas Créditos y Clientes.
CREATE TABLE CREDITOS(
	codigoCredito int identity(1,1) not null PRIMARY KEY,
	fechaCredito date,
	cantidadCredito money,
	codCli char(3) not null,
	FOREIGN KEY (codCli) REFERENCES CLIENTES (codCli)
)
/*=============== TRIGGERS REALIZADOS EN CLASE ==============*/

--Trigger actualiza stock al ingresar en la tabla detalles
Create trigger tr_ActualizaFacturaStock
on DETALLES after insert
as
declare @numfact char(3), 
		@codProd char(3), 
		@cantComprada decimal(8,2), 
		@precUnit money
select	@numfact=inserted.nroFact,@codProd=inserted.codProd,@cantComprada=inserted.cantidadComprada,
		@precUnit=inserted.precioUnitario from inserted
update	FACTURAS set valorFact=valorFact+@cantComprada*@precUnit
where	nroFact=@numfact
update	PRODUCTOS set cantidadStock=cantidadStock-@cantComprada
where	codProd=@codProd
--Trigger actualiza stock al eliminar en la tabla detalles
Create trigger tr_BorraDetalle
on DETALLES after delete
as
declare @numfact char(3),
		@codProd char(3), 
		@cantComprada decimal(8,2), 
		@precUnit money
select	@numfact=deleted.nroFact,@codProd=deleted.codProd,@cantComprada=deleted.cantidadComprada,
		@precUnit=deleted.precioUnitario from deleted
update	FACTURAS set valorFact=valorFact-@cantComprada*@precUnit
where	nroFact=@numfact
update	PRODUCTOS set cantidadStock=cantidadStock+@cantComprada
where	codProd=@codProd
--Trigger actualiza stock al actualizar en la tabla detalles
Create trigger tr_ActualizacionDetalles
on DETALLES after update
as
declare @numfact char(3), 
		@codProd char(3),
		@cantComprada decimal(8,2), 
		@precUnit money
select	@numfact=deleted.nroFact,@codProd=deleted.codProd,@cantComprada=deleted.cantidadComprada,
		@precUnit=deleted.precioUnitario from deleted

declare @cantCompradai decimal(8,2), 
		@precUniti money
select	@cantCompradai=inserted.cantidadComprada,
		@precUniti=inserted.precioUnitario from inserted

update	FACTURAS set valorFact=valorFact-@cantComprada*@precUnit+@cantCompradai*@precUniti
where	nroFact=@numfact
update	PRODUCTOS set cantidadStock=cantidadStock+@cantComprada-@cantCompradai
where	codProd=@codProd

/*===================== INSERTAR DATOS ==================*/

insert into CLIENTES values('C01','Jose','Ayala','092345678')
insert into CLIENTES values('C02','Maria','Paredes','062456789')
insert into CLIENTES values('C03','Marta','Ortega',null)

insert into FACTURAS values('001',default,'2011-03-23','C01','Credito')
insert into FACTURAS values('002',default,'2011-03-24','C01','Contado')
insert into FACTURAS values('003',default,'2011-03-23','C02','Contado')
insert into FACTURAS values('004',default,'2011-03-25','C02','Credito')

insert into PRODUCTOS values('P01','Arroz','libra',300,0.90)
insert into PRODUCTOS values('P02','Azucar','libra',100,1.20)
insert into PRODUCTOS values('P03','Aceite','litro',50,2.80)
insert into PRODUCTOS values('P04','Atun','lata de 500 gramos',300,1.20)

insert into DETALLES values ('001','P01',5,0.85)
insert into DETALLES values ('001','P03',4,2.5)
insert into DETALLES values ('002','P01',7,0.90)
insert into DETALLES values ('002','P02',2,1.20)

--Sp Selecciones
Create proc sp_Selecciones
as
	select *from dbo.CLIENTES
	select *from dbo.FACTURAS
	select *from dbo.PRODUCTOS
	select *from dbo.DETALLES
	select *from dbo.CREDITOS
	
exec sp_Selecciones

/*=============== TAREA 2: TRIGGERS Y PA EN BD FACTURACION ==============*/
--PARTE 1
--TRIGGER SOBRE LA BASE DE DATOS FACTURACION
/*Crear un trigger que cada vez que se inserte una fila en Facturas y el tipoFactura sea "crédito",
  si no existe aún un crédito para el Cliente de esa factura, se inserte una fila en Créditos, 
  con la fecha y cantidad de la Factura ingresada. Si el cliente ya tiene un crédito, 
  aumentar el valor de la factura ingresada a cantidadCrédito de la fila correspondiente de la tabla Créditos.*/
Create trigger tr_ActualizarCreditos
on FACTURAS after insert
as
declare @_valorFact money,
		@_fechaFact date,
		@_codCli char (3),
		@_tipoFactura char(10)
		
select  @_valorFact=inserted.valorFact,
		@_fechaFact=inserted.fechaFact,
		@_codCli=inserted.codCLi,
		@_tipoFactura=inserted.tipoFactura 
		from inserted
		
if exists(select c.codCli,i.nroFact from CREDITOS c, INSERTED I 
		  where	c.codCli=I.codCLi and fechaCredito=I.fechaFact)
begin	
update	CREDITOS set cantidadCredito = cantidadCredito+@_valorFact
where	(fechaCredito=@_fechaFact and codCli=@_codCli and @_tipoFactura='Credito')
end		
else
begin
insert	into CREDITOS select @_fechaFact,@_valorFact,@_codCli where @_tipoFactura='Credito'
end
		
--Prueba del Trigger
insert into FACTURAS values('005',4000,'2012-04-23','C01','Contado')
insert into FACTURAS values('006',1200,'2012-02-25','C02','Credito')

exec sp_Selecciones

--PA SOBRE LA BASE DE DATOS FACTURACION
/*Crear un PA para que ingresando como parámetro el nombre de un producto imprima el número de factura 
  y la cantidad que se compró de ese producto en cada factura.*/
Create  proc sp_InformacionProducto @_nombreProd varchar(100)
as
select  Producto=p.nombreProd,NroFactura=f.nroFact,CantidadComprada=d.cantidadComprada 
		from FACTURAS f inner join DETALLES d 
		on f.nroFact=d.nroFact inner join PRODUCTOS p on p.codProd = d.codProd
where	@_nombreProd=p.nombreProd


--Prueba del PA
exec sp_InformacionProducto 'Arroz'
exec sp_InformacionProducto 'Aceite'

exec sp_Selecciones

--PARTE 2
/*En la BD de Facturación original se quiere hacer un descuento del 5 por ciento a los clientes 
  que tienen facturas con un valor mayor de 100 dólares, y 10 por ciento a los clientes que 
  tienen facturas mayores que 200. Para esto se debe crear una nueva columna en la tabla CLIENTES 
  llamada "DESCUENTO", con un valor por defecto 0. Cuando un cliente tenga una factura de un valor 
  mayor a 100 dólares el descuento para ese cliente debe cambiar a 0.05, y cuando un cliente tenga una factura 
  con valor mayor que 200, el descuento para ese cliente debe cambiar a 0.10.
  Crear la nueva columna y el trigger correspondiente.*/
--Añadir la columna descuento.
ALTER TABLE CLIENTES ADD descuento decimal(8,2) null default 0
--Actualizaciones
UPDATE CLIENTES  set  descuento=0 where codCLi='C01'
UPDATE CLIENTES  set  descuento=0 where codCLi='C02'
UPDATE CLIENTES  set  descuento=0 where codCLi='C03'

exec sp_Selecciones

--Crear el Trigger correspondiente.
Create  trigger tr_ActualizaDescuento
on FACTURAS after insert
as
declare @_nroFact char(3),
		@_valorFact money,
		@_fechaFact date,
		@_codCli char (3)
		
select  @_nroFact=inserted.nroFact,
		@_valorFact=inserted.valorFact,
		@_fechaFact=inserted.fechaFact,
		@_codCli=inserted.codCLi
		from inserted
 if exists((select valorFact from FACTURAS where codCLi=@_codCli and  valorFact>100 and valorFact<199))
 begin
	update CLIENTES set descuento=0.05 where @_codCli=codCLi
 end
 else if exists((select valorFact from FACTURAS where codCLi=@_codCli and valorFact>200))
 begin
	update CLIENTES set descuento=0.10 where @_codCli=codCLi
 end
 
 insert into FACTURAS values('007',2000,'2011-03-23','C02','Contado')

 exec sp_Selecciones
 
/*Crear un PA que ingresando como parámetros nombre y apellido de un cliente, despliegue los nombres 
  de los productos que han comprado ese cliente. Si ese cliente no ha comprado nada, 
  debe aparecer un mensaje "ESTE CLIENTE NO HA REALIZADO COMPRAS"*/

Create proc sp_ProductosCompradosCliente
@nombre varchar(100),
@apellido varchar(100)
as
if  (select sum(valorFact) from FACTURAS f ,CLIENTES c
	 where f.codCLi=C.codCLi and @nombre=nombreCli and @apellido=apellidoCli)>0.00
	begin
		select distinct nombreProd,Total=SUM(d.cantidadComprada) 
		from PRODUCTOS p inner join
		DETALLES d on p.codProd=d.codProd inner join
		FACTURAS f on f.nroFact=d.nroFact inner join
		CLIENTES c on c.codCLi=f.codCLi
		group by nombreProd
	end
else 
	begin
		print 'ESTE CLIENTE NO HA REALIZADO COMPRAS'
	end

--Prueba del PA
exec sp_ProductosCompradosCliente 'Jose','Ayala'

exec sp_ProductosCompradosCliente 'Betty','Loor'

exec sp_Selecciones
 
 
 
