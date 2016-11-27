create database DEBER1
use DEBER1

drop table ESTUDIANTE
drop table CARRERA

CREATE TABLE ESTUDIANTE 

(ci char(10) primary key,
telefono varchar(10) not null DEFAULT  'NO TIENE',--QUE POR DEFECTO SI EL ESTUDIANTE NO TIENE TELEFONO APARESCA NO TIENE
nombre_estudiante varchar(100),
codigo_estudiante varchar(10),
)
SELECT * FROM ESTUDIANTE

INSERT INTO ESTUDIANTE VALUES ('1708953633','095055928','EULALIA RUIZ','010')
INSERT INTO ESTUDIANTE VALUES ('1705258633','095099928','JUAN VIZCAINO','018')
INSERT INTO ESTUDIANTE VALUES ('5502840515','083479911','MAYRA VIZCAINO','200811')


INSERT INTO ESTUDIANTE VALUES ('1708963325','','�JOYS VIZCAINO','201011')
INSERT INTO ESTUDIANTE VALUES ('1789534258','VICTOR NARVAEZ','895711')

CREATE TABLE CARRERA (
nombre_carrera varchar(100)UNIQUE,
codigo_carrera varchar(10) primary key
)

SELECT * FROM CARRERA 

INSERT INTO CARRERA VALUES ('INGENIERIA ELECTRONICA','C01')
INSERT INTO CARRERA VALUES ('INGENIERIA SISTEMAS','C02')
INSERT INTO CARRERA VALUES ('INGENIERIA MECANICA','C03')


--QUE POR DEFECTO SI EL ESTUDIANTE NO TIENE TELEFONO APARESCA NO TIENE
INSERT INTO ESTUDIANTE VALUES ('1789534258','default','VICTOR NARVAEZ','895711')

--QUE EL NOMBRE DEL CAMPO codigo carrera no se repita
alter table CARRERA foreign key (codigo_carrera) references carrera (codigo_carrera);

INSERT INTO CARRERA VALUES ('INGENIERIA ELECTRONICA','C04')

--ci solo reciba 10 digitos ni mas ni menos
alter table ESTUDIANTE add constraint ci check(ci between 0100000000 and 2499999999);
--2DA FORMA
CHECK (ci > 0100000000 and ci < 2199999999)
--3era forma de  hacer
check 
check (substring(ci,1,2)>=01 and substring (ci,1,2)<=24)


select SUBSTRING (ci,1,2)from ESTUDIANTE
--4ta forma Y LA QUE SALIO
alter table ESTUDIANTE
add constraint ck_ci check (substring (ci,1,2)>='01'and substring (ci,1,2)<='24'
and ci like '[0-9] [0-9] [0-9] [0-9] [0-9][0-9] [0-9] [0-9] [0-9] [0-9]')

INSERT INTO ESTUDIANTE VALUES ('0934567890','miguel',null,'c03') 

--para borrar 
delete from ESTUDIANTE where ci like '1789953631'



INSERT INTO ESTUDIANTE VALUES ('1789953631','EDDY NARVAEZ','89122')

INSERT INTO ESTUDIANTE VALUES ('0509534258','VICTOR NARVAEZ','895711')






--RESTRICCION QUE EL CODIGO CARRERA INICIE CON UNA C
alter table carrera add constraint codigo_carrera check(codigo_carrera like 'c%');
INSERT INTO CARRERA VALUES ('INGENIERIA AMBIENTAL','N03')


