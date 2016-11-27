/****** Objecto: Base de Datos******/

create database epn_Facturacion1
go
use epn_Facturacion1
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
	idFactura int not null ,
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

create  trigger tr_detalleFactura
on detallefactura
for insert 
as
begin
	
	declare @iddetalle as int
	declare @idfactura as int
	declare @idProducto as int
	declare	@valorproducto as money
	declare @cantidad as int
		
	select 
	@iddetalle=inserted.id,
	@idfactura= inserted.idFactura,
	@idProducto=inserted.idProducto, 
	@cantidad=inserted.cantidad,
	@valorproducto=producto.valorunitario 
	from inserted inner join producto
	on inserted.idProducto=producto.id
	
	if exists(select p.stock from producto p where p.id=@idProducto and p.stock>=1)
		begin
			declare @a as int
			declare @b as int
			set @a=@cantidad-(select p.stock from producto p where p.id=@idProducto)
			set @b=@cantidad-@a
			insert into detallefactura values(@idfactura,@idProducto,@b,0)
			
			/*Actualizar stock en producto*/
			update producto
			set stock=stock-@cantidad
			where id=@idProducto
			
			/*Actualizar subtotal en detallefactura*/
			update detallefactura
			set subtotal=@cantidad*@valorproducto
			where id=@iddetalle
			
			/*Actualizar total en factura*/
			update factura
			set total=(select sum(d.subtotal) from detallefactura d where @idfactura=d.idFactura)
			where id=@idfactura
		end	
	else
		begin
			print 'No existen suficientes productos en stock'	
		end
end	
	
			

/****** Insercion de Datos ******/

insert into cliente values('1752634582','Juan','Espin')
insert into cliente values('1752635894','Carlos','Perez')
insert into cliente values('1452879635','Andres','Lopez')

insert into producto values('Desktop',800,40)
insert into producto values('Portatil',1200,30)
insert into producto values('Proyector',750,30)

insert into factura values(1,GETDATE(),0)
insert into factura values(2,GETDATE(),0)
insert into factura values(3,GETDATE(),0)

insert into detallefactura values(1,1,10,0)
insert into detallefactura values(1,2,7,0)
insert into detallefactura values(1,3,8,0)

insert into detallefactura values(2,1,5,0)
insert into detallefactura values(2,2,7,0)
insert into detallefactura values(2,3,2,0)

insert into detallefactura values(3,1,30,0)
insert into detallefactura values(3,2,45,0)

/****** Selecciones ******/

select *from dbo.cliente
select *from dbo.detallefactura
select *from dbo.factura
select *from dbo.producto



