
--CODIGO SQL

CREATE DATABASE NOMOTICA
Create table [SENSOR]
(
	[Cod_Sensor] Char(5) NOT NULL,
	[Cod_Lugar] Char(5) NOT NULL,
	[Tipo] Char(20) NULL,
Primary Key ([Cod_Sensor])
) 
go

Create table [LUGAR]
(
	[Cod_Lugar] Char(5) NOT NULL,
	[Ubicacion] Char(20) NULL,
	[Habitacion] Char(20) NULL,
	[Temperatura] Float NULL,
	[Movimiento] Char(20) NULL,
Primary Key ([Cod_Lugar])
) 
go

Create table [ACTIVACION]
(
	[Cod_Activacion] Char(5) NOT NULL,
	[Cod_Lugar] Char(5) NOT NULL,
	[Temperatura_Seteada] Float NULL,
	[Fecha_de_Activacion] Datetime NULL,
	[Hora_Inicial] Datetime NULL,
	[Hora_Final] Datetime NULL,
	[Cod_Actuador] Char(5) NOT NULL,
	[Cod_Sensor] Char(5) NOT NULL,
Primary Key ([Cod_Activacion])
) 
go

Create table [ACTUADOR]
(
	[Cod_Actuador] Char(5) NOT NULL,
	[Clase] Char(20) NULL,
	[Tiempo_Activado] Float NULL,
	[Hora_Inicial] Datetime NULL,
	[Hora_Final] Datetime NULL,
Primary Key ([Cod_Actuador])
) 
go

Create table [DISPOSITIVO_TERMINAL]
(
	[Cod_Dispositivo] Char(5) NOT NULL,
	[Tipo] Char(20) NULL,
	[Cod_Lugar] Char(5) NOT NULL,
	[Cod_Actuador] Char(5) NOT NULL,
Primary Key ([Cod_Dispositivo])
) 
go

Create table [APARATO]
(
	[Cod_Aparato] Char(5) NOT NULL,
	[Nombre] Char(25) NULL,
	[Cod_Lugar] Char(5) NOT NULL,
Primary Key ([Cod_Aparato])
) 
go


Alter table [ACTIVACION] add  foreign key([Cod_Sensor]) references [SENSOR] ([Cod_Sensor])  on update no action on delete no action 
go
Alter table [SENSOR] add  foreign key([Cod_Lugar]) references [LUGAR] ([Cod_Lugar])  on update no action on delete no action 
go
Alter table [ACTIVACION] add  foreign key([Cod_Lugar]) references [LUGAR] ([Cod_Lugar])  on update no action on delete no action 
go
Alter table [DISPOSITIVO_TERMINAL] add  foreign key([Cod_Lugar]) references [LUGAR] ([Cod_Lugar])  on update no action on delete no action 
go
Alter table [APARATO] add  foreign key([Cod_Lugar]) references [LUGAR] ([Cod_Lugar])  on update no action on delete no action 
go
Alter table [ACTIVACION] add  foreign key([Cod_Actuador]) references [ACTUADOR] ([Cod_Actuador])  on update no action on delete no action 
go
Alter table [DISPOSITIVO_TERMINAL] add  foreign key([Cod_Actuador]) references [ACTUADOR] ([Cod_Actuador])  on update no action on delete no action 
go





--INSERCIÓN DE DATOS
INSERT INTO LUGAR 
VALUES ('1','Techo','Sala', 15, 'Vertical');
INSERT INTO LUGAR 
VALUES ('2','Pared','Sala', 18, 'Vertical');
INSERT INTO LUGAR 
VALUES ('3','Pared','Cocina', 21, 'Oscilatorio');

INSERT INTO SENSOR 
VALUES ('1','2','Calor');
INSERT INTO SENSOR 
VALUES ('2','2','Calor');
INSERT INTO SENSOR 
VALUES ('3','3','Movimiento');

INSERT INTO ACTUADOR 
VALUES ('1','Clase X',16.2,'12/01/2011 11:00','12/01/2011 12:27');
INSERT INTO ACTUADOR 
VALUES ('2','Clase Y',5.3,'02/12/2010 21:00','02/12/2010 23:00' );
INSERT INTO ACTUADOR 
VALUES ('3','Clase Z',11.8,'15/12/2010 23:00','16/12/2010 00:11');

INSERT INTO ACTIVACION 
VALUES ('1','2',12, '02/12/2010','02/12/2010 21:00','02/12/2010 23:00', 2, 2);
INSERT INTO ACTIVACION 
VALUES ('2','3',08, '25/01/2011','25/01/2011 06:00','25/01/2011 06:18', 2, 1);
INSERT INTO ACTIVACION 
VALUES ('3','2',19, '12/01/2011','12/01/2011 11:00','12/01/2011 12:27', 1, 3);
INSERT INTO ACTIVACION 
VALUES ('4','3',09, '15/12/2010','15/12/2010 23:00','16/12/2010 00:11', 3, 2);
INSERT INTO ACTIVACION 
VALUES ('5','1',13, '02/11/2010','02/11/2010 12:00','02/11/2010 13:02', 2, 1);
INSERT INTO ACTIVACION 
VALUES ('6','2',19, '12/01/2011','12/01/2011 13:00','12/01/2011 13:27', 1, 3);
INSERT INTO ACTIVACION 
VALUES ('7','2',19, '12/01/2011','12/01/2011 10:00','12/01/2011 10:27', 2, 3);
INSERT INTO ACTIVACION 
VALUES ('8','2',19, '12/01/2011','12/01/2011 10:00','12/01/2011 12:29', 3, 3);
INSERT INTO ACTIVACION 
VALUES ('9','2',19, '12/01/2011','12/01/2011 12:00','12/01/2011 12:27', 2, 3);
INSERT INTO ACTIVACION 
VALUES ('10','2',19, '12/01/2011','12/01/2011 11:00','12/01/2011 11:01', 1, 3);
INSERT INTO ACTIVACION 
VALUES ('11','2',19, '12/01/2011','12/01/2011 11:00','12/01/2011 12:07', 3, 3);

