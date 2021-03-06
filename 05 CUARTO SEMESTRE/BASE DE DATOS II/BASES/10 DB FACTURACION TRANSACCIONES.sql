/*
ESCUELA POLITECNICA NACIONAL
ESCUELA DE FORMACION DE TECNOLOGOS
ANALISIS DE SISTEMAS INFORMATICOS
BASE DE DATOS II   GR1
TRANSACCIONES
SANCHEZ ARTEAGA FREDY VICENTE
QUITO, OCTUBRE 6 DE 2015

--TRANSACCIONES
Es un conjunto de instrucciones en SQL o en otro lenguaje persistente, que deben 
ejecutarse como una sola unidad de trabajo, o se ejecutan todas las instrucciones 
correctamente, o no se realiza ninguna.

--PROPIEDADES ACID 
Toda transaccion debe cumplir 4 propiedades conocidas como propiedades ACID: 
Atomicidad,Consistencia, Aislamiento y Durabilidad.

1: PROPIEDAD DE ATOMICIDAD.- O se realizan todas las transaccones en forma correcta 
	o no se realiza ninguna.
		DESHACER.-El sistema coloca los valores anteriores. 
		ROLLBACK.- Desacer todo los que hizo el programa determinado.
		-Es controlada por el gestor de transacciones
		
2: PROPIEDAD DE COHERENCIA O CONSISTENCIA.-No es controlada por el SO son producidas 
	por fallas del programador.
	-Es controlada por el progranador
	
3: PROPIEDAD DE AISLAMIENTO.- La transaccion T1 y T2 deben mostrar los mismos resultados 
	al ejecutarse concurrentemente o individualmente.
	-Es controlada por el gestor de concurrencia.
	
4: PROPIEDAD DE DURABILIDAD.- Luego que una transaccion se ejecuta los cambios realizados
	por esa transaccion permanecen en el tiempo. 
	-Es controlada por el subsitema de recuperacion de la base de datos.

	1, 3 y 4 Son modulos del sistema de SQL.
	
*CONCURRENCIA.- Es un sistema donde se ejecutan varias transacciones al mismo tiempo, 
	es decir trabaja con los mismos datos al mismo tiempo.
	
EJEMPLO

En la base de datos FACTURACION una transaccion es cuando un cliente compra varios
productos y se emite una factura. El proceso a seguir es el siguiente:

1. Consultar si el cliente ya esta registrado como tal en la base de datos.*/

use FACTURACION
go
select * from CLIENTES where nombreCli='Jose' and apellidoCli='Ayala'

--2. Si esta registrado como cliente, se crea una factura para dicho cliente
select * from FACTURAS

insert into FACTURAS values('022',0,GETDATE(),'C01')

--3.Insertar en la tabla Detalles los productos que va a comprar y su cantidad

select * from CLIENTES
select * from FACTURAS 
select * from PRODUCTOS
select * from DETALLES

insert into DETALLES values('022','P01',10,0.90)

--4.Cada vez que se inserta una fila en la tabla Detalles, se incrementa el 
--valorFactura en este caso valorFactura=valorFactura+cantidadComprada*precioUnitario

update FACTURAS set valorFact=valorFact+10*0.90
where nroFact='022'

--5. Cada vez que se inserta una fila en Detalles, se debe disminuir el stock 
--del producto que se esta vendiendo

update PRODUCTOS set cantidadStock=cantidadStock-10
where codProd='P01'

--Hasta aqui la transaccion
--Primero debemos deshabilitar los triggers
exec sp_helptrigger detalles

alter table Detalles disable trigger tr_ActualizaFacturaStock,tr_BorraDetalle,tr_ActualizacionDetalles

--Crear una transaccion que agrupe a todas las instrucciones como una sola 
--unidad de trabajo.
--Primero vamos a ver una forma que ya no se utiliza pero que en ciertos casos 
--podemos utilizar

DECLARE @Error int
begin transaction
	if not exists(select * from CLIENTES where nombreCli='Jose' and apellidoCli='Ayala')
	insert into CLIENTES values ('C01','Jose','Ayala','099678202',null)
	--En la variable de sistema @@ERROR se guarda un valor diferente de 0 si 
	--se produce un error.
	SET @Error=@@ERROR--@@ERROR es un numero diferente de CERO.
	IF(@Error<>0) GOTO TratarError
	insert into FACTURAS values('027',0,'2015-10-01','C01')
	SET @Error=@@ERROR
	IF(@Error<>0)GOTO TratarError
	insert into DETALLES values('027','P01',10,1)
	update FACTURAS set valorFact=valorFact+10*0.9 where nroFact='027'
	update PRODUCTOS set cantidadStock=cantidadStock-10 where codProd='P01'
commit transaction

TratarError:If @@Error!=0
BEGIN
	PRINT 'Ha Ocurrido un error. Abortamos la transaccion'
	ROLLBACK TRANSACTION
END


--Se crea una restriccion para que la fecha de factura sea menor o igual 
--que la fecha actual
alter table Facturas
add constraint ck_fechaFactura
check(fechaFact<=getdate())

--OTRA FORMA que es la que mas se utiliza, con un bloque try y un bloque catch
BEGIN TRY
BEGIN TRANSACTION
	if not exists(select * from CLIENTES where nombreCli='Patricio' 
	and apellidoCli='Bossano')
	insert into CLIENTES values ('C22','Patricio','Bossano','099678202')
	insert into FACTURAS values('030',0,'15-06-2016','C22')--Esta colocado Error 15-05-2016 CHECK
	insert into DETALLES values('030','P01',5,1.2)
	update FACTURAS set valorFact=valorFact+5*1.2 where nroFact='030'
	update PRODUCTOS set cantidadStock=cantidadStock-5 where codProd='P01'
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	RAISERROR('Error en creacion de Factura, revisar',16,1)
	RETURN
END CATCH

