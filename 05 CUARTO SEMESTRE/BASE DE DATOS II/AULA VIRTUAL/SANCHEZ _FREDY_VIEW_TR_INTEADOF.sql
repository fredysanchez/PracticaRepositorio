/*ESCUELA POLITECNICA NACIONAL
  ESCUELA DE FORMACION DE TECNOLOGOS
  ANALISIS DE SISTEMAS INFORMATICOS
  BASE DE DATOS II   GR1
  VIEW - TRIGGER INSTEAD OF
  SANCHEZ ARTEAGA FREDY VICENTE
  QUITO, OCTUBRE 6 DE 2015*/
  
--BASE DE DATOS REPORTE DE VENTAS
/*En la Base de datos REPORTEVENTAS, CREAR UNA VISTA QUE DESPLIEGUE EL CÓDIGO DE CADA CLIENTE JUNTO CON SU NOMBRE, 
  Y TODOS LOS DATOS DE CADA COMPRA REALIZADA POR CADA CLIENTE. 
  Luego, crear un trigger INSTEAD OF para que permita la inserción a través de la vista.*/
  create view v_Clientes
  as
  select  Codigo_Cliente=c.clienteCodigo, Nombre_Cliente=c.clienteNombre, v.*
		  from CLIENTES c inner join VENTAS v on  c.clienteCodigo=v.clienteCodigo
  
  select *from v_Clientes
  
  --Crear un trigger instead of para poder insertar filas en la vista v_Clientes
alter TRIGGER tr_insercionV_Clientes ON v_Clientes
INSTEAD OF INSERT
AS
BEGIN
SET NOCOUNT ON
--Si no existe el producto, debe insertarse en la tabla Productos
IF (NOT EXISTS (SELECT p.clienteCodigo
    FROM CLIENTES P, inserted I
    WHERE P.clienteCodigo = I.Codigo_Cliente))
	INSERT INTO CLIENTES
    SELECT Codigo_Cliente,Nombre_Cliente
    FROM inserted
ELSE
   PRINT 'YA EXISTE EL PRODUCTO'
IF (NOT EXISTS (SELECT D.ventaCodigo, D.ventaMonto
    FROM VENTAS D, inserted i
    WHERE D.clienteCodigo = i.Codigo_Cliente and D.clienteCodigo=i.clienteCodigo))
	INSERT INTO VENTAS
    SELECT ventaCodigo,ventaFecha, ventaMonto, Codigo_Cliente,vendedorCodigo
    FROM inserted
 ELSE
--Si ya existe la linea de datalles, cambiar a UPDATE para que no haya
--error de clave duplicada.
   UPDATE VENTAS
		SET ventaMonto = I.ventaMonto,
            ventaFecha = I.ventaFecha
   FROM VENTAS D, inserted I
   WHERE D.clienteCodigo = i.Codigo_Cliente 
END


--Ahora si insertemos una fila en la vista v_Clientes
insert into v_Clientes values('c10','FREDY SANCHEZ','v11','2012-03-09',2000,'c01','v01')

select *from VENTAS
select *from CLIENTES
select *from v_Clientes