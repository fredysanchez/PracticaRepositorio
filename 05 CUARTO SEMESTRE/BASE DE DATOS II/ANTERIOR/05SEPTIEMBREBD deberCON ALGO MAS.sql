--BASE DE DATOS DE BIBLIOTECA
--DROP DATABASE BIBLIOTECA 

----------------*******BASES II --------MAYRA VIZCAINO******----------------
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
FOREIGN KEY(L_codigo,Cp_nro) REFERENCES copiaLibro(L_codigo,Cp_nro)
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
insert into Libro VALUES ('L05','LA REVOLUCION ',2010,'ALFONSO','HIST.')
insert into Libro VALUES ('L07','Programación de Deitel ',2000,'MAYA','INFORMATICA.')




SELECT * FROM copiaLibro
INSERT INTO copiaLibro VALUES ('L01',1,'D')
INSERT INTO copiaLibro VALUES ('L01',2,'D')
INSERT INTO copiaLibro VALUES ('L02',1,'D')
INSERT INTO copiaLibro VALUES ('L03',1,'D')
INSERT INTO copiaLibro VALUES ('L03',2,'D')
INSERT INTO copiaLibro VALUES ('L04',1,'D')
INSERT INTO copiaLibro VALUES ('L05',1,'P')
INSERT INTO copiaLibro VALUES ('L06',1,'P')
INSERT INTO copiaLibro VALUES ('L07',3,'D')




SELECT * FROM L_autores 
INSERT INTO L_autores VALUES ('L01','MIGUEL DE CERVANTES')
INSERT INTO L_autores VALUES ('L02','KORTH')
INSERT INTO L_autores VALUES ('L02','SILVERSCHATZ')
INSERT INTO L_autores VALUES ('L03','DEITEL')
INSERT INTO L_autores VALUES ('L04','JOSE DEMBERG')

SELECT * FROM reserva 
INSERT INTO reserva VALUES ('R01','U01','L02','2010-01-01')
INSERT INTO reserva VALUES ('R02','U02','L03','2010-02-12')

--drop table Prestamo
SELECT * FROM Prestamo 
INSERT INTO Prestamo VALUES ('PO1','U03','L01',1,'2010-11-05','2010-11-07',1)
INSERT INTO Prestamo VALUES ('PO2','U01','L02',1,'2010-08-08','2010-08-09',2)
INSERT INTO Prestamo VALUES ('PO3','U02','L04',1,'2011-08-08','2011-08-08',1)
INSERT INTO Prestamo VALUES ('PO4','U03','L01',1,'2011-09-25','2011-09-27',1)
INSERT INTO Prestamo VALUES ('PO5','U04','L03',1,'2011-09-25','2011-09-30',1)
INSERT INTO Prestamo VALUES ('PO6','U04','L03',1,'2011-09-25','2011-09-30',1)



insert into Historico values ('U01','L02','1','2011-09-25','2011-09-30','10')
--DEBER
select * from Usuario
SELECT * FROM Joven
SELECT * FROM Libro
SELECT * FROM copiaLibro
SELECT * FROM L_autores 
SELECT * FROM reserva 
select * from Prestamo
select * from Historico


--1. Desplegar el nombre de los usuarios que pidieron prestado el libro 
--"Fundamentos de bases de datos" de Korth 
--el mes de agosto del 2011.

SELECT U_nombre, titulo,L_autor, P_fechaPrestamo
FROM dbo.Libro l INNER JOIN dbo.Prestamo p
ON l.L_codigo = p.L_codigo
INNER JOIN dbo.Usuario u
ON u.U_codigo = p.U_codigo
INNER JOIN dbo.L_autores l_a
ON l_a.L_codigo = l.L_codigo
WHERE MONTH(P_fechaPrestamo)=08 AND YEAR(P_fechaPrestamo)=2010 AND L_autor = 'Korth'





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
WHERE MONTH(P_fechaPrestamo)=08 AND YEAR(P_fechaPrestamo)=2010 AND
L_autor = 'Korth'

Li.titulo = 'FUNDAMENTOS DE BASE DE DATOS'



SELECT U_nombre, titulo,L_autor, P_fechaPrestamo
FROM Libro Li INNER JOIN Prestamo Pr
ON Li.L_codigo = Pr.L_codigo
INNER JOIN dbo.Usuario Us
ON Us.U_codigo = Pr.U_codigo
INNER JOIN dbo.L_autores LiAu
ON LiAu.L_codigo = Li.L_codigo
WHERE MONTH(P_fechaPrestamo)=11 AND YEAR(P_fechaPrestamo)=2010 AND 
L_autor = 'MCGREWHILL'


Li.titulo = 'FUNDAMENTOS DE BASE DE DATOS'

L_autor = 'MCGREWHILL'


