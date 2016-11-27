-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CONDUCTOR (
Nombre varchar(100),
Relacion varchar(30),
CI Texto(1) PRIMARY KEY
)

CREATE TABLE VEHICULO (
Placa varchar(10) PRIMARY KEY,
Color varchar(30),
Tipo varchar(30),
HoraSalida datatime,
HoraIngreso datatime
)

CREATE TABLE INGRESA (
Placa varchar(10),
CI Texto(1),
FOREIGN KEY(Placa) REFERENCES VEHICULO (Placa)/*falha: chave estrangeira*/
)

