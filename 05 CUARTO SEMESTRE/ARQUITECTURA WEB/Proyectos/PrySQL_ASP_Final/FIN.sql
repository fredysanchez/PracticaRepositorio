USE [master]
GO
/****** Object:  Database [BD_PryFinal]    Script Date: 01/26/2016 11:46:48 ******/
CREATE DATABASE [BD_PryFinal] ON  PRIMARY 
( NAME = N'BD_PryFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BD_PryFinal.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_PryFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BD_PryFinal_log.LDF' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_PryFinal] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_PryFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_PryFinal] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BD_PryFinal] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BD_PryFinal] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BD_PryFinal] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BD_PryFinal] SET ARITHABORT OFF
GO
ALTER DATABASE [BD_PryFinal] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BD_PryFinal] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BD_PryFinal] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BD_PryFinal] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BD_PryFinal] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BD_PryFinal] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BD_PryFinal] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BD_PryFinal] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BD_PryFinal] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BD_PryFinal] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BD_PryFinal] SET  DISABLE_BROKER
GO
ALTER DATABASE [BD_PryFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BD_PryFinal] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BD_PryFinal] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BD_PryFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BD_PryFinal] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BD_PryFinal] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BD_PryFinal] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BD_PryFinal] SET  READ_WRITE
GO
ALTER DATABASE [BD_PryFinal] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BD_PryFinal] SET  MULTI_USER
GO
ALTER DATABASE [BD_PryFinal] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BD_PryFinal] SET DB_CHAINING OFF
GO
USE [BD_PryFinal]
GO
/****** Object:  Table [dbo].[SITIO]    Script Date: 01/26/2016 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SITIO](
	[id_Sitio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[ubicacion] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SITIO] PRIMARY KEY CLUSTERED 
(
	[id_Sitio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCCION]    Script Date: 01/26/2016 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INSTRUCCION](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 01/26/2016 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESTADO](
	[id_Estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UNIDAD]    Script Date: 01/26/2016 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDAD](
	[id_Unidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[ubicacion] [nvarchar](50) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UNIDAD] PRIMARY KEY CLUSTERED 
(
	[id_Unidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 01/26/2016 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[id_Cargo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fechaCreacion] [date] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CARGO] PRIMARY KEY CLUSTERED 
(
	[id_Cargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCargo]    Script Date: 01/26/2016 11:46:51 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insertUnidad]    Script Date: 01/26/2016 11:46:51 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insertSitio]    Script Date: 01/26/2016 11:46:51 ******/
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

SELECT * FROM dbo.SITIO
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarSitio]    Script Date: 01/26/2016 11:46:51 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListarSitioId]    Script Date: 01/26/2016 11:46:51 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListarSitio]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarSitio]
as
	select * from   Sitio
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[instruccion] [nvarchar](25) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fotografia] [image] NOT NULL,
	[usuario] [nvarchar](25) NOT NULL,
	[contraseña] [nvarchar](20) NOT NULL,
	[estado] [nchar](10) NOT NULL,
	[id_Unidad] [int] NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO_JEFE]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO_JEFE](
	[id_Tabla] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado_Jefe] [int] NOT NULL,
	[id_Empleado_Empleado] [int] NOT NULL,
 CONSTRAINT [PK_EMPLEADO_JEFE] PRIMARY KEY CLUSTERED 
(
	[id_Tabla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARGO_EMPLEADO]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO_EMPLEADO](
	[id_CargoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado] [int] NOT NULL,
	[id_Cargo] [int] NOT NULL,
 CONSTRAINT [PK_CARGO_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[id_CargoEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_caragarImg]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_caragarImg]
@id_Empleado int
as
Begin
Select fotografia
from EMPLEADO where id_Empleado=@id_Empleado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleadoId]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[sp_ListarEmpleadoId]
(
	@usuario nvarchar(25),
	@constraseña nvarchar(20)
)
as
	select * from EMPLEADO
	where usuario=@usuario and contraseña=@constraseña
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[id_Actividad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descrpcion] [nvarchar](50) NOT NULL,
	[fechaRealizacion] [date] NOT NULL,
	[duracion] [nchar](10) NOT NULL,
	[calificacion] [nchar](10) NOT NULL,
	[dificultad] [nvarchar](5) NOT NULL,
	[estado] [nchar](10) NOT NULL,
	[id_Empleado] [int] NOT NULL,
	[id_Sitio] [int] NOT NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[id_Actividad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertEmpleados]    Script Date: 01/26/2016 11:46:51 ******/
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
    @fotografia  VARBINARY(max),
    @usuario  VARCHAR(25),
    @contraseña  VARCHAR(20),
    @estado  VARCHAR(10),
    @id_Unidad  INT,
    @id_Cargo int,
    @NewId int output
