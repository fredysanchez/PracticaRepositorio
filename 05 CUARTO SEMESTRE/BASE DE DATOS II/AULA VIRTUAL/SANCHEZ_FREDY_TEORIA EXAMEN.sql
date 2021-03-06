--BASE DE DATOS.-
	--Conjunto de datos homogéneos, ordenados de una forma estructurada que se presenta en forma
	--legible por ordenador y se refiere a una materia determinada, organización o problema.
	--Conjunto de datos consistente y usualmente persistente, organizado en un modo sistemático específico que
	--permita acceder a su contenido de forma pertinente, fácil y rápida.
	
--SISTEMA DE GESTION DE BASE DE DATOS.-
	--Software desarrollado a partir de programas y archivos interrelacionados.
	--El sistema de base de datos se divide en módulos que tratan cada una de las responsabilidades
	--del sistema global. Es el responsable de mantener la estructura de la base de datos, lo que incluye:
		--• El mantenimiento de las relaciones entre los datos de la base de datos.
		--• La garantía de que los datos estén correctamente almacenados y de que no se infrinjan
			--las reglas que definen las relaciones entre los datos.
		--• La recuperación de todos los datos hasta un punto coherente en caso de fallos del sistema.
	--Un DBMS debe garantizar:
	--INTEGRIDAD, debe asegurar que la información que se almacena en la BD es exacta 
		--y que no es posible que se corrompa por el uso o a lo largo del tiempo.
	--DISPONIBILIDAD, la BD debe estar disponible para almacenar, modificar o recuperar información,
		-- en cualquier momento
		--Concurrencia, la BD debe permitir el acceso simultáneo a la información que contiene, a muchos usuarios.
	--ESCALABILIDAD, la BD debe permitir almacenar grandes cantidades de información y facilitar 
		--el acceso a los datos a gran velocidad, aunque aumente la información almacenada,
		--el número de usuarios o la actividad de los mismos.
		--Seguridad, que incluye aspectos como: asegurar la confidencialidad de la información, controlar los privilegios de acceso a los datos por parte de los usuarios, garantizar la recuperación de la información en caso de accidentes o desastres, naturales o provocados.
	
--PROCEDIMIENTO ALMACENADO.-
	--Conjunto de intrucciones en SQL que se ejecutan con un nombre se utiliza 
	--cuando en muchas ocaciones tenemos que ejecutar un mismo conjunto de instrucciones.
	--Se utlizan con frecuencia tanto para administracion como para ingreso de datos,
	--consultas y tambien para ejecutar programas.
	
--TRIGGERS(DESENCADENADORES o DISPARADORES).- 
	--Son porciones de codigo en SQL o en cuelaquier lenguaje que se ejecutan en forma automatica
	--cuando se realizan una insercion, una actualizacion o un borrado en una tabla.
	--Son muy utiles para mantener la integridad de los datos.
	
--INSERTED.- 
	--Es una tabla temporal donde se almacena las ultimas filas que fueron insertadas en una tabla.

--DELETEC.-
	--Es una tabla temporal donde se almacena determinadas filas que han sido eliminadas en una tabla.
	
--TRIGGERS INSTEAD OF (EN VEZ DE).-
	-- Estos triggers ejecutan un grupo de instrucciones automaticamente cuando se trata de insertar,
	-- actualizar o borrar una fila de una tabla, pero estas instrucciones se ejecutan en vez de la inserción,
	-- actualización o borrado.
	
--VISTAS.-
	--ENMASCARAR.- Mostrar al usuario solo las entidades determinadas, ocultar campos de una tabla.
	--Son tablas virtuales que nos sirven para variados propositos, entre ellos:
		--1.- Por seguridad, para ocultar de ciertos usuarios columnas o filas de una tabla que
		--contienen informacion confidencial
		--2.- Para mantener un reporte muy utilizado que es my costoso de realizarlo para el sistema.
		--3.- Para mantener tablas anteriores que son utilizadas en una aplicacion una vez 
		--que el esquema de la BD ha cambiado

