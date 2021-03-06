
CREATE DATABASE [PryDesempeñoEmpleadosFinal] 
GO

USE [PryDesempeñoEmpleadosFinal] 
GO

/****** Object:  Table [dbo].[UNIDAD]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDAD](
	[id_Unidad] [int] IDENTITY(1,1) NOT NULL,
	[nombreU] [nvarchar](50) NOT NULL,
	[ubicacionU] [nvarchar](50) NOT NULL,
	[telefonoU] [nchar](10) NOT NULL,
	[descripcionU] [nvarchar](50) NOT NULL,
	[estadoU] [nchar](10) NOT NULL,
 CONSTRAINT [PK__UNIDAD__95D7C92B1920BF5C] PRIMARY KEY CLUSTERED 
(
	[id_Unidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[id_Cargo] [int] IDENTITY(1,1) NOT NULL,
	[nombreC] [nvarchar](50) NOT NULL,
	[fechaCreacionC] [date] NOT NULL,
	[descripcionC] [nvarchar](50) NOT NULL,
	[estadoC] [nchar](10) NOT NULL,
 CONSTRAINT [PK__CARGO__D3C09EC50F975522] PRIMARY KEY CLUSTERED 
(
	[id_Cargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[nota] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIFICULTAD]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIFICULTAD](
	[id_Dificultad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
 CONSTRAINT [PK__DIFICULT__BD8B03590BC6C43E] PRIMARY KEY CLUSTERED 
(
	[id_Dificultad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[id_Estado] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ESTADO_1] PRIMARY KEY CLUSTERED 
(
	[id_Estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SITIO]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SITIO](
	[id_Sitio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[ubicacion] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](60) NOT NULL,
	[estado] [nchar](10) NOT NULL,
 CONSTRAINT [PK__SITIO__2C3F70B71ED998B2] PRIMARY KEY CLUSTERED 
(
	[id_Sitio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado] [int] NOT NULL,
	[nota] [decimal](18, 2) NULL,
 CONSTRAINT [PK__Nota__3213E83F2BFE89A6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MINUTOS]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MINUTOS](
	[minu] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCCION]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUCCION](
	[id_Instruccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Instruccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORAS]    Script Date: 02/08/2016 14:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORAS](
	[hora] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[grvUnidad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[grvUnidad]
as
select  c.id_Unidad,c.nombreU,c.descripcionU, c.ubicacionU,c.telefonoU from UNIDAD c where c.estadoU='Activo'
GO
/****** Object:  StoredProcedure [dbo].[grvSitio]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[grvSitio]
as
select  c.id_Sitio,c.nombre,c.descripcion, c.ubicacion from SITIO c where c.estado='Activo'
GO
/****** Object:  StoredProcedure [dbo].[grvCargo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[grvCargo]
as
select c.id_Cargo,c.nombreC,c.fechaCreacionC,c.descripcionC from CARGO c where c.estadoC='Activo'
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarCargo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_modificarCargo]
 @id_Cargo int,
 @nombre nvarchar (50),
 @fechaCreacion nvarchar (50),
 @descripcion nvarchar(50),
 @estado nvarchar(50)
	as
	begin
 update CARGO set nombreC=@nombre, fechaCreacionC=@fechaCreacion, descripcionC=@descripcion,estadoC=@estado
 where id_Cargo=@id_Cargo
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUnidadId]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarUnidadId]
(
	@id_unidad int
)
as
	select * from Unidad
	where id_Unidad=@id_unidad
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUnidad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarUnidad]
as
	select * from   Sitio
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarSitioId]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarSitioId]
(
	@id_sitio int
)
as
	select * from Sitio
	where id_Sitio=@id_sitio
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarSitio]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarSitio]
as
	select * from   Sitio
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCargo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertCargo]
@nombre nvarchar(50),
@fechaCreacion date,
@descripcion nvarchar(50),
@estado nvarchar(50)
as
begin

	insert into CARGO values (@nombre,@fechaCreacion,@descripcion,@estado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarCargoId]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarCargoId]
(
	@id_Cargo int
)
as
	select * from CARGO
	where id_Cargo=@id_Cargo
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarCargo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarCargo]
as
	select * from   CARGO
GO
/****** Object:  StoredProcedure [dbo].[sp_insertUnidad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertUnidad]
@nombre nvarchar(50) ,
@ubicacion nvarchar(50),
@telefono nchar(10) ,
@descripcion nvarchar(50),
@estado nvarchar(10)
 as
	begin
 Insert into UNIDAD values(@nombre,@ubicacion,@telefono,@descripcion,@estado)
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertSitio]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertSitio]
 @nombre nvarchar (50),
 @ubicacion nvarchar (50),
 @descripcion nvarchar(50),
 @estado nvarchar(50)
	as
	begin
 Insert into SITIO values (@nombre,@ubicacion,@descripcion,@estado)
end
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombreE] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[instruccion] [nvarchar](25) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[id_Cargo] [int] NOT NULL,
	[id_Unidad] [int] NOT NULL,
	[estado] [nchar](10) NOT NULL,
	[fotografia] [image] NOT NULL,
	[usuario] [nvarchar](25) NOT NULL,
	[contraseña] [nvarchar](20) NOT NULL,
	[asignado] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK__Empleado__FA6E27881273C1CD] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_returnNota]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_returnNota]
						@id_Empleado int
						as
						begin
							select nota from Nota where id_Empleado=@id_Empleado
						end
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarUnidad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_modificarUnidad]
@id_unidad int,
 @nombre nvarchar (50),
 @ubicacion nvarchar (50),
 @telefono nvarchar (10),
 @descripcion nvarchar(50),
 @estado nvarchar(50)
	as
	begin
 update UNIDAD set nombreU=@nombre, ubicacionU=@ubicacion, telefonoU=@telefono,descripcionU=@descripcion,estadoU=@estado
 where id_Unidad=@id_unidad
end
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarSitio]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_modificarSitio]
@id_sitio int,
 @nombre nvarchar (50),
 @ubicacion nvarchar (50),
 @descripcion nvarchar(50),
 @estado nvarchar(50)
	as
	begin
 update SITIO set nombre=@nombre, ubicacion=@ubicacion,descripcion=@descripcion,estado=@estado
 where id_Sitio=@id_sitio
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEmpleado]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ModificarEmpleado]
	@id_Empleado INT ,
    @nombre  VARCHAR(50),
    @apellido VARCHAR(50),
    @fechaNacimiento DATE,
    @instruccion VARCHAR(25),
    @telefono  NVARCHAR(10),
    @descripcion VARCHAR(50),
    @id_Cargo INT,
    @id_Unidad  INT,
    @estado  VARCHAR(10),
    @fotografia  IMAGE,
    @usuario  VARCHAR(25),
    @contraseña  VARCHAR(20)
AS
BEGIN

        UPDATE  dbo.EMPLEADO SET nombreE=@nombre,apellido=@apellido,fechaNacimiento=@fechaNacimiento,
        instruccion=@instruccion,telefono=@telefono,descripcion=@descripcion,
        id_Cargo=@id_Cargo,id_Unidad=@id_Unidad,estado=@estado,fotografia=@fotografia,usuario=@usuario,
        contraseña=@contraseña where id_Empleado=@id_Empleado
        
END
GO
/****** Object:  Table [dbo].[EMPLEADO_JEFE]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO_JEFE](
	[id_EmpleadoJ] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado_Jefe] [int] NOT NULL,
	[id_Empleado_Empleado] [int] NOT NULL,
 CONSTRAINT [PK__EMPLEADO__3EF0E3E422AA2996] PRIMARY KEY CLUSTERED 
(
	[id_EmpleadoJ] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[darBajaEmpleado]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[darBajaEmpleado](
 @id_Empleado int, 
 @estado nchar(10)
)
as
	update Empleado set   estado= @estado where id_Empleado = @id_Empleado
	update Empleado set asignado = 'No' where id_Empleado = @id_Empleado
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[id_Actividad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[id_Sitio] [int] NOT NULL,
	[fechaRealizacion] [date] NOT NULL,
	[duracion] [decimal](18, 2) NOT NULL,
	[calificacion] [decimal](18, 2) NOT NULL,
	[dificultad] [int] NOT NULL,
	[estado] [nchar](10) NOT NULL,
	[id_Empleado] [int] NOT NULL,
 CONSTRAINT [PK__ACTIVIDA__F866BDCB267ABA7A] PRIMARY KEY CLUSTERED 
(
	[id_Actividad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertEmpleados]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertEmpleados]
    @nombre  VARCHAR(50),
    @apellido VARCHAR(50),
    @fechaNacimiento DATE,
    @instruccion VARCHAR(25),
    @telefono  NVARCHAR(10),
    @descripcion VARCHAR(50),
    @id_Cargo INT,
    @id_Unidad  INT,
    @estado  VARCHAR(10),
    @fotografia  IMAGE,
    @usuario  VARCHAR(25),
    @contraseña  VARCHAR(20),
    @NewId int output
AS
BEGIN

        INSERT INTO  dbo.EMPLEADO ( nombreE,apellido,fechaNacimiento,instruccion,telefono,descripcion,
        id_Cargo,id_Unidad,estado,fotografia,usuario,contraseña)
        VALUES (@nombre, @apellido, @fechaNacimiento, @instruccion, 
        @telefono, @descripcion,@id_Cargo,@id_Unidad, @estado,@fotografia, @usuario, @contraseña)
         Select @NewId = SCOPE_IDENTITY()
        insert into Nota values(@NewId,0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleadoId]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarEmpleadoId](
 @id_Empleado int
)
as
	select e.nombreE, e.apellido,e.fechaNacimiento , e.instruccion, e.telefono,e.descripcion , c.nombreC, u.nombreU, e.fotografia, e.usuario, e.contraseña ,n.nota from Empleado e, Unidad u, Cargo c ,Nota n
	where 
		  e.id_Cargo=c.id_Cargo and
		  e.id_Unidad = u.id_unidad and
		  e.id_Empleado = @id_Empleado and
		  n.id_Empleado=@id_Empleado
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleado]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarEmpleado](
 @id_Empleado int
)
as
	select e.* ,n.nota from Empleado e, Unidad u, Cargo c ,Nota n
	where 
		  e.id_Cargo=c.id_Cargo and
		  e.id_Unidad = u.id_unidad and
		  e.id_Empleado = @id_Empleado and
		  n.id_Empleado=@id_Empleado
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleadoSesion]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarEmpleadoSesion](
 @estado  VARCHAR(10),
    @usuario  VARCHAR(25),
    @contraseña  VARCHAR(20)
)
as
	select e.id_Empleado, e.nombreE, e.apellido,e.fechaNacimiento , e.instruccion, e.telefono,e.descripcion , c.nombreC, u.nombreU,e.estado, e.fotografia, e.usuario, e.contraseña , n.nota from Empleado e, Unidad u, Cargo c ,Nota n
	 where e.estado=@estado and e.usuario=@usuario and e.contraseña=@contraseña and e.id_Cargo=c.id_Cargo and e.id_Unidad=u.id_Unidad and
	 n.id_Empleado=e.id_Empleado
GO
/****** Object:  StoredProcedure [dbo].[sp_listarEmpleadosCargo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_listarEmpleadosCargo]
@id_cargo int
as
begin
select distinct e.id_empleado, e.nombre from empleado e inner join cargo_empleado c on e.id_empleado = c.id_empleado 
inner join CARGO a on a.id_cargo =c.id_cargo where c.id_cargo=@id_cargo 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarEmpleadosUnidad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listarEmpleadosUnidad]
@id_unidad int
as
begin
select distinct e.id_empleado, e.nombreE, e.apellido, e.fechaNacimiento,c.nombreC ,u.nombreU ,n.nota
 from empleado e inner join unidad u on e.id_unidad = u.id_unidad inner join cargo c  on e.id_cargo=c.id_Cargo
 inner join Nota n on n.id_Empleado=e.id_Empleado and e.estado='Activo'
where u.id_unidad=@id_unidad 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarEmpleadosporJefe]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listarEmpleadosporJefe]
@id_Empleado_Jefe int
as
begin
select distinct id_Empleado_Empleado,nombreE,apellido from dbo.EMPLEADO_JEFE j inner join dbo.EMPLEADO e on j.id_Empleado_Empleado=e.id_Empleado where id_Empleado_Jefe=@id_Empleado_Jefe 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listarEmpleadosActividad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listarEmpleadosActividad]
@id_Actividad int
as
begin
select distinct e.* from ACTIVIDAD e inner join Empleado u on e.id_empleado = u.id_empleado 
where e.id_Actividad=@id_Actividad
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarActividadId]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarActividadId]
(
	@id_Actividad int
)
as
	select * from ACTIVIDAD
	where id_Actividad=@id_Actividad
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarEmpleadoJefe]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertarEmpleadoJefe]
@id_Empleado_Jefe int,
@id_Empleado_Empleado int

as
begin

	insert into dbo.EMPLEADO_JEFE values (@id_Empleado_Jefe,@id_Empleado_Empleado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertActividad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertActividad]
	@nombre  VARCHAR(50),
	@descripcion VARCHAR(50),
    @fechaRealizacion DATE,
    @duracion decimal(18,2),
    @dificultad  int,
    @estado  VARCHAR(10),
    @id_Empleado  INT,
    @id_Sitio INT

 AS
BEGIN

        INSERT INTO  dbo.ACTIVIDAD (nombre,descripcion,fechaRealizacion,duracion,dificultad,estado,id_Empleado,id_Sitio)
        VALUES (@nombre, @descripcion, @fechaRealizacion, @duracion,@dificultad, @estado,  @id_Empleado, @id_Sitio )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_calculoNota]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_calculoNota] 
@id_Empleado int,
@id_Actividad int
as
begin
	declare @Nota decimal(10,2),
	@Calificacion decimal(10,2),
	@Dificultad decimal(10,2),
	@Cantidad decimal(10,2),
	@Duracion decimal(10,2),
	@Promedio decimal(10,2),
	@Auxiliar decimal(10,2)
	
	if(select a.duracion from ACTIVIDAD  a where a.id_Empleado= @id_Empleado and a.id_Actividad=@id_Actividad)between 1 and 3.9
	begin
		set @Duracion =2.5
	end
	if(select a.duracion from ACTIVIDAD  a where a.id_Empleado=@id_empleado and a.id_Actividad=@id_Actividad )between 4 and 8
	begin
		set @Duracion =5
	end
	if(select a.dificultad from ACTIVIDAD  a where a.id_Empleado= @id_empleado and a.id_Actividad=@id_Actividad)=1
	begin
		set @Dificultad=1
	end
	if(select a.dificultad from ACTIVIDAD  a where a.id_Empleado=@id_empleado and a.id_Actividad=@id_Actividad)=2
	begin
		set @Dificultad=2.5
	end
	if(select a.dificultad from ACTIVIDAD a  where a.id_Empleado=@id_empleado and a.id_Actividad=@id_Actividad)=3
	begin
		set @Dificultad=5
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado )between 1 and 4
	begin
		set @Cantidad=1
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado )between 5 and 9
	begin
		set @Cantidad=2.5
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado )>10
	begin
		set @Cantidad=5
	end
	
	set @Calificacion=(select calificacion from ACTIVIDAD  where id_Empleado=@id_empleado and id_Actividad=@id_Actividad)
	
	set @Nota=((@Calificacion+@Dificultad+@Cantidad+@Duracion)*10)/20

	print 'Duracion : ' + CAST(@Duracion AS varchar(100)) + '.' ;
	print 'Calificacion : ' + CAST(@Calificacion AS varchar(100)) + '.' ;
	print 'Cantidad : ' + CAST(@Cantidad AS varchar(100)) + '.' ;
	print 'Dificultad : ' + CAST(@Dificultad AS varchar(100)) + '.' ;
	
	print 'La nota es: ' + CAST(@Nota AS varchar(100)) + '.' ;
	if exists(select c.id_Empleado from Nota c where c.id_Empleado=@id_empleado)
	begin
		set @Auxiliar=(select n.nota from Nota n where n.id_Empleado=@id_empleado)
		
		print'La es: ' + CAST(@Auxiliar AS varchar(100)) + '.' ;
		update  Nota set  nota=(@Auxiliar+@Nota)/2 where id_Empleado=@id_empleado
		
	end		
	else
	begin
		insert into Nota values (@id_empleado,@Nota)
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_actividad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_actividad]
@id_Empleado int
as
begin
select j.id_Actividad,j.descripcion,s.nombre, j.fechaRealizacion,j.duracion, j.calificacion
 , d.nombre from dbo.ACTIVIDAD j inner join SITIO s on j.id_Sitio=s.id_Sitio inner join DIFICULTAD d
 on j.dificultad=d.id_Dificultad where @id_Empleado= j.id_Empleado
end
GO
/****** Object:  StoredProcedure [dbo].[calculo]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[calculo] 
@id_empleado int
as
begin
	declare @Nota decimal(18,10),
	@Calificacion decimal(18,10),
	@Dificultad decimal(18,10),
	@Cantidad decimal(18,10),
	@Duracion decimal(18,10),
	@Pt decimal(18,10)
	
	if(select avg(a.calificacion)from ACTIVIDAD  a where a.id_Empleado= @id_empleado)between 1 and 3.9
	begin
		set @Duracion =2.5
	end
	if(select avg(a.calificacion)from ACTIVIDAD  a where a.id_Empleado=@id_empleado)between 4 and 8
	begin
		set @Duracion =5
	end
	if(select AVG(a.dificultad)from ACTIVIDAD  a where a.id_Empleado= @id_empleado)=1
	begin
		set @Dificultad=1
	end
	if(select AVG(a.dificultad) from ACTIVIDAD  a where a.id_Empleado=@id_empleado)=2
	begin
		set @Dificultad=2.5
	end
	if(select AVG(a.dificultad) from ACTIVIDAD a  where a.id_Empleado=@id_empleado)=3
	begin
		set @Dificultad=5
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado)between 1 and 5
	begin
		set @Cantidad=1
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado)between 6 and 9
	begin
		set @Cantidad=2.5
	end
	if(select COUNT(*) from ACTIVIDAD  a where a.id_Empleado=@id_empleado)>10
	begin
		set @Cantidad=5
	end
	
	set @Calificacion=(select avg(calificacion) from ACTIVIDAD  where id_Empleado  like  @id_empleado)
	set @Nota=((@Calificacion+@Dificultad+@Cantidad+@Duracion)*10)
	set @Pt=@Nota/20
	print 'Duracion : ' + CAST(@Duracion AS varchar(100)) + '.' ;
	print 'Calificacion : ' + CAST(@Calificacion AS varchar(100)) + '.' ;
	print 'Cantidad : ' + CAST(@Cantidad AS varchar(100)) + '.' ;
	print 'Dificultad : ' + CAST(@Dificultad AS varchar(100)) + '.' ;
	print 'La nota es: ' + CAST(@Pt AS varchar(100)) + '.' ;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_NotaActividad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NotaActividad]
	@id_Actividad int,
    @calificacion decimal(18,2)
	as
	begin
 update Actividad set 
 calificacion=@calificacion
 where id_Actividad=@id_Actividad
end
GO
/****** Object:  StoredProcedure [dbo].[sp_regactividad]    Script Date: 02/08/2016 14:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_regactividad]
@id_Empleado int,
@id_Actividad int
as
begin
	exec sp_calculoNota @id_Empleado,@id_Actividad
end
GO
/****** Object:  Default [DF__UNIDAD__estado_u__29572725]    Script Date: 02/08/2016 14:11:16 ******/
ALTER TABLE [dbo].[UNIDAD] ADD  CONSTRAINT [DF__UNIDAD__estado_u__29572725]  DEFAULT ('Activo') FOR [estadoU]
GO
/****** Object:  Default [DF__CARGO__estado_ca__286302EC]    Script Date: 02/08/2016 14:11:16 ******/
ALTER TABLE [dbo].[CARGO] ADD  CONSTRAINT [DF__CARGO__estado_ca__286302EC]  DEFAULT ('Activo') FOR [estadoC]
GO
/****** Object:  Default [DF__SITIO__estado_si__2C3393D0]    Script Date: 02/08/2016 14:11:16 ******/
ALTER TABLE [dbo].[SITIO] ADD  CONSTRAINT [DF__SITIO__estado_si__2C3393D0]  DEFAULT ('Activo') FOR [estado]
GO
/****** Object:  Default [DF__Empleado__estado__173876EA]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO] ADD  CONSTRAINT [DF__Empleado__estado__173876EA]  DEFAULT ('Activo') FOR [estado]
GO
/****** Object:  Default [DF__Empleado__ocupad__182C9B23]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO] ADD  CONSTRAINT [DF__Empleado__ocupad__182C9B23]  DEFAULT ('No') FOR [asignado]
GO
/****** Object:  Default [DF__ACTIVIDAD__calif__2D27B809]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD] ADD  CONSTRAINT [DF__ACTIVIDAD__calif__2D27B809]  DEFAULT ((0)) FOR [calificacion]
GO
/****** Object:  Default [DF__ACTIVIDAD__estad__2E1BDC42]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD] ADD  CONSTRAINT [DF__ACTIVIDAD__estad__2E1BDC42]  DEFAULT ('Activo') FOR [estado]
GO
/****** Object:  Check [C2]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH NOCHECK ADD  CONSTRAINT [C2] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [C2]
GO
/****** Object:  ForeignKey [FK__Empleado__id_car__15502E78]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__id_car__15502E78] FOREIGN KEY([id_Cargo])
REFERENCES [dbo].[CARGO] ([id_Cargo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK__Empleado__id_car__15502E78]
GO
/****** Object:  ForeignKey [FK__Empleado__id_uni__164452B1]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__id_uni__164452B1] FOREIGN KEY([id_Unidad])
REFERENCES [dbo].[UNIDAD] ([id_Unidad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK__Empleado__id_uni__164452B1]
GO
/****** Object:  ForeignKey [FK__EmplaEmpl__id_em__2A4B4B5E]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO_JEFE]  WITH CHECK ADD  CONSTRAINT [FK__EmplaEmpl__id_em__2A4B4B5E] FOREIGN KEY([id_Empleado_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
GO
ALTER TABLE [dbo].[EMPLEADO_JEFE] CHECK CONSTRAINT [FK__EmplaEmpl__id_em__2A4B4B5E]
GO
/****** Object:  ForeignKey [FK__EmplaEmpl__id_je__29572725]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[EMPLEADO_JEFE]  WITH CHECK ADD  CONSTRAINT [FK__EmplaEmpl__id_je__29572725] FOREIGN KEY([id_Empleado_Jefe])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLEADO_JEFE] CHECK CONSTRAINT [FK__EmplaEmpl__id_je__29572725]
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_di__34C8D9D1]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK__ACTIVIDAD__id_di__34C8D9D1] FOREIGN KEY([dificultad])
REFERENCES [dbo].[DIFICULTAD] ([id_Dificultad])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK__ACTIVIDAD__id_di__34C8D9D1]
GO
/****** Object:  ForeignKey [FK__Actividad__id_em__24927208]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK__Actividad__id_em__24927208] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK__Actividad__id_em__24927208]
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_si__36B12243]    Script Date: 02/08/2016 14:11:17 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK__ACTIVIDAD__id_si__36B12243] FOREIGN KEY([id_Sitio])
REFERENCES [dbo].[SITIO] ([id_Sitio])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK__ACTIVIDAD__id_si__36B12243]
GO

/* INSERTAR EN LAS TABLAS */


