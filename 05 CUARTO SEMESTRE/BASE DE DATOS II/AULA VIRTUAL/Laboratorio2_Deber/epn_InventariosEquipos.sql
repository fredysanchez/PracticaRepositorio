/****** Objecto:  Base de Datos ******/
CREATE DATABASE epn_InventarioEquipos
GO
USE epn_InventarioEquipos
GO

/****** Objecto:  Esquemas ******/
CREATE SCHEMA [bajas]
GO

CREATE SCHEMA [compra]
GO

CREATE SCHEMA [mantenimiento]
GO

CREATE SCHEMA [registro]
GO

/****** Objecto:  Tablas ******/
CREATE TABLE [compra].[PROVEEDOR](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL,
	[apellido] [nchar](25) NOT NULL)
GO

CREATE TABLE [mantenimiento].[ESTADO_EQUIPO](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL)
GO

CREATE TABLE [mantenimiento].[MANTENIMIENTO](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[idTipoMantenimiento] [int] NOT NULL,
	[idEquipo] [int] NOT NULL,
	[idTecnico] [int] NOT NULL,
	[fechaMantenimiento] [date] NOT NULL)
GO

CREATE TABLE [mantenimiento].[MANTENIMIENTO_REEMPLAZO_COMPONENTES](
	[idMantenimiento] [int] NOT NULL PRIMARY KEY,
	[idComponenteReemplazado] [int] NOT NULL,
	[observaciones] [nchar](50) NOT NULL)
GO

CREATE TABLE [mantenimiento].[TECNICO](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL,
	[apellido] [nchar](25) NOT NULL)
GO

CREATE TABLE [mantenimiento].[TIPO_MANTENIMIENTO](
	[int] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL)
GO

CREATE TABLE [registro].[ASIGNACION](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[idEquipo] [int] NOT NULL,
	[idResponsable] [int] NOT NULL,
	[fechAsignacion] [date] NOT NULL,
	[activo] [bit] NOT NULL)
GO

CREATE TABLE [registro].[COMPONENTES](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[idEquipo] [int] NOT NULL,
	[idTipoComponente] [int] NOT NULL)
GO

CREATE TABLE [registro].[EQUIPO](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[idEstado] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idTipoEquipo] [int] NOT NULL,
	[marca] [nchar](25) NOT NULL,
	[modelo] [nchar](25) NOT NULL,
	[fechaCompra] [date] NOT NULL,
	[valorCompra] [money] NOT NULL)
GO

CREATE TABLE [registro].[RESPONSABLE](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL,
	[apellido] [nchar](25) NOT NULL)
GO

CREATE TABLE [registro].[TIPO_COMPONENTE](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL)
GO

CREATE TABLE [registro].[TIPO_EQUIPO](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nombre] [nchar](25) NOT NULL)
GO

/****** Actualizaciones en Cascada ******/

