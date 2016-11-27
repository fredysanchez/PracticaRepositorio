--Procedimientos alamacenados 
--son grupos de instrucciones en sql que se ejecutan como un todo
--por ejemplocundo como mucha frecuiencia queremos hacer una consulta
--que tengan cierto grado e complejidad
--exite el problema que ewl sistema siempre tiene que estarle compilando y ejecutando
--y si varios usuarios lo hacen 
--mejor es que sea compilado bajo un nombre que se guarda en el sevidor
--se ahorra asi tiempo y rendimiento en el sistema
--PROCEDIMENTOS ALMACENADOS
--para insertar en la base de datos de facturacion
use Facturacion
select * from CLIENTES
inser into clientes values ('C04','Juan','Cevallor','098819102')


---si o hacemnos como PROCEDIMENTO ALMACENADO
CREATE proc sp_insert_Clientes
@cod char (3),
@nom varchar (100),
@ape varchar (100),
@tel char (9)
as 
insert into CLIENTES values (@cod, @nom ,@ape, @tel)

exec sp_insert_Clientes 'C05','Ana','Torres','0892745793'
select * from CLIENTES
exec sp_insert_Clientes 'C06','Manuel','Piedra','092745793'


CREATE proc sp_insert_Facturas
@nroFa char (3),
@val money ,
@fec date,
@cli char (3)
as 
insert into CLIENTES values (@nroFa ,@val,@fec,@cli)
select * from Facturas 
exec sp_insert_Facturas '005',0,'2011-04-01','C03'
exec sp_insert_Facturas '006',0,'2011-04-01','C04'
select * from FACTURAS 
exec sp_insert_Facturas '007',0,'2011-04-02','C05'
exec sp_insert_Facturas '008',0,'2011-05-01','C03'
exec sp_insert_Facturas '009',0,'2011-06-02','C06'
exec sp_insert_Facturas '010',0,'2011-06-01','C06'


CREATE proc sp_insert_Productos
@cod char (3),
@nom varchar(100) ,
@uni varchar (50),
@stock dec (8,2),
@prec money
as 
insert into PRODUCTOS values (@cod ,@nom,@uni,@stock,@prec)
select * from PRODUCTOS 
exec sp_insert_Productos 'P05','Carne','libra',50,2.50
exec sp_insert_Productos 'P06','Tomate','libra',200,0.5
exec sp_insert_Productos 'P07','Huevos','unidad',200,0.1

select * from PRODUCTOS




exec sp_insert_Detalles '002','p01',10,0.80

select * from DETALLES

select * from FACTURAS 

select * from PRODUCTOS

---procedimiento almacenado de actualizacion 
create proc sp_update_Detalles
@nroF char(3),
@codP char (3),
@cant dec(8,2),
@prec money
as
update DETALLES set cantidadComprada=@cant,precioUnitario=@prec
where nroFact = @nroF and codProd=@codP

--PROBAR EL PROC ALM
EXEC SP_UPDATE_DETALLES '001','P01',5,0.80
EXEC SP_UPDATE_DETALLES '002','P02',10,0.20



---CREACION DE UN PROC ALMAC PARA BORRADO DE FILAS DETALLES
create proc sp_delete_detalles
@nroF char (3),
@codP char (3)

as delete DETALLES where nroFact =@nroF and codProd = @codP

---PROBANODO EL TRIOGER Y EL PROC ALMAC

EXEC sp_delete_detalles '001','P01'
EXEC sp_delete_detalles '006','P07'


-------ejemplos SE DESEA CONOCER CUANTO ES EL VALOR ACTUAL DEL STOCK

select SUM (cantidadStock*precioUnitarioActual)from PRODUCTOS

---SI QUEREMOS HACER ESTA CONSULTA REPETIDAMENTE PODEMOS HACER UN PROC ALMACENADO
-*---sp para cacular el valor total del stock
CREATE PROC sp_valorStock
as
select SUM (cantidadStock*precioUnitarioActual)from PRODUCTOS


--probar el sp
exec sp_valorStock

---DETERMINAR CUANTO A COPMPRADO CADA CLIENTE , QUE APARESCA NOMBRE Y APELLIDO DEL CLIENTE Y A UN LADO EL TOTAL

SELECT * FROM CLIENTES
select * from FACTURAS 

select * from DETALLES
select * from FACTURAS 
select * from PRODUCTOS

CREATE PROC sp_CompraClient11
as
select (valorFact)from FACTURAS
where codCLi = 'C01'


exec sp_CompraClient11