insert into cargo values 
('Administrador', getdate(), 'Administra cargos, unidades, sitios','Activo'),
('Gerente',getdate(),'Dirige y Administra la Empresa','Activo'),
('Director Ejecutivo',getdate(),'Gestion Administrativa','Activo'),
('Vendedor ',getdate(),'Venta de Productos','Activo'),
('Jefe de Operaciones',getdate(),'Control de actividades','Activo'),
('Técnico Administrativo', getdate(),'Planea reuniones y viajes','Activo'),
('Asistente Personal',getdate(),'Apoyo Administrativo a Gerente','Activo')


insert into Unidad values
('Administrativa','Quito-Centro','2323434','Funciones administrativas','Activo'),
('Gerencia','Quito-Norte','3454567','Ordenar y Administrar Unidades','Activo'),
('Telecomunicaciones','Quito-Norte','2267450','Implementa y Mantiene redes de comunicaciones','Activo'),
('Ventas','Quito-centro','2034567','Administra zonas de ventas','Activo'),
('Recursos Humanos','Quito-Sur','2325467','Organizacion y planificacion del personal','Activo'),
('Direccion','Quito-Norte','3453509','Coordina y organiza recursos de la empresa','Activo')

insert into Sitio values 
('Laborotorio1 ','Civil','Lista de Trabajadores','Activo'),
('Laborotorio2 ','Sistemas','Comercializacion y ventas','Activo'),
('Laborotorio3 ','Quimica','Delegacion de autoridad','Activo'),
('Laborotorio4 ','Civil','Planes de organizacion y planificacion','Activo'),
('Laborotorio5 ','Civil','Servicio de internet y telefonia ','Activo'),
('Laborotorio6 ','Sistemas','Recursos empresariales ','Activo')

