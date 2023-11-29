#Para crear el "ambiente" unviersidad donde estaran las tablas
create database Universidad; 
#Señalamos que entre todos nuestros ambientes usaremos el de "Universidad"
use Universidad;
#Creamos la tabla Alumno con los atributos:
create table Alumno
(			
	registro int not null primary key,
#registro tipo int pk
nombre varchar(60) not null,
#nombre como cadena de 60 chars no nula
sexo char not null,
#sexo como char no nulo
estadoCivil char not null,
#estadoCivil char no nulo
telefono int,
#telefono int con posibilidad de nulo
direccion varchar(50)
#direccion cadena de 50 chars pos. nulo
);
#Codigo para insertar valores en una tabla
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
);
	insert
		into
		alumno
	values( 222,
			'Saturnino Mamani',
			'm',
			'c',
			7202130,
			null
		  );
	insert
		into
		alumno
	values( 333,
			'Fabiola Mendez',
			'f',
			's',
			7242222,
			'Av. Landivar #1250'
		  );
	insert
		into
		alumno
	values( 444,
			'Carlos Camacho',
			'm',
			's',
			null,
			'C. Ichilo #500'
		  );
	insert
	into
	alumno
values( 555,
		'Patricia Aguilera',
		'f',
		'c',
		7218999,
		'C. Ichilo #504'
	  );
#Codigo para mostrar todos los valores de una tabla
select
	*
from
	alumno;
#Codigo para eliminar una tupla por su llave primaria
delete
from
	alumno
where
	registro = 111;
#Codigo para seleccionar (mostrar) atributos especificos de la tabla
select
	registro,
	nombre
from
	alumno;
#Codigo para seleccionar tuplas que cumplan con una condicion especifica
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
		and estadoCivil = 's';
	-- Mostrar todos los alumnos que son varones y no solteros...
	select
		*
	from
		alumno
	where
		sexo = 'm'
		and not estadoCivil = 's';
	-- Mostrar todos los alumnos que no tienen telefono...
	select*
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
####################################################################################################################	