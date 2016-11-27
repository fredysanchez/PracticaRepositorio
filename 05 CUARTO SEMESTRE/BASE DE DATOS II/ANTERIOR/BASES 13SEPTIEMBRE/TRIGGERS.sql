--BASE DE DATOS DE BIBLIOTECA


create database biblioteca
drop database biblioteca

CREATE TABLE Usuario (
U_codigo char(3) PRIMARY KEY,
U_apellido varchar(100),
U_nombre varchar(100)
)

CREATE TABLE Adulto (
U_codigo char(3) PRIMARY KEY,
foto image,
fechaIngreso datetime
)

ALTER TABLE Adulto ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)


CREATE TABLE Joven (
U_codigo char(3)PRIMARY KEY,
fechaNacimiento datetime,
codigoGarante char(3)references Adulto(U_codigo)
)

ALTER TABLE Joven ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)

CREATE TABLE Libro (
L_codigo char(3) PRIMARY KEY,
titulo varchar(100),
L_añoPublicacion int,
L_editorial varchar(100),
L_tipo varchar(100)
)

CREATE TABLE copiaLibro (
L_codigo char(3),
Cp_nro int,
Cp_estado char(1),
PRIMARY KEY(L_codigo,Cp_nro),
FOREIGN KEY(L_codigo) REFERENCES Libro (L_codigo)
)

CREATE TABLE L_autores (
L_codigo char(3),
L_autor varchar(100),
PRIMARY KEY(L_codigo,L_autor),
FOREIGN KEY(L_codigo) REFERENCES Libro(L_codigo)
)

CREATE TABLE reserva (
R_codigo char(3) PRIMARY KEY,
U_codigo char(3),
L_codigo char(3),
fechaReserva datetime,
UNIQUE(U_codigo,L_codigo,fechaReserva),
FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo),
FOREIGN KEY(L_codigo) REFERENCES Libro (L_codigo)
)


CREATE TABLE Prestamo (
P_codigo int PRIMARY KEY,
U_codigo char(3),
L_codigo char(3),
Cp_nro int,
P_fechaPrestamo datetime,
P_fechaDevuelve datetime,
nroDiasPrestamo int,
UNIQUE(L_codigo,Cp_nro,P_fechaPrestamo),
FOREIGN KEY(L_codigo,Cp_nro) REFERENCES CopiaLibro(L_codigo,Cp_nro)
)

ALTER TABLE Prestamo ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)


CREATE TABLE Historico (
U_codigo char(3),
L_codigo char(3),
Cp_nro int,
H_fechaPrestamo datetime,
H_fechaDevuelve datetime,
H_nroDiasPrestamo int,
H_multa money,
PRIMARY KEY(L_codigo,Cp_nro,H_fechaPrestamo)
)

ALTER TABLE Historico ADD FOREIGN KEY(L_codigo,Cp_nro) 
REFERENCES copiaLibro (L_codigo,Cp_nro)
ALTER TABLE Historico ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)



insert into Usuario values('U01','Zapata','Pablo')
insert into Usuario values('U02','Andrade','Mirian')
insert into Usuario values('U03','Martinez','Luis')
insert into Usuario values('U04','Zapata','Lucia')


insert into Adulto values ('U02',null,'2010-12-01')
insert into Adulto values ('U01',null,'2010-12-01')
insert into Adulto values ('U03',null,'2010-01-12')

insert into Joven values ('U04','2000-23-02','U01')

insert into Libro values ('L01','El Quijote de la Mancha',1490,'McGrawHill','Novela')
insert into Libro values ('L02','Fundamentos de Base de Datos',2006,'McGrawHill','Informatica')
insert into Libro values ('L03','Programacion en Java',2005,'Limusa','Informatica')
insert into Libro values ('L04','Larevolucion Francesa',1990,'Limusa','Historia')

insert into copiaLibro values ('L01',1,'D')
insert into copiaLibro values ('L01',2,'D')
insert into copiaLibro values ('L02',1,'D')
insert into copiaLibro values ('L03',1,'D')
insert into copiaLibro values ('L03',2,'D')
insert into copiaLibro values ('L04',1,'D')


insert into L_autores values('L01','Miguel de Cervantes')
insert into L_autores values('L02','Korth')
insert into L_autores values('L02','Silverschatz')
insert into L_autores values('L03','Deitel')
insert into L_autores values('L04','Jose Demberg')


insert into reserva values ('R01','U01','L02','2010-01-01')
insert into reserva values ('R02','U02','L03','2010-21-02')

--insert into Prestamo values('P01','U03','L02',1,'2011-25-11','2011-27-12',1)
--insert into Prestamo values('P02','U02','L02',1,'2011-25-08','2011-27-08',2)




--?=============================TRIGER================================================================

/* 1. Siempre que se inserta una fila en la tabla PRESTAMO,en la tabla COPIAlibro se cambia a estado='P' 
(Estado =P cuando la copia del libro esta p`restado, estado=D cuando la copia del libro esta disponible)*/


select * from copialibro
select * from prestamo


create trigger tr_insert_prestamo
on PRESTAMO
after insert
as
update COPIALIBRO set Cp_estado='P' from COPIALIBRO C, INSERTED I --inserted es una tabla temporal que guarda las filas que se han insertado en este caso en la tabla prestamo
where C.L_CODIGO=I.L_CODIGO and C.Cp_nro=I.Cp_nro

select * from copialibro
select * from prestamo


insert into prestamo values(1,'U01','L01',1,GETDATE(),null,1)

insert into prestamo values(2,'U02','L01',2,GETDATE(),null,1)

insert into Prestamo values(3,'U03','L04',1,'2011-11-09',NULL,3)



