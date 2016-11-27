--BASE DE DATOS DE BIBLIOTECA
--DROP DATABASE BIBLIOTECA 
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
P_codigo char (3) PRIMARY KEY,
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

SELECT * FROM Usuario
INSERT INTO Usuario VALUES ('U01','ZAPATA','PABLO')
INSERT INTO Usuario VALUES ('U02','ANDRADE','MIRIAM')
INSERT INTO Usuario VALUES ('U03','MARTINEZ','LUIS')
INSERT INTO Usuario VALUES ('U04','ZAPATA','LUCIA')

SELECT * FROM Adulto
INSERT INTO Adulto VALUES ('U01',null,'2010-07-10')
INSERT INTO Adulto VALUES ('U02',null,'2010-12-01')
INSERT INTO Adulto VALUES ('U03',null,'2010-01-11')

SELECT * FROM Joven
insert into Joven VALUES ('U04','2000-02-03','U01')


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
INSERT INTO reserva VALUES ('R02','U02','L03','2010-02-12')

SELECT * FROM Prestamo 
INSERT INTO Prestamo VALUES ('PO1','U03','L02',1,'2010-11-05','2010-11-07',1)
INSERT INTO Prestamo VALUES ('PO2','U01','L02',1,'2010-08-08','2010-08-09',1)
INSERT INTO Prestamo VALUES ('PO3','U01','L02',1,'2010-08-08','2010-08-09',1)

--DEBER
select * from Usuario
SELECT * FROM Joven
SELECT * FROM Libro
SELECT * FROM copiaLibro
SELECT * FROM L_autores 
SELECT * FROM reserva 
select * from Prestamo


--1. Desplegar el nombre de los usuarios que pidieron prestado el libro "Fundamentos de bases de datos" de Korth 
--el mes de agosto del 2011.
select * from Libro 
select * from Prestamo
select * from Usuario


SELECT U_nombre, titulo,L_autor, P_fechaPrestamo
FROM Libro Li INNER JOIN Prestamo Pr
ON Li.L_codigo = Pr.L_codigo
INNER JOIN dbo.Usuario Us
ON Us.U_codigo = Pr.U_codigo
INNER JOIN L_autores LiAu
ON LiAu.L_codigo = Li.L_codigo
WHERE MONTH(P_fechaPrestamo)=8 AND YEAR(P_fechaPrestamo)=2011 AND L_autor = 'Korth'




--2. Desplegar todos los títulos de los libros que no se han prestado.
SELECT * FROM Libro
SELECT * FROM copiaLibro








--3. Nombre y apellido de cada autor con el número de libros escritos ordenado de mayor a menor.


SELECT * FROM Libro
SELECT * FROM copiaLibro

select count (li.L_codigo) as "LIBROS ESCRITO", li.L_autor
from li.L_autores = b.L_codigo
Group by li.L_autor
having  count (li.L_codigo)desc

--4. Nombre y apellido de los usuarios que no han entregado los libro a tiempo.
select * from Prestamo
select * from Usuario
select * from Prestamo, Usuario where Prestamo.U_codigo = Usuario.U_codigo
and datediff(dd,Prestamo.P_fechaPrestamo, Prestamo, P_fechaDevuelve)>
(SELECT nroDiasPrestamo from Prestamo) 



--5. Título de los libros que están reservados por mas de 5 dias.

--6. Nombre y apellido del autor que ha escrito mas libros.



--7. Título de cada libro junto con el número de veces que se ha prestado.
select count libro 



--8. Copias del libro Programación de Deitel que están disponibles.



--9. Nombres y apellidos de los jóvenes que han hecho reservaciones.




--10. Nombre y apellido de los deudores con su deuda acumulada.