ALTER TABLE [mantenimiento].[MANTENIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MANTENIMIENTO_EQUIPO] FOREIGN KEY([idEquipo])
REFERENCES [registro].[EQUIPO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [mantenimiento].[MANTENIMIENTO] CHECK CONSTRAINT [FK_MANTENIMIENTO_EQUIPO]
GO

ALTER TABLE [mantenimiento].[MANTENIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MANTENIMIENTO_TECNICO] FOREIGN KEY([idTecnico])
REFERENCES [mantenimiento].[TECNICO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [mantenimiento].[MANTENIMIENTO] CHECK CONSTRAINT [FK_MANTENIMIENTO_TECNICO]
GO

ALTER TABLE [mantenimiento].[MANTENIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MANTENIMIENTO_TIPO_MANTENIMIENTO] FOREIGN KEY([idTipoMantenimiento])
REFERENCES [mantenimiento].[TIPO_MANTENIMIENTO] ([int])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [mantenimiento].[MANTENIMIENTO] CHECK CONSTRAINT [FK_MANTENIMIENTO_TIPO_MANTENIMIENTO]
GO

ALTER TABLE [mantenimiento].[MANTENIMIENTO_REEMPLAZO_COMPONENTES]  WITH NOCHECK ADD  CONSTRAINT [FK_MANTENIMIENTO_REEMPLAZO_COMPONENTES_COMPONENTES] FOREIGN KEY([idComponenteReemplazado])
REFERENCES [registro].[COMPONENTES] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [mantenimiento].[MANTENIMIENTO_REEMPLAZO_COMPONENTES] NOCHECK CONSTRAINT [FK_MANTENIMIENTO_REEMPLAZO_COMPONENTES_COMPONENTES]
GO

ALTER TABLE [mantenimiento].[MANTENIMIENTO_REEMPLAZO_COMPONENTES]  WITH CHECK ADD  CONSTRAINT [FK_MANTENIMIENTO_REEMPLAZO_COMPONENTES_MANTENIMIENTO] FOREIGN KEY([idMantenimiento])
REFERENCES [mantenimiento].[MANTENIMIENTO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [mantenimiento].[MANTENIMIENTO_REEMPLAZO_COMPONENTES] CHECK CONSTRAINT [FK_MANTENIMIENTO_REEMPLAZO_COMPONENTES_MANTENIMIENTO]
GO

ALTER TABLE [registro].[ASIGNACION]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACION_EQUIPO] FOREIGN KEY([idEquipo])
REFERENCES [registro].[EQUIPO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[ASIGNACION] CHECK CONSTRAINT [FK_ASIGNACION_EQUIPO]
GO

ALTER TABLE [registro].[ASIGNACION]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACION_RESPONSABLE] FOREIGN KEY([idResponsable])
REFERENCES [registro].[RESPONSABLE] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[ASIGNACION] CHECK CONSTRAINT [FK_ASIGNACION_RESPONSABLE]
GO

ALTER TABLE [registro].[COMPONENTES]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENTES_EQUIPO] FOREIGN KEY([idEquipo])
REFERENCES [registro].[EQUIPO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[COMPONENTES] CHECK CONSTRAINT [FK_COMPONENTES_EQUIPO]
GO

ALTER TABLE [registro].[COMPONENTES]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENTES_TIPO_COMPONENTE] FOREIGN KEY([idTipoComponente])
REFERENCES [registro].[TIPO_COMPONENTE] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[COMPONENTES] CHECK CONSTRAINT [FK_COMPONENTES_TIPO_COMPONENTE]
GO

ALTER TABLE [registro].[EQUIPO]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPO_ESTADO_EQUIPO1] FOREIGN KEY([idEstado])
REFERENCES [mantenimiento].[ESTADO_EQUIPO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[EQUIPO] CHECK CONSTRAINT [FK_EQUIPO_ESTADO_EQUIPO1]
GO

ALTER TABLE [registro].[EQUIPO]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPO_PROVEEDOR] FOREIGN KEY([idProveedor])
REFERENCES [compra].[PROVEEDOR] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[EQUIPO] CHECK CONSTRAINT [FK_EQUIPO_PROVEEDOR]
GO

ALTER TABLE [registro].[EQUIPO]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPO_TIPO_EQUIPO] FOREIGN KEY([idTipoEquipo])
REFERENCES [registro].[TIPO_EQUIPO] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [registro].[EQUIPO] CHECK CONSTRAINT [FK_EQUIPO_TIPO_EQUIPO]
GO


/****** Insercion de Datos ******/
INSERT INTO compra.PROVEEDOR VALUES('Jose','Ayala')
INSERT INTO compra.PROVEEDOR VALUES('Maria','Aldaz')
INSERT INTO compra.PROVEEDOR VALUES('Bryan','Cruz')

INSERT INTO registro.TIPO_EQUIPO VALUES('Computador de Escritorio')
INSERT INTO registro.TIPO_EQUIPO VALUES('Impresora')
INSERT INTO registro.TIPO_EQUIPO VALUES('Proyector')

INSERT INTO mantenimiento.TECNICO VALUES('Pablo','Teran')
INSERT INTO mantenimiento.TECNICO VALUES('Susana','Garcia')
INSERT INTO mantenimiento.TECNICO VALUES('Ambar','Lescano')

INSERT INTO registro.RESPONSABLE VALUES('Marco','Perez')
INSERT INTO registro.RESPONSABLE VALUES('Lorena','Palomino')
INSERT INTO registro.RESPONSABLE VALUES('Iris','Castro')

INSERT INTO mantenimiento.ESTADO_EQUIPO VALUES('Bueno')
INSERT INTO mantenimiento.ESTADO_EQUIPO VALUES('En Reparacion')
INSERT INTO mantenimiento.ESTADO_EQUIPO VALUES('Malo')
INSERT INTO mantenimiento.ESTADO_EQUIPO VALUES('Baja')
                   	   		
INSERT INTO registro.EQUIPO VALUES(1,1,1,'Dell','Dell Inspiron One 2320','2014-01-25',500.0000)
INSERT INTO registro.EQUIPO VALUES(1,2,1,'Dell','Dell Inspiron One 2320','2014-02-25',500.0000)
INSERT INTO registro.EQUIPO VALUES(1,2,1,'Dell','Dell XPS One 27 Touch','2014-03-25',469.9900)
INSERT INTO registro.EQUIPO VALUES(1,3,2,'Dell','Dell XPS One 27 Touch ','2014-04-30',469.9900)
INSERT INTO registro.EQUIPO VALUES(2,3,1,'HP','HP Compaq 500B E6500','2014-07-01',559.9900)
INSERT INTO registro.EQUIPO VALUES(2,1,1,'HP','HP Omni 220 Quad','2014-07-31',530.9900)
INSERT INTO registro.EQUIPO VALUES(2,1,3,'Epson','Epson L365 Multifunción','2014-08-25',309.9900)
INSERT INTO registro.EQUIPO VALUES(2,1,2,'Epson','Epson X24+ 300 Lúmenes','2014-09-30',819.9900)
INSERT INTO registro.EQUIPO VALUES(2,2,1,'Lenovo','Lenovo IdeaCentre B320','2014-10-12',450.9900)
INSERT INTO registro.EQUIPO VALUES(1,1,1,'Lenovo','Lenovo IdeaCentre A720','2014-10-21',480.9900)

