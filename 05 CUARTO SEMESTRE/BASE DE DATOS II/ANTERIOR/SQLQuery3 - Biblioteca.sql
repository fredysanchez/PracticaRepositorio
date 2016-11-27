--BASE DE DATOS DE BIBLIOTECA
--ROBERTO CARLOS TOAPANTA

USE master

CREATE DATABASE BIBLIOTECA
GO

USE BIBLIOTECA
GO

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
--P_codigo int PRIMARY KEY,
P_codigo char(3) PRIMARY KEY,
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



SELECT * FROM dbo.copiaLibro
SELECT * FROM dbo.Historico
SELECT * FROM dbo.Joven
SELECT * FROM dbo.L_autores
SELECT * FROM dbo.Libro
SELECT * FROM dbo.Prestamo
SELECT * FROM dbo.reserva



INSERT INTO Usuario VALUES('U01','Zapata','Pablo')
INSERT INTO Usuario VALUES('U02','Andrade','Miriam')
INSERT INTO Usuario VALUES('U03','Marinez','Luis')
INSERT INTO Usuario VALUES('U04','Zapata','Lucia')
SELECT * FROM dbo.Usuario

INSERT INTO Adulto VALUES('U01',NULL,'2001-23-07')
INSERT INTO Adulto VALUES('U02',NULL,'2001-12-01')
INSERT INTO Adulto VALUES('U03',NULL,'2001-15-01')
SELECT * FROM dbo.Adulto
DELETE FROM Adulto

INSERT INTO Joven VALUES('U04','2000-23-02','U01')
DELETE Joven
INSERT INTO Libro VALUES('L01','El Quijote de la mancha',1490,'McGrawHill','Novela') 
INSERT INTO Libro VALUES('L02','Fundamentos de Bases de Datos',2006,'McGrawHill','Informática') 
INSERT INTO Libro VALUES('L03','Programación en Java',2005,'Limusa','Informática') 
INSERT INTO Libro VALUES('L04','La Revolución Francesa',1990,'Limusa','Historia') 

INSERT INTO copiaLibro VALUES('L01',1,'D')
INSERT INTO copiaLibro VALUES('L01',2,'D')
INSERT INTO copiaLibro VALUES('L02',1,'D')
INSERT INTO copiaLibro VALUES('L03',1,'D')
INSERT INTO copiaLibro VALUES('L03',2,'D') 
INSERT INTO copiaLibro VALUES('L04',1,'D')

DELETE copiaLibro

INSERT INTO L_autores VALUES('L01','Miguel de Cervantes')
INSERT INTO L_autores VALUES('L02','Korth')
INSERT INTO L_autores VALUES('L02','Silverschatz')
INSERT INTO L_autores VALUES('L03','Deitel')
INSERT INTO L_autores VALUES('L04','José Demberg')

SELECT * FROM L_autores

INSERT INTO reserva VALUES('R01','U01','L02','2010-01-01')
INSERT INTO reserva VALUES('R02','U02','L03','2010-21-02')

SELECT * FROM reserva

INSERT INTO Prestamo VALUES('P01','U03','L02',1,'2010-25-11','2010-27-11',1)
SELECT * FROM Prestamo 

--CONSULTAS
--Desplegar el nombre de los usuarios que pidieron prestado el libro "Fundamentos de bases de datos" 
--de Korth el mes de agosto del 2011.
SELECT * FROM Libro
SELECT * FROM L_autores
SELECT * FROM Prestamo
SELECT * FROM Usuario

 
SELECT U_nombre, titulo,L_autor, P_fechaPrestamo
FROM dbo.Libro l INNER JOIN dbo.Prestamo p
ON l.L_codigo = p.L_codigo
INNER JOIN dbo.Usuario u
ON u.U_codigo = p.U_codigo
INNER JOIN dbo.L_autores l_a
ON l_a.L_codigo = l.L_codigo
WHERE MONTH(P_fechaPrestamo)=11 AND YEAR(P_fechaPrestamo)=2010 AND L_autor = 'Korth'