exec dbo.sp_insertEmpleados 'Federico','Gonzales','1970-10-12','Tercer Nivel','2587456','Empleado proactivo',1,5,'Activo','www.imagen1.com','11','11',1
exec dbo.sp_insertEmpleados'Martha','Pilco','1970-10-12','Tercer Nivel','2587456','Empleado promedio',4,6, 'Activo','www.imagen2.com','22','22',2
exec dbo.sp_insertEmpleados'Anabel','Hidalgo','1975-02-14','Secundaria','3453467','Empleado de Bajo Rendimiento',3,4,'Activo','www.imagen3.com','33','333',3
exec dbo.sp_insertEmpleados'Dario','Larraga','1979-04-30','Cuarto Nivel','2564871','Empleado proactivo',6,2,'Activo','www.imagen4.com','44','44',4
exec dbo.sp_insertEmpleados'Byron','Guaman','1982-11-25','Tercer Nivel','3002145','Empleado con conocimientos administrativos',4,3,'Activo','www.imagen5.com','55','55',5
exec dbo.sp_insertEmpleados'Cesar','Andrade','1971-08-06','Cuarto Nivel','2654102','Empleado promedio',3,4,'Activo','www.imagen6.com','66','66',6
exec dbo.sp_insertEmpleados'Joel','Delgado','1964-06-10','Tercer Nivel','2654785','Jefe o Dueño de la Empresa',2,2,'Activo','www.imagen7.com','77','77',7
exec dbo.sp_insertEmpleados'Diana','Saez','1970-11-17','Tercer Nivel','3653201','Empleado de Bajo Rendimiento',5,5,'Activo','www.imagen8.com','88','88',8

insert into Estado values('Activo'),('Inactivo')

insert into Horas values(1),(2),(1),(3),(4),(5),(6),(7),(8)

insert into Minutos values(0),(5),(10),(15),(20),(25),(30),(35),(40),(45),(50),(55)

insert into Calificacion values (1),(2),(3),(4),(5)

select * from Instruccion
select * from Cargo
select * from Unidad
select * from Empleado
select * from Estado

