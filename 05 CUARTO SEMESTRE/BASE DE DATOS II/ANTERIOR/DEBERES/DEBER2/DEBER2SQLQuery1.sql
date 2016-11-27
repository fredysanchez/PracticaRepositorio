CREATE DATABASE DEBER2

CREATE TABLE CONDUCTOR (
Nombre varchar(100),
Relacion varchar(30),
CI numeric(10) PRIMARY KEY
)
SELECT * FROM CONDUCTOR 
INSERT INTO CONDUCTOR VALUES ('LUIS LEON','ESTUDIANTE','0203948754')
INSERT INTO CONDUCTOR VALUES ('MAYRA V','VISITANTE','0502840513')
INSERT INTO CONDUCTOR VALUES ('ROSA VILLEGAS','PROFESORA','1798463251')

CREATE TABLE VEHICULO (
Placa varchar(10) PRIMARY KEY,
Color varchar(30),
Tipo varchar(30),
HoraSalida datetime,
HoraIngreso datetime
)
--SELECCION VEHICULO
SELECT * FROM VEHICULO
--ISERCION DE VALORES
INSERT INTO VEHICULO VALUES ('PCS1045','ROJO','MAZDA','10:50','12:36')
INSERT INTO VEHICULO VALUES ('PZE1097','NEGRO','CHEVROLET','10:00','16:12')
INSERT INTO VEHICULO VALUES ('PQL5436','BLANCO','NISSAN','16:50','18:47')


CREATE TABLE INGRESA (
Placa varchar(10),
CI Texto(1),
FOREIGN KEY(Placa) REFERENCES VEHICULO (Placa)/*falha: chave estrangeira*/
)