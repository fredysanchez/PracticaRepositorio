create table Pasteles(
	id_pas int not null identity (1,1),
	url_pas nvarchar (150),
	costo_pas decimal(18,2),
	descripcion_pas nvarchar(50),
	constraint PK_id_pass primary key (id_pas)
)

create proc insertarPastel(
	@url_pas nvarchar(150),
	@costo_pas decimal(18,2),
	@descripcion_pas nvarchar(50)	
)
as
	insert into Pasteles (url_pas,costo_pas,descripcion_pas) values(@url_pas,@costo_pas,@descripcion_pas)
	
create proc borrarPastel(
	@id_pas int	
)
as
	delete Pasteles where id_pas=@id_pas
	
create proc modificarPastel(
	@id_pas int	,
	@url_pas nvarchar(150),
	@costo_pas decimal(18,2),
	@descripcion_pas nvarchar(50)	
)
as
	update  Pasteles set url_pas=@url_pas, costo_pas=@costo_pas, descripcion_pas=@descripcion_pas
	where id_pas=@id_pas
	
create proc obtenerPastel
as
	select * from Pasteles
	
create proc obtenerPastelPorId
(
	@id_pas int
)
as
	select * from Pasteles
	where id_pas=@id_pas