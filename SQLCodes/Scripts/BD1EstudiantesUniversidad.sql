-- Para crear el "ambiente" unviersidad donde estaran las tablas
create database bd1_estudiantes_universidad;
-- Señalamos que entre todos nuestros ambientes usaremos el de "Universidad"
use bd1_estudiantes_universidad;
-- Creamos la tabla Alumno con los atributos:
create table Alumno(
	registro int not null primary key,
	nombre varchar(60) not null,
	sexo char not null,
	estadoCivil char not null,
	telefono int,
	direccion varchar(50)
);
-- Insertar valores en una tabla
insert
	into
	alumno
values
	(
		111,
		'Joaquin Chumacero',
        'm',
        's',
        7102030,
        'Urb. los claveles #300'
    ),
    (
    	333,
        'Fabiola Mendez',
        'f',
        's',
        7242222,
        'Av. Landivar #1250'
	),
	(
		444,
		'Carlos Camacho',
        'm',
        's',
        null,
        'C. Ichilo #500'
    ),
    (
    	555,
        'Patricia Aguilera',
        'f',
        'c',
        7218999,
        'C. Ichilo #504'
  	),
  	(
  		666,
  		'Carlos Santana',
  		'm',
  		's',
  		null,
  		'Av.Cristo #3520'
  	);

/**
 * Mostrar todos los valores de una tabla.
 */
select
	*
from
	alumno;

/**
 * Eliminar una tupla por su llave primaria.
 */
delete
from
	alumno
where
	registro = 111;

/**
 * Seleccionar (mostrar) atributos especificos de la tabla.
 */
select
	registro,
	nombre
from
	alumno;

/**
 * Seleccionar tuplas que cumplan con una condicion especifica.
 */
	-- Mostrar todos los alumnos que son masculinos...
	select
		*
	from
		alumno
	where
		sexo = 'm';
	-- Mostrar todos los alumnos que son varones y solteros...
	select
		*
	from
		alumno
	where
		sexo = 'm'
		and
		estadoCivil = 's';
	-- Mostrar todos los alumnos que son varones y no solteros...
	select
		*
	from
		alumno
	where
		sexo = 'm'
		and 
		not estadoCivil = 's';
	-- Mostrar todos los alumnos que no tienen telefono...
	select
		*
	from
		alumno
	where
		telefono is null;
	-- Mostrar todos los alumnos que tiene telefonos...
	select
		*
	from
		alumno
	where
		telefono is not null;
	-- Mostrar todos los alumnos si sus nombres comienzan en "J"...
	select
		*
	from
		alumno
	where
		nombre like 'J%';
	-- Contar la cantidad de alumnos en la tabla...
	select
		count(*)
	from
		alumno;
	-- Mostrar todos los alumnos ordenados por orden alfabetico ascendente
	select
		*
	from
		alumno
	order by
		nombre asc;
	-- Mostrar todos los alumnos ordenados por orden alfabetico descendiente
	select
		*
	from
		alumno
	order by
		nombre desc;