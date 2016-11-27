/****** Objecto: Base de Datos******/

create database epn_Facturacion
go
use epn_Facturacion
go

/****** Objecto: Tablas******/

create table cliente
(
	id int identity(1,1) not null primary key,
	ci_ruc nvarchar(10)  not null,
	nombre nvarchar (25) not null,
	apellido nvarchar(25) not null
)

create table factura
(
	id int identity(1,1) not null primary key,
	idCliente int not null,
	fecha date not null,
	total money not null
)

create table producto
(
	id int identity(1,1) not null primary key,
	nombre nvarchar(25)not null,
	valorunitario money not null default 0,
	stock int not null
)

create table detallefactura
(
	id int identity(1,1) not null primary key,
	idFactura int not null,
	idProducto int not null,
	cantidad int not null,
	subtotal money not null
)

/****** Actualizaciones en Cascada ******/

alter table factura  with check add  constraint FK1 foreign key(idCliente)
references cliente(id)
on update cascade
on delete cascade
go

alter table detallefactura  with check add  constraint FK2 foreign key(idFactura)
references factura(id)
on update cascade
on delete cascade
go

alter table detallefactura  with check add  constraint FK3 foreign key(idProducto)
references producto(id)
on update cascade
on delete cascade
go

/****** Triggers ******/

alter trigger tr_detalleFactura
on detallefactura
for insert 
as
begin
	
	declare @iddetalle as int
	declare @idfactura as int
	declare @idProducto as int
	declare	@valorproducto as money
	declare @cantidad as int
	declare @stock as int
	
	select 
	@iddetalle=inserted.id,
	@idfactura= inserted.idFactura,
	@idProducto=inserted.idProducto, 
	@cantidad=inserted.cantidad,
	@valorproducto=producto.valorunitario,
	@stock=producto.stock
	from inserted inner join producto
	on inserted.idProducto=producto.id 
	
	--Si el stock es 0 tenmos que  borras el detalle que se inserto un producto sin stock
	
	if(@stock=0 or @cantidad>@stock)
	begin
		delete from detallefactura
		where id=@iddetalle
	end
	else
		begin
			/*Actualizar subtotal en detallefactura*/
			update detallefactura
			set subtotal=@cantidad*@valorproducto
			where id=@iddetalle
			
			/*Actualizar stock en productos */	
			update producto
			set stock=stock-@cantidad
			where id=@idProducto	
				
			/*Actualizar total en factura*/
			update factura
			set total=total+(@cantidad*@valorproducto)
			where id=@idfactura
		end	
end


alter trigger tr_AumentoStock
on detallefactura
for delete 
as
begin
	
	declare @idProducto as int
	declare @idfactura as int
	declare @cantidad as int
	declare @sub as money
	
	select 
		@idProducto=deleted.idProducto,
		@idfactura=deleted.idFactura,
		@sub=deleted.subtotal,
		@cantidad=deleted.cantidad
	from 
		deleted 
			
	/*Actualizar stock en productos */	
	update producto
	set stock=stock+@cantidad
	where id=@idProducto	
	
	/*Disminuir el valor total de la factura*/	
	update factura
	set total =total-@sub
	where id=@idFactura		
end



exec sp_depends detallefactura

/****** Insercion de Datos ******/

insert into cliente values('1752634582','Juan','Espin')
insert into cliente values('1752635894','Carlos','Perez')
insert into cliente values('1452879635','Andres','Lopez')

insert into producto values('Desktop',800,4)
insert into producto values('Portatil',1200,3)
insert into producto values('Proyector',750,3)

insert into factura values(1,GETDATE(),0)
insert into factura values(2,GETDATE(),0)
insert into factura values(3,GETDATE(),0)

insert into detallefactura values(1,1,10,0)
insert into detallefactura values(1,2,7,0)
insert into detallefactura values(1,3,5,0)

insert into detallefactura values(2,1,5,0)
insert into detallefactura values(2,2,3,0)
insert into detallefactura values(2,3,2,0)

insert into detallefactura values(3,1,2,0)
insert into detallefactura values(3,2,3,0)

delete detallefactura where id=12


/****** Selecciones ******/

select *from dbo.cliente
select *from dbo.detallefactura
select *from dbo.factura
select *from dbo.producto