INSERT INTO registro.ASIGNACION VALUES (1,1,'2014-01-28',1)
INSERT INTO registro.ASIGNACION VALUES (2,1,'2014-02-27',1)
INSERT INTO registro.ASIGNACION VALUES (3,1,'2014-03-30',1)
INSERT INTO registro.ASIGNACION VALUES (4,2,'2014-04-05',1)
INSERT INTO registro.ASIGNACION VALUES (5,2,'2014-05-01',0)
INSERT INTO registro.ASIGNACION VALUES (6,2,'2014-06-01',1)
INSERT INTO registro.ASIGNACION VALUES (7,2,'2014-07-10',1)
INSERT INTO registro.ASIGNACION VALUES (8,3,'2014-08-01',0)
INSERT INTO registro.ASIGNACION VALUES (9,3,'2014-11-30',1)
INSERT INTO registro.ASIGNACION VALUES (10,3,'2014-11-01',1)

INSERT INTO mantenimiento.TIPO_MANTENIMIENTO VALUES ('Preventivo')
INSERT INTO mantenimiento.TIPO_MANTENIMIENTO VALUES ('Correctivo')

INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,1,1,'2015-01-25')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,1,1,'2015-01-31')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,2,1,'2015-02-25')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,2,1,'2015-03-01')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(2,2,2,'2015-03-24')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,1,2,'2015-04-10')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,4,3,'2015-04-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(2,4,3,'2015-04-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,5,3,'2015-03-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,5,1,'2015-05-01')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,6,2,'2015-05-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(2,6,2,'2015-07-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(2,7,2,'2015-07-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,7,2,'2015-08-01')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,8,3,'2015-08-01')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(2,8,2,'2015-09-30')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,9,2,'2015-10-01')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,9,1,'2015-10-17')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,10,1,'2015-10-22')
INSERT INTO mantenimiento.MANTENIMIENTO VALUES(1,10,3,'2015-10-31')

INSERT INTO registro.TIPO_COMPONENTE VALUES(1,'Memoria')
INSERT INTO registro.TIPO_COMPONENTE VALUES(1,'Fuente de Poder')
INSERT INTO registro.TIPO_COMPONENTE VALUES(1,'Disco Duro')

INSERT INTO registro.TIPO_COMPONENTE VALUES(2,'Toner')
INSERT INTO registro.TIPO_COMPONENTE VALUES(2,'Fuente de Poder')
INSERT INTO registro.TIPO_COMPONENTE VALUES(2,'Abrazaderas')

INSERT INTO registro.TIPO_COMPONENTE VALUES(3,'Lentes de proyeccion')
INSERT INTO registro.TIPO_COMPONENTE VALUES(3,'Paneles LCD')
INSERT INTO registro.TIPO_COMPONENTE VALUES(3,'Lampara de proyeccion')

select * from registro.COMPONENTES

INSERT INTO registro.COMPONENTES VALUES (1,1)
INSERT INTO registro.COMPONENTES VALUES (1,2)
INSERT INTO registro.COMPONENTES VALUES (1,3)
INSERT INTO registro.COMPONENTES VALUES (2,1)
INSERT INTO registro.COMPONENTES VALUES (2,2)
INSERT INTO registro.COMPONENTES VALUES (2,3)
INSERT INTO registro.COMPONENTES VALUES (3,1)
INSERT INTO registro.COMPONENTES VALUES (3,2)
INSERT INTO registro.COMPONENTES VALUES (3,3)
INSERT INTO registro.COMPONENTES VALUES (4,1)
INSERT INTO registro.COMPONENTES VALUES (4,2)
INSERT INTO registro.COMPONENTES VALUES (4,3)
INSERT INTO registro.COMPONENTES VALUES (5,1)
INSERT INTO registro.COMPONENTES VALUES (5,2)
INSERT INTO registro.COMPONENTES VALUES (5,3)
INSERT INTO registro.COMPONENTES VALUES (6,1)
INSERT INTO registro.COMPONENTES VALUES (6,2)
INSERT INTO registro.COMPONENTES VALUES (6,3)
INSERT INTO registro.COMPONENTES VALUES (7,1)
INSERT INTO registro.COMPONENTES VALUES (7,2)
INSERT INTO registro.COMPONENTES VALUES (7,3)
INSERT INTO registro.COMPONENTES VALUES (8,1)
INSERT INTO registro.COMPONENTES VALUES (8,2)
INSERT INTO registro.COMPONENTES VALUES (8,3)
INSERT INTO registro.COMPONENTES VALUES (9,1)
INSERT INTO registro.COMPONENTES VALUES (9,2)
INSERT INTO registro.COMPONENTES VALUES (9,3)
INSERT INTO registro.COMPONENTES VALUES (10,1)
INSERT INTO registro.COMPONENTES VALUES (10,2)
INSERT INTO registro.COMPONENTES VALUES (10,3)
                             
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(1,1,'Remplazo de memoria')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(2,2,'Mantimiento ')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(3,1,'Expansion de memoria')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(4,3,'Respaldo de Datos')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(5,3,'Reemplazo de Disco Duro')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(6,1,'Cambio de RAM')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(7,2,'Reparacion del ventilador ')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(12,3,'Reparacion de los sectores del disco ')
INSERT INTO mantenimiento.MANTENIMIENTO_REEMPLAZO_COMPONENTES VALUES(16,1,'Cambio Fuente')