AS
BEGIN

        INSERT INTO  dbo.EMPLEADO VALUES (@nombre, @apellido, @fechaNacimiento, @instruccion, 
        @telefono, @descripcion, @fotografia, @usuario, @contraseña, @estado, @id_Unidad)
        Select @NewId = SCOPE_IDENTITY()
        insert into dbo.CARGO_EMPLEADO values(@NewId,@id_Cargo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertarcargoempleado]    Script Date: 01/26/2016 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_Insertarcargoempleado]
@Id_Empleado int,
@Id_Cargo int
as
begin

	insert into dbo.CARGO_EMPLEADO values (@Id_Empleado,@Id_Cargo)
end
GO
/****** Object:  Check [C5]    Script Date: 01/26/2016 11:46:49 ******/
ALTER TABLE [dbo].[SITIO]  WITH NOCHECK ADD  CONSTRAINT [C5] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[SITIO] CHECK CONSTRAINT [C5]
GO
/****** Object:  Check [C4]    Script Date: 01/26/2016 11:46:49 ******/
ALTER TABLE [dbo].[UNIDAD]  WITH NOCHECK ADD  CONSTRAINT [C4] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[UNIDAD] CHECK CONSTRAINT [C4]
GO
/****** Object:  Check [C3]    Script Date: 01/26/2016 11:46:49 ******/
ALTER TABLE [dbo].[CARGO]  WITH NOCHECK ADD  CONSTRAINT [C3] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[CARGO] CHECK CONSTRAINT [C3]
GO
/****** Object:  Check [C1]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[EMPLEADO]  WITH NOCHECK ADD  CONSTRAINT [C1] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [C1]
GO
/****** Object:  Check [C6]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[EMPLEADO]  WITH NOCHECK ADD  CONSTRAINT [C6] CHECK  (([instruccion]='Primaria' OR [instruccion]='Secundaria' OR [instruccion]='Tercer Nivel' OR [instruccion]='Cuarto Nivel' OR [instruccion]='Doctorado'))
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [C6]
GO
/****** Object:  Check [C2]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH NOCHECK ADD  CONSTRAINT [C2] CHECK  (([estado]='Activo' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [C2]
GO
/****** Object:  Check [C7]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH NOCHECK ADD  CONSTRAINT [C7] CHECK  (([dificultad]='Alta' OR [dificultad]='Media' OR [dificultad]='Baja'))
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [C7]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_UNIDAD1]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_UNIDAD1] FOREIGN KEY([id_Unidad])
REFERENCES [dbo].[UNIDAD] ([id_Unidad])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_UNIDAD1]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_JEFE_EMPLEADO]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[EMPLEADO_JEFE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_JEFE_EMPLEADO] FOREIGN KEY([id_Empleado_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
GO
ALTER TABLE [dbo].[EMPLEADO_JEFE] CHECK CONSTRAINT [FK_EMPLEADO_JEFE_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_JEFE_EMPLEADO2]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[EMPLEADO_JEFE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_JEFE_EMPLEADO2] FOREIGN KEY([id_Empleado_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLEADO_JEFE] CHECK CONSTRAINT [FK_EMPLEADO_JEFE_EMPLEADO2]
GO
/****** Object:  ForeignKey [FK_CARGO_EMPLEADO_CARGO]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[CARGO_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_CARGO_EMPLEADO_CARGO] FOREIGN KEY([id_Cargo])
REFERENCES [dbo].[CARGO] ([id_Cargo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CARGO_EMPLEADO] CHECK CONSTRAINT [FK_CARGO_EMPLEADO_CARGO]
GO
/****** Object:  ForeignKey [FK_CARGO_EMPLEADO_EMPLEADO]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[CARGO_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_CARGO_EMPLEADO_EMPLEADO] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CARGO_EMPLEADO] CHECK CONSTRAINT [FK_CARGO_EMPLEADO_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_ACTIVIDAD_EMPLEADO]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDAD_EMPLEADO] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[EMPLEADO] ([id_Empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDAD_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_ACTIVIDAD_SITIO]    Script Date: 01/26/2016 11:46:51 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDAD_SITIO] FOREIGN KEY([id_Sitio])
REFERENCES [dbo].[SITIO] ([id_Sitio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDAD_SITIO]
GO