INSERT INTO DISPOSITIVO_TERMINAL
VALUES ('1','Luminarias Externas','2', '1');
INSERT INTO DISPOSITIVO_TERMINAL
VALUES ('2','Luminarias Externas','2', '2');
INSERT INTO DISPOSITIVO_TERMINAL
VALUES ('3','Luminarias Internas','3', '1');

INSERT INTO APARATO
VALUES ('1','Termostato','2');
INSERT INTO APARATO
VALUES ('2','Termostato','1');
INSERT INTO APARATO
VALUES ('3','Termostato','2');
INSERT INTO APARATO
VALUES ('4','Termostato','1');
INSERT INTO APARATO
VALUES ('5','Ventilador','2');
INSERT INTO APARATO
VALUES ('6','Termostato','2');
INSERT INTO APARATO
VALUES ('7','Ventilador','3');
INSERT INTO APARATO
VALUES ('8','Ventilador','3');
INSERT INTO APARATO
VALUES ('9','Termostato','2');
INSERT INTO APARATO
VALUES ('10','Ventilador','1');
INSERT INTO APARATO
VALUES ('11','Ventilador','3');
INSERT INTO APARATO
VALUES ('12','Termostato','2');
INSERT INTO APARATO
VALUES ('13','Ventilador','3');


--SELECCIONES DE DATOS

--1.	¿Cuál es el horario de activación de las iluminarias externas?
Select A.Hora_Inicial, A.Hora_Final, D.Tipo
From ACTUADOR A join DISPOSITIVO_TERMINAL D
on A.Cod_Actuador = D.Cod_Actuador
Where D.Tipo = 'Luminarias Externas'

 
--2.	¿Cuántos sensores hay en cada habitación?
Select L.Habitacion, COUNT(S.Cod_Sensor) as NUMERO_DE_SENSORES
From LUGAR L join SENSOR S
on L.Cod_Lugar = S.Cod_Lugar
Group by L.Habitacion
 
--3.	¿Qué sensores se han activado en este mes (enero 2011)?
Select S.Cod_Sensor, A.Fecha_de_Activacion
From ACTIVACION A join SENSOR S
on  S.Cod_Sensor = A.Cod_Sensor
Where  A.Fecha_de_Activacion between '01/01/2011' and '31/01/2011'


--4.	¿Qué sensores se han activado más de cinco veces?
Select A.Cod_Sensor, count(A.Cod_Sensor)as NUMERO_DE_ACTIVACIONES
From ACTIVACION A join SENSOR S
on  S.Cod_Sensor = A.Cod_Sensor
Group by A.Cod_Sensor
Having count(A.Cod_Sensor)> 5
 
--5.	Se requiere un listado de los sensores con sus respectivos actuadores asociados
Select S.Cod_Sensor, A.Cod_Actuador
From SENSOR S INNER JOIN 
ACTIVACION AC ON S.Cod_Sensor = AC.Cod_Sensor INNER JOIN
ACTUADOR A ON AC.Cod_Actuador = A.Cod_Actuador

 
--6.	¿Cuáles son los rangos de temperatura definidos para cada sensor?
Select S.Cod_Sensor, AC.Temperatura_Seteada
From SENSOR S JOIN ACTIVACION AC 
ON S.Cod_Sensor = AC.Cod_Sensor 
 
--7.	En que habitación hay más de 3 ventiladores o termostatos.
Select L.Habitacion, COUNT(A.Cod_Lugar) as VENTILADORES_O_TERMOSTATOS
From LUGAR L join APARATO A
on  L.Cod_Lugar = A.Cod_Lugar
Group By L.Habitacion
Having count(A.Cod_Lugar)> 3

 
--8.	Sume las temperaturas de activación correspondientes al sensor 3.
Select sum(A.Temperatura_Seteada) as Suma_de_Temperaturas
From ACTIVACION A, Sensor S
Where S.Cod_Sensor = '3'
 
--9.	Cuente el número de dispositivos que tienen el actuador de clase X. 
Select count(DS.Cod_Actuador) as Num_Dispositivos
From DISPOSITIVO_TERMINAL DS join ACTUADOR A
on DS.Cod_Actuador = A.Cod_Actuador
Where A.Clase = 'Clase X'

 

--10.	Determinar los actuadores cuyo tiempo activado es mayor que la temperatura.
Select A.Cod_Actuador
From ACTUADOR A join ACTIVACION AC
on A.Cod_Actuador = AC.Cod_Actuador
Where A.Tiempo_Activado >  AC.Temperatura_Seteada
 