/****** Seleccion de las tablas ******/
SELECT * FROM   compra.PROVEEDOR where id>3
SELECT * FROM   mantenimiento.ESTADO_EQUIPO where id >7
SELECT * FROM mantenimiento.MANTENIMIENTO
SELECT * FROM mantenimiento.TECNICO
SELECT * FROM  delete mantenimiento.TIPO_MANTENIMIENTO where id>1
SELECT * FROM registro.ASIGNACION
SELECT * FROM registro.COMPONENTES
SELECT * FROM registro.EQUIPO
SELECT * FROM registro.RESPONSABLE
SELECT * FROM   registro.TIPO_COMPONENTE where id>1
SELECT * FROM registro.TIPO_EQUIPO

/* Trigger asignacion*/

create trigger tr_asignacionEquipo
on registro.ASIGNACION
after insert
as
begin
	
	declare @aux as int
    declare @idAsignacion as int
    declare @idEquipo as int
    declare @idResponsable as int
    declare @fechaAsignacion as date

    select
         @idAsignacion=inserted.id,
         @idEquipo=inserted.idEquipo,
         @idResponsable=inserted.idResponsable,
         @fechaAsignacion=inserted.fechAsignacion
    from inserted 
    	
	set @aux=(select id from registro.ASIGNACION tba 
              where  tba.idEquipo=@idEquipo and activo=1)
    if(@aux is not null)
    begin
        
        update registro.ASIGNACION
        set activo=0 
        where id=@aux
        update registro.ASIGNACION
        set activo=1  
        where id=@idAsignacion
        print 'ACTUALIZACION EJECUTADA'
		print '-----------------------'
    end
    else
    begin
        update registro.ASIGNACION
        set activo=1
        where id=@idAsignacion
    end	
end

/*Prueba  del trigger tr_asignacionEquipo*/

SELECT * FROM registro.ASIGNACION

insert into registro.ASIGNACION values (1,3,GETDATE(),0) 
insert into registro.ASIGNACION values (2,2,GETDATE(),0)

create trigger tr_bajasEquipo
on registro.EQUIPO
for update
as
begin
    
    declare @id as int
    declare @idEstado as int
    declare @idProveedor as int
    declare @idTipoEquipo as int
    declare @marca as nchar(25)
    declare @modelo as nchar(25) 
    declare @fechaCompra as date
    declare @valorCompra as money
    declare @componente as int

    select
        @id=deleted.id,
        @idEstado=deleted.idEstado,
        @idProveedor=deleted.idProveedor,
        @idTipoEquipo=deleted.idTipoEquipo,
        @marca=deleted.marca,
        @modelo=deleted.modelo,
        @fechaCompra=deleted.fechaCompra,
        @valorCompra=deleted.valorCompra,
        @componente=CP.idTipoComponente
    from deleted 
		 inner join registro.COMPONENTES CP
		 on deleted.id=CP.idEquipo
    
        insert into epn_InventarioEquipos_Historico.registro.EQUIPO   
        values(@idEstado,@idProveedor,@idTipoEquipo,@marca,@modelo,@fechaCompra,@valorCompra)
        insert into epn_InventarioEquipos_Historico.registro.COMPONENTES
        values(@id,@componente)
        delete registro.EQUIPO where id=@id
end

/*Prueba  del trigger tr_bajasEquipo*/

SELECT * FROM registro.EQUIPO
SELECT * FROM epn_InventarioEquipos_Historico.registro.EQUIPO
SELECT * FROM epn_InventarioEquipos_Historico.registro.COMPONENTES

update registro.EQUIPO
set idEstado=3
where id=2