--CURSORES.-
	--Los cursores permiten realizar operaciones sobre filas individuales de una tabla o sobre
	--filas que resultan de una consulta.
	--Los cursores permiten realizar operaciones sobre el resultado de una consulta. 
		--Cursor dinamico.- Siempre esta actualizando los valores de su consulta.
		--Cursor estatico.- No toma en cuenta las nuevas filas solamente las que iniciaron con el cursor.

--TRANSACCIONES.-
	--Es un conjunto de instrucciones en SQL o en otro lenguaje persistente, que deben ejecutarse 
	--como una sola unidad de trabajo, o se ejecutan todas las instrucciones correctamente,
	--o no se realiza ninguna.
	
	--PROPIEDADES ACID.-
		--Atomicidad,Consistencia, Aislamiento y Durabilidad.

		--1: PROPIEDAD DE ATOMICIDAD.- Todo debe estar bien estructurado para q se pueda ejecutar.
			--Es controlada por el gestor de transacciones
				
		--2: PROPIEDAD DE COHERENCIA O CONSISTENCIA.-Asegura que sólo se empieza aquello que se puede acabar.
			--Por lo tanto se ejecutan aquellas operaciones que no van a romper las reglas y directrices 
			--de integridad de la base de datos. Sostiene que cualquier transacción llevará a la base de datos
			--desde un estado válido a otro también válido.
			--Es controlada por el programador
			
		--3: PROPIEDAD DE AISLAMIENTO.- Asegura que una operación no puede afectar a otras. 
			--Esto asegura que la realización de dos transacciones sobre la misma información sean independientes 
			--y no generen ningún tipo de error.
			--Es controlada por el gestor de concurrencia.
			
		--4: PROPIEDAD DE DURABILIDAD.- Asegura que una vez realizada la operación, ésta persistirá y
			--no se podrá deshacer aunque falle el sistema
			--Es controlada por el subsitema de recuperacion de la base de datos.

		--1, 3 y 4 Son modulos del sistema de SQL.
			
		--SISTEMA CONCURRENTE.- Es un sistema donde se ejecutan varias transacciones al mismo tiempo, 
			--es decir trabaja con los mismos datos al mismo tiempo.

	--BLOQUE.- Es la unidad de transferencia entre el disco y la memoria ram.
	--BUFFER DE DATOS.- Es un espacio de memoria ram a donde llegan los bloques que son leidos desde el disco.
	
--ADMINISTRADOR DE BD: 
	--Es una funcion, es un conglomerado de personas, una unidad administrativa
	--Su mision es garantizar q las bdd esten disponibles cuando los usuarios autorizados lo pidan.

--GESTION DE INFORMACION (Base de datos).- 
--Operaciones Administradores hacen q eso sea posible, sin un administrador la herramienta no sirve para nada.

--CATALOGAR.- 
	--Significado de cada dato.
	--CATALOGO. lugar de origen ahi va a estar almacenada la direccion del usuraio, tipo de datos
	--not null, number fall
	--Es una bdd de sistema que almacena la informacion q creamos con el lenguaje de definicion de datos.
		---BDD de usuario
		---Tablas de cada BD
		---Columnas,
		---Tipos de Datos
		---Usuarios
		---Triggers, PA, Vistas, Cursores
	
--DBA SISTEMA.- 
	--Encargado de la infraestructura donde esta la bdd.
	
--DATA WAREHOUSE.- 
	--Es una base de datos especial orientada a la toma de decisiones, normalmente se construye extrayendo
	--datos de algunas bases de datos operativas de la organizacion.

--SQL(STRUCTURE QUERY LANGUAJE).-
	--Lenguaje para acceder datos de una bdd esta compuesto de tres componentes
	--Lenguaje con el q nosotros manipulamos la bdd.
	
	--1.LDD(Lenguaje de definicion de datos).- 
		--Permite a los usuarios emplear sentencias para recuperar,
		--insertar, suprimir y modificar los datos de la base de datos.
		--Construir bdd y modificar bdd.
		
	--2.LMD(Lenguaje de manipulacion de datos).-
		--Una ves creado el repositorio de bdd, se pueden utilizar las
		--siguientes instrucciones SELECT, INSERT, UPDATE y DELETED
		
	--3.LCD(Lenguaje de control de datos).-
		--Define el esquema de la base de datos asi como la estructura de almacenamiento y definicion
			--de tipo de datos.
		--Se basa en dos instrucciones: GRANT(DAR PRIVILEGIOS), REVOKE(REVOCAR PRIVILEGIOS AL USUARIO), 
		--este nos sirve para gestionar usuarios.