SELECT * FROM L_autores 
select * from Libro 
select * from Prestamo
select * from Usuario

select * from Usuario inner join Prestamo 
on Usuario.U_codigo= Prestamo.U_codigo
where Prestamo.L_codigo IN (select L_codigo from Libro  where Libro.titulo like 
'FUNDAMENTOS DE BASE DE DATOS'  )
and Month (Prestamo.P_fechaPrestamo)= 08 and Year (Prestamo.P_fechaPrestamo)= 2010


--2. Desplegar todos los títulos de los libros que no se han prestado.
SELECT * FROM Libro
SELECT * FROM copiaLibro

SELECT titulo
FROM copiaLibro Cl INNER JOIN Libro Li
ON Cl.L_codigo = Li.L_codigo
WHERE Cp_estado = 'D'
GROUP BY Li.titulo

--3. Nombre y apellido de cada autor con el número de libros escritos ordenado de mayor a menor.


SELECT * FROM Libro
SELECT * FROM copiaLibro
SELECT * FROM Prestamo
SELECT * FROM L_autores 


SELECT COUNT (La.L_codigo) AS "Numero Libros", L_autor
FROM L_autores La INNER JOIN copiaLibro Cl
ON La.L_codigo = Cl.L_codigo
GROUP BY L_autor
ORDER BY "Numero Libros" DESC 


--4. Nombre y apellido de los usuarios que no han entregado los libro a tiempo.
SELECT * FROM dbo.Prestamo
SELECT * FROM dbo.Usuario

SELECT U_nombre, U_apellido, P_fechaDevuelve
FROM dbo.Prestamo p INNER JOIN dbo.Usuario u
ON p.U_codigo = u.U_codigo
WHERE (p.P_fechaPrestamo + nroDiasPrestamo) <= P_fechaDevuelve



--5. Título de los libros que están reservados por mas de 5 dias.
SELECT * FROM Libro
SELECT * FROM reserva

select * from Libro,reserva
where Libro.L_codigo= reserva.L_codigo
and  DATEDIFF(DAY,reserva.fechaReserva,getdate() )> 5 

--6. Nombre y apellido del autor que ha escrito mas libros.
SELECT * FROM Libro
SELECT * FROM copiaLibro
SELECT * FROM Prestamo
SELECT * FROM L_autores 

select count(L_autores.L_codigo) as NumeroLibro,L_autores.L_Autor  from L_autores, Libro
 where  L_autores.L_codigo = Libro.L_codigo
group by L_autores.L_Autor
having count(L_autores.L_codigo) >= all 
(select count (L_autores.L_codigo) from L_autores
group by L_autores.L_codigo)



--7. Título de cada libro junto con el número de veces que se ha prestado.

select * from Prestamo
select * from Libro

Select Prestamo.nroDiasPrestamo,Libro.titulo, Libro.L_codigo 
From Prestamo, Libro Where Prestamo.L_codigo=Libro.L_codigo

--8. Copias del libro Programación de Deitel que están disponibles.
SELECT * FROM Libro
SELECT * FROM copiaLibro


Select Sum(Cp_nro) as "COPIAS DISPONIBLES DE Programación de Deitel " From copiaLibro
 Where L_codigo like 'L07'


--9. Nombres y apellidos de los jóvenes que han hecho reservaciones.

select * from Usuario
SELECT * FROM reserva
 select * from Joven
select * from Adulto




INSERT INTO dbo.Joven VALUES('U02','2000-23-02','U02')

select Us.U_nombre, Us.U_apellido
from Usuario Us inner join Joven Jo
on Us.U_codigo=Jo.U_codigo
inner join reserva Re
on Re.U_codigo=Us.U_codigo


select * from Joven
INSERT INTO dbo.reserva VALUES('R01','U01','L02','2010-10-12')
INSERT INTO dbo.reserva VALUES('R02','U02','L03','2010-11-02')
INSERT INTO dbo.reserva VALUES('R03','U03','L04','2010-09-08')

INSERT INTO dbo.Joven VALUES('U02','2000-02-02','U02')




select a.U_nombre, a.U_apellido
from usuario a inner join joven b 
on a.U_codigo=b.U_codigo
inner join reserva c 
on c.U_codigo=a.U_codigo





--10. Nombre y apellido de los deudores con su deuda acumulada.

select * from Usuario
select * from Historico

SELECT U_nombre,U_apellido FROM Historico AS H INNER JOIN Usuario AS U
ON H.U_codigo =U.U_codigo AND H_multa<>0 



INSERT INTO Historico VALUES('U03','L02',1,'2010-10-11','2010-12-11',1,100)
INSERT INTO Historico VALUES('U01','L01',1,'2010-08-11','2010-09-11',1,50)