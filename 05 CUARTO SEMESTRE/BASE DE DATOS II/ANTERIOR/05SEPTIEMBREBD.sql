--BASE DE DATOS DE BIBLIOTECA

CREATE DATABASE BIBLIOTECA 
GO --Siempre poner esto con la finalidad de que primero se ejecute esto}

CREATE TABLE Usuario (
U_codigo char(3) PRIMARY KEY,
U_apellido varchar(100),
U_nombre varchar(100)
)

CREATE TABLE Adulto (
U_codigo char(3) PRIMARY KEY,
foto image,
fechaIngreso date
)

ALTER TABLE Adulto ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)


CREATE TABLE Joven (
U_codigo char(3)PRIMARY KEY,
fechaNacimiento date,
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
fechaReserva date,
UNIQUE(U_codigo,L_codigo,fechaReserva),
FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo),
FOREIGN KEY(L_codigo) REFERENCES Libro (L_codigo)
)

CREATE TABLE Prestamo (
P_codigo int PRIMARY KEY,
U_codigo char(3),
L_codigo char(3),
Cp_nro int,
P_fechaPrestamo date,
P_fechaDevuelve date,
nroDiasPrestamo int,
UNIQUE(L_codigo,Cp_nro,P_fechaPrestamo),
FOREIGN KEY(L_codigo,Cp_nro) REFERENCES CopiaLibro(L_codigo,Cp_nro)
)

ALTER TABLE Prestamo ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)


CREATE TABLE Historico (
U_codigo char(3),
L_codigo char(3),
Cp_nro int,
H_fechaPrestamo date,
H_fechaDevuelve date,
H_nroDiasPrestamo int,
H_multa money,
PRIMARY KEY(L_codigo,Cp_nro,H_fechaPrestamo)
)

ALTER TABLE Historico ADD FOREIGN KEY(L_codigo,Cp_nro) 
REFERENCES copiaLibro (L_codigo,Cp_nro)
ALTER TABLE Historico ADD FOREIGN KEY(U_codigo) REFERENCES Usuario (U_codigo)

SELECT * FROM Usuario
INSERT INTO Usuario VALUES ('U01','ZAPATA','PABLO')
INSERT INTO Usuario VALUES ('U02','ANDRADE','MIRIAM')
INSERT INTO Usuario VALUES ('U03','MARTINEZ','LUIS')
INSERT INTO Usuario VALUES ('U04','ZAPATA','LUCIA')

SELECT * FROM Adulto
INSERT INTO Adulto VALUES ('U01',null,'2001-07-23')
INSERT INTO Adulto VALUES ('U02',null,'2010-12-01')
INSERT INTO Adulto VALUES ('U03',null,'2010-01-15')

SELECT * FROM Joven
insert into Joven VALUES ('U04','2000-02-23','U01')

SELECT * FROM Libro
insert into Libro VALUES ('L01','EL QUIJOTE DE LA MANCHA',1490,'MCGREWHILL','NOVELA')
insert into Libro VALUES ('L02','FUNDAMENTO DE BASE DE DATOS',2006,'MCGREWHILL','INF.')
insert into Libro VALUES ('L03','PROGRAMACION EN JAVA',2005,'LIMUSA','INFORMATICA')
insert into Libro VALUES ('L04','LA REVOLUCION FRANCESA',1990,'LIMUSA','HISTORIA')

SELECT * FROM copiaLibro
INSERT INTO copiaLibro VALUES ('L01',1,'D')
INSERT INTO copiaLibro VALUES ('L01',2,'D')
INSERT INTO copiaLibro VALUES ('L02',1,'D')
INSERT INTO copiaLibro VALUES ('L03',1,'D')
INSERT INTO copiaLibro VALUES ('L03',2,'D')
INSERT INTO copiaLibro VALUES ('L04',1,'D')

SELECT * FROM L_autores 
INSERT INTO L_autores VALUES ('L01','MIGUEL DE CERVANTES')
INSERT INTO L_autores VALUES ('L02','KORTH')
INSERT INTO L_autores VALUES ('L02','SILVERSCHATZ')
INSERT INTO L_autores VALUES ('L03','DEITEL')
INSERT INTO L_autores VALUES ('L04','JOSE DEMBERG')

SELECT * FROM reserva 
INSERT INTO reserva VALUES ('R01','U01','L02','2010-01-01')
INSERT INTO reserva VALUES ('R02','U02','L03','2010-02-21')

SELECT * FROM Prestamo 
INSERT INTO Prestamo VALUES ('PO1','U03','L02',1,'2010-11-25','2010-11-27',1)