--Un usuario normal que usa la bdd bancaria o cajeros, atraves de una interfaz 
--de aplicacion(pantalla computadora que ingresamos alguna orden y el S nos responde)
--el codigo aplicacion esta en un programa, accede a una consulta de manejo, pero interectuamos 
--con la bdd atraves de una aplicacion realizamos una consulta(SELECT, INSERT, UPDATE dependiendo) 
--esto luego es compilado para.

--GESTOR DE MEMORIA INTERMEDIA O BUFFER O CACHE.- 
	--Los bloques de disco llegan al puerto de donde es enviado luego a las aplicaciones.
	
--INDICE.-
	--Una estructura de datos en arbol q se adhiere en una tabla para acelerar las consultas por uno de los 
	--atributos de la tabla (hacer mas rapidas las consultas de acuerdo a las claves de busqueda).

--DATOS ESTADISTICOS.- 
	--Son datos de la informacion q se tiene en cada tabla x ejemplo
	--Nro de filas de las tablas
	--tamaño en bits de cada fila
	--Nro de bloqs q contiene la tabla
	--Nro de valores distintos de cada columna
	--Nro de niveles de cada indice
	--Nro de filas por bloque
	--*Todo esto se utiliza para hacer Optimizacion de consultas.*
	--*Poder otimizar una consulta q realiza el usuario*
	
--ALGEBRA RELACIONAL.-
	--Conjunto de operaciones sobre otras tablas obteniendo como resultado otras tablas	
	--Operacion SELECT.- Seleccionar un conjunto de tablas q cumple una condicion
	--La Optimizacion de consultas pule las consultas y saca un camino optimo para realizar la consulta.


--DISEÑO LOGICO.- 
	--Transformacion de entidad relacion a un modelo relacional(tabla la conocesmos como una relacion 
	--matematica). TRansformar las entidades y relaciones en tablas.
	--Case Modelo en base a tablas.(Diseño Logico)
	
--NORMALIZACION.-
	--Es un proceso mediante el cual nosotros eliminamos redundancia de nuestra tabla.
	
--MODELO FISICO.-
	--Transripcion de modelo grafico a un lenguaje SQL q entienda una de las herramientas de bdd.
	--Restriccion de integridad.- nos ayuda a controlar que los datos del usuario sean correctos a los
	--de negocio.

--CONOCIMIENTO.- 
	--Pedir informacion a la base de datos historico.
	--Patrones de informacion dentro de la base de datos.


--REQUERIMIENTOS FUNCIONALES.- 
	--Todo lo que tiene que hacer la BD desde la persepectiva del cliente.
	
--REQUERIMIENTOS NO FUNCIONALES.-
	--Desde la perspectiva del tecnologo del q esta diseñando(Sistema funciona en un sistema de red).

--RUTA CRITICA.-
	--El camino mas corto para llegar al objetivo.
	
--HISTORIAS DE USUARIO.-
	--Requerimientos funcionales todo lo que un usuario puede hacer en la aplicacion.

--CICLO.-
	--Mas de un camino para llegar a una segunda identidad.
	
--GENERALIZACION.-
	--Es el resultado de la unión de 2 o más conjuntos de entidades (de bajo nivel) para producir
	--un conjunto de entidades de más alto nivel.
	--La generalización se usa para hacer resaltar los parecidos entre tipos de entidades de nivel más bajo
	--y ocultar sus diferencias.
	
--ESPECIALIZACION.-
	--Es el resultado de tomar un subconjunto de entidades de alto nivel para formar un conjunto
	--de entidades de más bajo nivel.
