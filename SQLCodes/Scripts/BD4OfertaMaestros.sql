CREATE DATABASE bd4_oferta_maestros;
USE bd4_oferta_maestros;

CREATE TABLE MATERIA
(
	SIGLA varchar(6) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(60) NOT NULL
);

CREATE TABLE DOCENTE 
(
	CODIGO INTEGER NOT NULL PRIMARY KEY,
	NOMBRE VARCHAR(60) NOT NULL
);

CREATE TABLE PERIODO
(
	ID  INTEGER NOT NULL PRIMARY KEY,
    NUMERO  tinyint NOT NULL,
    AÑO  SMALLINT NOT NULL
);

CREATE TABLE GRUPO
(
	ID INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(2) NOT NULL,
    
    IDDOCENTE INTEGER NOT NULL,
    foreign key (IDDOCENTE) references DOCENTE(CODIGO)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
    
    SIGLAMAT varchar(6) NOT NULL,
    foreign key (SIGLAMAT) references MATERIA(SIGLA)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
    
    IDPERIODO INTEGER NOT NULL,
    foreign key (IDPERIODO) references PERIODO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE HORARIO
(
	IDGRUPO INTEGER NOT NULL,
	ID tinyint NOT NULL,  -- ES PRIMARIA???????
    DIA VARCHAR(10) NOT NULL,
    HORAI time NOT NULL,
    HORAF time NOT NULL,
	PRIMARY KEY (IDGRUPO, ID),
	foreign key (IDGRUPO) references GRUPO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE ALUMNO
(
	REGISTRO INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(60) NOT NULL
);

CREATE TABLE BOLETAINSCRIPCION
(
	NRO INTEGER NOT NULL PRIMARY KEY,
    FECHA DATE NOT NULL,
    HORA time NOT NULL,
    REGISTROALUMNO INTEGER NOT NULL,
    foreign key (REGISTROALUMNO) references ALUMNO(REGISTRO)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE INSCRIBE
(
	NROBOLETA INTEGER NOT NULL,
    IDGRUPO INTEGER NOT NULL,
	PRIMARY KEY(NROBOLETA,IDGRUPO),     -- RELACION MUCHOS A MUCHOS, CONJUNTO DE FK's ES UNA PK/
	foreign key (IDGRUPO) references GRUPO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	foreign key (NROBOLETA) references BOLETAINSCRIPCION(NRO)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- INSERTAR PERIODO/

insert into periodo values(1,1,2023);
insert into periodo values(2,2,2023);
insert into periodo values(3,1,2024);
insert into periodo values(4,2,2024);

-- Inserción de datos docentes/
insert into docente values(100,'Vargas Castillo Ciro Edgar');
insert into docente values(101,'Martinez Cardona Sarah Mirna');
insert into docente values(102,'Veizaga Gonzales Josue Obed');
insert into docente values(103,'Lopez Winnipeg Mario Milton');
insert into docente values(104,'Lazo Arteaga Carlos Roberto');
insert into docente values(105,'Calderon Flores Modesto Frankl');

insert into docente values(106,'Acosta Cabezas Bartolo Javier');
insert into docente values(107,'Valdelomar Orrellana Tomas');
insert into docente values(108,'Claure Medrano Oropeza ELiz');
insert into docente values(109,'Guzman de Molina Isabel Miriam');

insert into docente values(110,'Flores Flores Marcos Oscar');
insert into docente values(111,'Cabello Merida Juan Ruben');

insert into docente values(112,'Gianela Peredo Eduardo');
insert into docente values(113,'Gutierrea Bruno Katime Martin');
insert into docente values(114,'Velazco Guaman Angel');
insert into docente values(115,'Mollo Mamani Alberto');
insert into docente values(116,'Peinado Pereira Miguel Jesus');
insert into docente values(117,'Zeballos Pereira Daniel Luis');
select * from docente;


-- insertar datos de materia/
insert into materia values('INF119','Estructuras Discretas');
insert into materia values('INF110','Introducción a la Informática');
insert into materia values('FIS100','Física I');
insert into materia values('MAT101','Cálculo I');
insert into materia values('LIN100','Ingles Técnico I');
insert into materia values('ADM100','Administración');
insert into materia values('MAT103','Algebra Lineal');
insert into materia values('MAT102','Calculo II');
insert into materia values('LIN101','Ingles Tecnico II');
insert into materia values('INF120','Programación I');
insert into materia values('FIS102','Física II');

-- Insertad datos de grupo/
insert into grupo values(1,'SE',100,'INF119',2);
insert into grupo values(2,'SF',101,'INF119',2);
insert into grupo values(3,'SI',102,'INF110',2);
insert into grupo values(4,'Z6',103,'INF110',2);

insert into grupo values(5,'Z5',104,'FIS100',2);
insert into grupo values(6,'Z4',105,'FIS100',2);

insert into grupo values(7,'Z5',106,'MAT101',2);
insert into grupo values(8,'Z4',107,'MAT101',2);

insert into grupo values(9,'Z6',108,'LIN100',2);
insert into grupo values(10,'NX',109,'LIN100',2);

insert into grupo values(11,'SA',110,'ADM100',2);
insert into grupo values(12,'SC',111,'ADM100',2);

insert into grupo values(13,'SF',112,'MAT103',2);
insert into grupo values(14,'SE',113,'MAT103',2);

insert into grupo values(15,'SH',114,'MAT102',2);
insert into grupo values(16,'SB',104,'MAT102',2);

insert into grupo values(17,'SB',108,'LIN101',2);
insert into grupo values(18,'SE',109,'LIN101',2);

insert into grupo values(19,'SI',115,'INF120',2);
insert into grupo values(20,'SH',116,'INF120',2);

insert into grupo values(21,'SA',117,'FIS102',2);
insert into grupo values(22,'NX',105,'FIS102',2);

/* insertar horarios*/
insert into horario values(1,1,'martes','18:15','20:30');
insert into horario values(1,2,'jueves','18:15','20:30');

insert into horario values(2,1,'lunes','7:00','08:30');
insert into horario values(2,2,'miercoles','7:00','08:30');
insert into horario values(2,3,'viernes','7:00','08:30');

insert into horario values(3,1,'martes','09:15','11:30');
insert into horario values(3,2,'jueves','09:15','11:30');

insert into horario values(4,1,'martes','09:15','11:30');
insert into horario values(4,2,'jueves','09:15','11:30');

insert into horario values(5,1,'martes','18:15','20:30');
insert into horario values(5,2,'miercoles','16:45','18:15');
insert into horario values(5,3,'jueves','18:15','20:30');

insert into horario values(6,1,'lunes','16:45','18:15');
insert into horario values(6,2,'miercoles','16:45','18:15');
insert into horario values(6,3,'viernes','16:45','18:15');
insert into horario values(6,4,'sábado','08:30','10:00');

insert into horario values(7,1,'lunes','19:45','21:15');
insert into horario values(7,2,'miercoles','19:45','21:15');
insert into horario values(7,3,'viernes','19:45','21:15');

insert into horario values(8,1,'martes','13:45','16:00');
insert into horario values(8,2,'jueves','13:45','16:00');

insert into horario values(9,1,'lunes','10:00','11:30');
insert into horario values(9,2,'miercoles','10:00','11:30');
insert into horario values(9,3,'viernes','10:00','11:30');

insert into horario values(10,1,'martes','16:00','18:15');
insert into horario values(10,2,'jueves','16:00','18:15');

insert into horario values(11,1,'lunes','18:15','19:45');
insert into horario values(11,2,'miercoles','18:15','19:45');
insert into horario values(11,3,'viernes','18:15','19:45');

insert into horario values(12,1,'lunes','7:00','08:30');
insert into horario values(12,2,'miercoles','7:00','08:30');
insert into horario values(12,3,'viernes','7:00','08:30');

insert into horario values(13,1,'lunes','7:00','09:15');
insert into horario values(13,2,'miercoles','7:00','09:15');

insert into horario values(14,1,'lunes','10:00','11:30');
insert into horario values(14,2,'miercoles','10:00','11:30');
insert into horario values(14,3,'viernes','10:00','11:30');

insert into horario values(15,1,'martes','09:15','11:30');
insert into horario values(15,2,'jueves','09:15','11:30');

insert into horario values(16,1,'martes','20:30','22:45');
insert into horario values(16,2,'jueves','20:30','22:45');

insert into horario values(17,1,'lunes','08:30','10:00');
insert into horario values(17,2,'miercoles','08:30','10:00');
insert into horario values(17,3,'viernes','08:30','10:00');

insert into horario values(18,1,'lunes','7:00','08:30');
insert into horario values(18,2,'miercoles','7:00','08:30');
insert into horario values(18,3,'viernes','7:00','08:30');

insert into horario values(19,1,'lunes','7:00','08:30');
insert into horario values(19,2,'miercoles','7:00','08:30');
insert into horario values(19,3,'viernes','7:00','08:30');

insert into horario values(20,1,'lunes','16:45','18:15');
insert into horario values(20,2,'miercoles','16:45','18:15');
insert into horario values(20,3,'viernes','16:45','18:15');

insert into horario values(21,1,'martes','13:45','16:00');
insert into horario values(21,2,'jueves','13:45','16:00');
insert into horario values(21,3,'viernes','13:15','16:45');

insert into horario values(22,1,'martes','7:00','09:15');
insert into horario values(22,2,'jueves','7:00','09:15');
insert into horario values(22,3,'viernes','10:00','11:30');

-- INSERTAR ALUMNOS
INSERT INTO ALUMNO VALUES(111, 'SATURDINO MAMANI');
INSERT INTO ALUMNO VALUES(222, 'JOAQUIN CHUMACERO');
INSERT INTO ALUMNO VALUES(333, 'FABIOLA GARCIA');
INSERT INTO ALUMNO VALUES(444, 'SANTIAGO GARCIA RODRIGUEZ');
INSERT INTO ALUMNO VALUES(555, 'FERNANDA VILLENA');
INSERT INTO ALUMNO VALUES(666, 'VALENTINA SAUCEDO');

-- INSERTAR BOLETA INSCRIPCION

INSERT INTO BOLETAINSCRIPCION VALUES(1001, '2023/08/12','11:30', 111);
INSERT INTO BOLETAINSCRIPCION VALUES(1002, '2023/08/11','9:09', 222);
INSERT INTO BOLETAINSCRIPCION VALUES(1003, '2023/08/12','7:18', 333);
INSERT INTO BOLETAINSCRIPCION VALUES(1004, '2023/08/10','17:23', 444);
INSERT INTO BOLETAINSCRIPCION VALUES(1005, '2023/08/13','14:00', 555);
INSERT INTO BOLETAINSCRIPCION VALUES(1006, '2023/08/10','10:36', 666);

-- INSERTAR INSCRIBE
INSERT INTO INSCRIBE VALUES(1001, 5);
INSERT INTO INSCRIBE VALUES(1001, 3);
INSERT INTO INSCRIBE VALUES(1001, 4);
INSERT INTO INSCRIBE VALUES(1001, 6);
INSERT INTO INSCRIBE VALUES(1002, 7);
INSERT INTO INSCRIBE VALUES(1002, 8);
INSERT INTO INSCRIBE VALUES(1002, 9);
INSERT INTO INSCRIBE VALUES(1003, 4);
INSERT INTO INSCRIBE VALUES(1003, 1);
INSERT INTO INSCRIBE VALUES(1003, 2);
INSERT INTO INSCRIBE VALUES(1003, 5);
INSERT INTO INSCRIBE VALUES(1004, 17);
INSERT INTO INSCRIBE VALUES(1004, 19);
INSERT INTO INSCRIBE VALUES(1004, 21);
INSERT INTO INSCRIBE VALUES(1004, 22);


-- METODOOOOS
/** 
 * MOSTRAR LA HORA DE INICIO DEL DIA MARTES, DE LA MATERIA DE FISICA I, GRUPO Z5/
 */
select 
	grupo.NOMBRE,
	horario.DIA,
	horario.HORAI, 
	horario.HORAF
from 
	horario,
	grupo,
	materia
where 
	grupo.SIGLAMAT = materia.SIGLA 
	and 
	materia.NOMBRE = 'FISICA I'
	and 
	grupo.NOMBRE = 'Z5'
	and
	grupo.ID = horario.IDGRUPO
	and
	horario.DIA = 'MARTES';
/**
 * MOSTRAR LOS GRUPOS QUE DICTA EL DOCENTE LAZO ARTEAGA CARLOS ROBERTO EN EL PERIODO 2-2023/
 */
SELECT 
	GRUPO.ID, 
	GRUPO.NOMBRE, 
	GRUPO.SIGLAMAT
from	
	GRUPO,
	DOCENTE,
	PERIODO
where 
	GRUPO.IDDOCENTE = DOCENTE.CODIGO
	AND
	DOCENTE.NOMBRE = 'Lazo Arteaga Carlos Roberto'
	AND
	GRUPO.IDPERIODO = PERIODO.ID
	and 
	PERIODO.NUMERO = 2
	and 
	PERIODO.AÑO = 2023;

/**
 * MOSTRAR LA CANTIDAD LOS GRUPOS QUE DICTA EL DOCENTE LAZO ARTEAGA CARLOS ROBERTO EN EL PERIODO 2-2023
 */
SELECT 
	count(*) as CANTIDAD_GRUPOS_DICTADOS_POR_LAZO_ARTEAGA
from	
	GRUPO,
	DOCENTE,
	PERIODO
where 
	GRUPO.IDDOCENTE = DOCENTE.CODIGO
	AND
	DOCENTE.NOMBRE = 'Lazo Arteaga Carlos Roberto'
	AND
	GRUPO.IDPERIODO = PERIODO.ID
	and 
	PERIODO.NUMERO = 2
	and 
	PERIODO.AÑO = 2023;

/**
 * MOSTRAR LA CANTIDAD LOS GRUPOS DICTADOS POR CADA DOCENTE EN EL PERIODO 2-2023
 */
SELECT 
	DOCENTE.CODIGO,
	DOCENTE.NOMBRE,
	COUNT(*) AS 'CANT_GRUPOS_2_2023'
from	
	GRUPO,
	DOCENTE,
	PERIODO
where 
	GRUPO.IDDOCENTE = DOCENTE.CODIGO
	AND
	GRUPO.IDPERIODO = PERIODO.ID
	and 
	PERIODO.NUMERO = 2
	and 
	PERIODO.AÑO = 2023
group by 
	DOCENTE.CODIGO,
	DOCENTE.NOMBRE;

-- /MOSTRA LA CANTIDAD DE DOCENTES QUE DICTAN DOS GRUPOS EN EL PERIODO 2-2023/
SELECT 
	DOCENTE.CODIGO,
	DOCENTE.NOMBRE,
	COUNT(*) AS 'CANT_GRUPOS_2_2023'
from	
	GRUPO,
	DOCENTE,
	PERIODO
where 
	GRUPO.IDDOCENTE = DOCENTE.CODIGO
	AND
	GRUPO.IDPERIODO = PERIODO.ID
	and 
	PERIODO.NUMERO = 2
	and 
	PERIODO.AÑO = 2023
group by 
	DOCENTE.CODIGO,
	DOCENTE.NOMBRE
having
	count(*) = 2; 

-- /MOSTRAR POR CADA GRUPO LA CANTIDAD DE HORARIOS ASIGNADOS/

select 
	GRUPO.ID,
	GRUPO.NOMBRE,
	count(*)
from
	GRUPO,
	HORARIO
where 
	GRUPO.ID = HORARIO.IDGRUPO 
group by 
	GRUPO.ID,
	GRUPO.NOMBRE;

-- /MOSTRAR LOS GRUPOS QUE SON DE LA MATERIA INTRODUCCION A LA INFORMATICA/
SELECT 
	GRUPO.NOMBRE
FROM 
	MATERIA, 
	GRUPO
WHERE 
	MATERIA.SIGLA = SIGLAMAT 
	AND 
	MATERIA.NOMBRE = 'Introducción a la Informática';

-- /MOSTRAR TODOS LOS GRUPOS DE LA GESTION 2-2023, QUE INICIAN SUS CLASES A LAS HRS 9:15/
select distinct 
	GRUPO.ID,
	GRUPO.NOMBRE,
	HORARIO.HORAI,
	HORARIO.HORAF 
from
	GRUPO,
	periodo,
	horario
where 
	GRUPO.IDPERIODO = PERIODO.ID 
	and
	periodo.AÑO = 2023
	and 
	PERIODO.NUMERO = 2
	AND
	GRUPO.ID = HORARIO.IDGRUPO
	and 
	HORARIO.HORAI = '9:15';

-- /MOSTRAR LA CANTIDAD DE GRUPOS EXISTENTES POR CADA MATERIA DE LA GESTION 2-2023/
SELECT 
	MATERIA.SIGLA,
	MATERIA.NOMBRE, 
	COUNT(*) as 'CANTIDAD_GRUPOS_2_2023'
FROM 
	MATERIA, 
	GRUPO, 
	PERIODO
WHERE 
	PERIODO.ID = IDPERIODO 
	AND 
	MATERIA.SIGLA = SIGLAMAT 
	AND 
	PERIODO.AÑO = '2023'
 	AND 
 	PERIODO.NUMERO = '2'
GROUP BY 
	MATERIA.SIGLA, 
	MATERIA.NOMBRE;

-- MOSTRAR LAS/EL GRUPO Y LA MATERIA QUE ESTA LLEVANDO SANTIAGO GARCIA RODRIGUEZ DE LAS MATERIAS OFERTADAS EL SEMESTRE 2 - 2023
select 
	GRUPO.ID,
	GRUPO.NOMBRE, 
	GRUPO.SIGLAMAT
from 
	grupo,
	inscribe,
	boletainscripcion,
	alumno,
	periodo
where 
	grupo.IDPERIODO  = periodo.ID
	AND
	GRUPO.ID = INSCRIBE.IDGRUPO
	AND
	periodo.NUMERO = '2'
	AND
	periodo.AÑO = '2023'
	AND
	inscribe.NROBOLETA = boletainscripcion.NRO
	AND
	boletainscripcion.REGISTROALUMNO = alumno.REGISTRO
	AND
	ALUMNO.NOMBRE='SANTIAGO GARCIA RODRIGUEZ';

/**
 * MOSTRAR LA CANTIDAD DE MATERIAS INSCRITAS POR CADA ALUMNO DE MATERIA OFERTADA EN EL SEMESTRE 2 - 2023
 */
select 
	ALUMNO.REGISTRO,
	ALUMNO.NOMBRE,
	COUNT(*) AS CANTIDAD_GRUPOMATERIA
from 
	grupo,
	inscribe,
	boletainscripcion,
	alumno,
	periodo
where 
	grupo.IDPERIODO  = periodo.ID
	AND
	GRUPO.ID = INSCRIBE.IDGRUPO
	AND
	periodo.NUMERO = '2'
	AND
	periodo.AÑO = '2023'
	AND
	inscribe.NROBOLETA = boletainscripcion.NRO
	AND
	boletainscripcion.REGISTROALUMNO = alumno.REGISTRO
group by 
	ALUMNO.REGISTRO,
	ALUMNO.NOMBRE;

/**
 * MOSTRAR LAOS ALUMNOS QUE HAN INSCRITOS MAS DE 3 MATERIAS
 */
select 
	ALUMNO.REGISTRO,
	ALUMNO.NOMBRE,
	COUNT(*) AS CANTIDAD_GRUPOMATERIA
from 
	grupo,
	inscribe,
	boletainscripcion,
	alumno,
	periodo
where 
	grupo.IDPERIODO  = periodo.ID
	AND
	GRUPO.ID = INSCRIBE.IDGRUPO
	AND
	periodo.NUMERO = '2'
	AND
	periodo.AÑO = '2023'
	AND
	inscribe.NROBOLETA = boletainscripcion.NRO
	AND
	boletainscripcion.REGISTROALUMNO = alumno.REGISTRO
group by 
	ALUMNO.REGISTRO,
	ALUMNO.NOMBRE
having 
	count(*) > 3;

/**
 * MOSTRAR LOS GRUPOS EN LOS CUALES NADIE SE INSCRIBIO
 */
select 
	ID,
	NOMBRE 
from 
	GRUPO
where 
	ID not in (
		select 
			IDGRUPO
		from
			inscribe
	);

/**
 * MOSTRAR LOS GRUPOS EN LOS CUALES NADIE SE INSCRIBIO
 */
SELECT 
	ID,
	NOMBRE
FROM 
	GRUPO
WHERE 
	ID NOT IN (
		SELECT IDGRUPO
		FROM INSCRIBE
	);

/**
 * MOSTRAR TODOS LOS ALUMNOS QUE HAN INSCRITO LA MATERIA DE CALCULO I EN EL SEMESTRE 2 - 2023
 */
select 	
	ALUMNO.REGISTRO,
	ALUMNO.NOMBRE 
from 
	alumno,
	BOLETAINSCRIPCION,
	INSCRIBE,
	grupo,
	periodo,
	materia
where 
	ALUMNO.REGISTRO = BOLETAINSCRIPCION.REGISTROALUMNO
	and 
	BOLETAINSCRIPCION.NRO = INSCRIBE.NROBOLETA 
	and 
	GRUPO.ID = INSCRIBE.IDGRUPO 
	and 
	PERIODO.ID = GRUPO.IDPERIODO
	and 
	GRUPO.SIGLAMAT  = MATERIA.SIGLA 
	AND
	MATERIA.NOMBRE = 'CALCULO I'
	and 
	PERIODO.NUMERO = 2
	and 
	PERIODO.AÑO = 2023;

/**
 * MOSTRAR LAS MATERIAS QUE SE HAN OFERTADO MAS DE DOS VECES
 */ 
select 
	MATERIA.SIGLA,
	MATERIA.NOMBRE,
	COUNT(*)
from 
	materia,
	grupo
group by 
	MATERIA.SIGLA,
	MATERIA.NOMBRE
having 
	count(*) > 2; 
	
select * from materia;
select * from GRUPO;