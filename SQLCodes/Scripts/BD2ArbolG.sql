/**
 * Creo la base de datos.
 */
CREATE DATABASE bd2_arbol_genealogico;
/**
 * Selecciono la base de datos actual como base para trabajar.
 */
USE bd2_arbol_genealogico;
/**
 * Construyo la tabla persona. (recursiva a si mismo con cardinaliadad 1..*).
 */
-- El ON UPDATE NO ACTION ON DELETE NO ACTION, son restricciones de integridad referencial y contrarias a on delete cascade.
    -- Vienen por defecto si no se indica la opcion de "cascade" por lo que colocar "no action" es inecesario.
CREATE TABLE PERSONA(
    ID INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    SEXO CHAR NOT NULL,
    IDPADRE INTEGER,
    IDMADRE INTEGER,
    FOREIGN key(IDPADRE) REFERENCES PERSONA(ID) 
    	ON UPDATE NO ACTION 
    	ON DELETE NO ACTION,
    FOREIGN key(IDMADRE) REFERENCES PERSONA(ID) 
    	ON UPDATE NO ACTION 
    	ON DELETE NO ACTION
);
/**
 * Mostrar los "encabezados" de las columnas en la tabla.
 */
SHOW columns
FROM
    persona;
/**
 * Mostrar las filas de la tabla.
 */
SELECT
    *
FROM
    PERSONA;
/**
 * Eliminar toda la tabla.
 */
DELETE FROM
    PERSONA;
/**
 * Inserto valores en la tabla.
 */
INSERT INTO
    PERSONA
VALUES
    (1, 'Joaquin Chumacero', 'm', NULL, NULL),
    (2, 'Carla Aranibar', 'f', NULL, NULL),
    (3, 'Pedro Chumacero Aranibar', 'm', 1, 2),
    (4, 'Priscila Tupanqui', 'f', NULL, NULL),
    (5, 'Joaquin Chumacero Yupanqui', 'm', 3, 4),
    (6, 'Carla Aguilera', 'f', NULL, NULL),
    (7, 'Joaquin Jr Chumacero Aguilera', 'm', 5, 6),
    (8, 'Carla Chumacero Aguilera', 'f', 5, 6),
    (9, 'Fabiola Mendez', 'f', NULL, NULL),
    (10, 'Fabian Chumacero Mendez', 'f', 5, 9);
/**
 * Mostrar el id y nombre de los hijos de "Joaquin Chumacero Yupanqui".
 */
-- Forma 1) Realizando operacion de conjuntos:
SELECT
    hijo.id,
    hijo.nombre
FROM
    persona padre,
    persona hijo
WHERE
    Hijo.idpadre = padre.id
    AND padre.nombre = 'Joaquin Chumacero Yupanqui';
-- Forma 2) Realizando consultas anidadas:
SELECT
    id,
    nombre
FROM
    persona
WHERE
    idpadre IN(
        SELECT
            id
        FROM
            persona
        WHERE
            nombre = 'Joaquin Chumacero Yupanqui'
    );
/**
 * Mostrar el id y nombre del padre de "Joaquin Chumacero Yupanqui".
 */
-- Forma 1) Por operaciones de conjuntos.
SELECT
    padre.id,
    padre.nombre
FROM
    persona hijos,
    persona padre
WHERE
    hijos.nombre = 'Joaquin Chumacero Yupanqui'
    AND 
   	hijos.idPadre = padre.id;
-- Forma 2) Por consultas anidadad.
SELECT
    id,
    nombre
FROM
    persona
WHERE
    id IN (
        SELECT
            IDPADRE
        FROM
            persona
        WHERE
            NOMBRE = 'Joaquin Chumacero Yupanqui'
    );
/**
 * Mostrar el id y nombre del abuelo paterno de "Joaquin Chumacero Yupanqui".
 */
-- Forma 1) Por operaciones de conjuntos.
SELECT
    abueloPaterno.id,
    abueloPaterno.nombre
FROM
    persona hijos,
    persona padre,
    persona abueloPaterno
WHERE
    hijos.nombre = 'Joaquin Chumacero Yupanqui'
    AND 
    hijos.idPadre = padre.id
    AND 
   	padre.idPadre = abueloPaterno.id;
-- Forma 2) Por consultas anidadad.
SELECT
    id,
    nombre
FROM
    persona
WHERE
    id IN (
        SELECT
            IDPADRE
        FROM
            persona
        WHERE
            id IN (
                SELECT
                    IDPADRE
                FROM
                    persona
                WHERE
                    NOMBRE = 'Joaquin Chumacero Yupanqui'
            )
    );
/**
 * Mostrar el id y el nombre de las madres de los hijos de 'Joaquin Chumacero Yupanqui'.
 */
-- Forma 1) Por operaciones de conjuntos.
-- "Select distinct selecciona los elementos revisando de que sean siempre de distantas filas"
SELECT
    DISTINCT madre.id,
    madre.nombre
FROM
    persona madre,
    persona padre,
    persona hijos
WHERE
    hijos.idPadre = padre.id
    AND 
    padre.nombre = 'Joaquin Chumacero Yupanqui'
    AND 
   	hijos.idMadre = madre.id;
-- Forma 2) Por consultas anidadas.
SELECT
    id,
    nombre
FROM
    persona
WHERE
    id IN(
        SELECT
            IDMADRE
        FROM
            persona
        WHERE
            IDPADRE IN(
                SELECT
                    ID
                FROM
                    persona
                WHERE
                    NOMBRE = 'Joaquin Chumacero Yupanqui'
            )
    );
/**
 * Mostrar la cantidad de hijos que tuvo 'Joaquin Chumacero Yupanqui' con carla aguilera
 */
-- Forma 1) Por operaciones de conjuntos.
SELECT
    DISTINCT COUNT(*)
FROM
    persona hijos,
    persona madre,
    persona padre
WHERE
    hijos.idPadre = padre.id
    AND 
    padre.nombre = 'Joaquin Chumacero Yupanqui'
    AND 
    hijos.idMadre = madre.id
    AND 
   	madre.nombre = 'Carla Aguilera';
-- Forma 2) Por consultas anidadas.
SELECT
    COUNT(*)
FROM
    persona
WHERE
    IDPADRE IN(
        SELECT
            id
        FROM
            persona
        WHERE
            NOMBRE = 'Joaquin Chumacero Yupanqui'
    )
    AND 
    IDMADRE IN(
        SELECT
            id
        FROM
            persona
        WHERE
            NOMBRE = 'Carla Aguilera'
    );
/**
 * Mostrar a los todos las esposas de 'Joaquin Chumacero Yupanqui'
 */
-- Forma 1) Por operaciones de conjuntos
SELECT
    DISTINCT esposaPadre.id,
    esposaPadre.nombre
FROM
    persona hijos,
    persona padre,
    persona esposaPadre
WHERE
    hijos.idPadre = padre.id
    AND 
    padre.nombre = 'Joaquin Chumacero Yupanqui'
    AND 
   	hijos.idMadre = esposaPadre.id;
-- Forma 2) Por consultas anidadas
SELECT
    id,
    nombre
FROM
    persona
WHERE
    id IN(
        SELECT
            IDMADRE
        FROM
            persona
        WHERE
            IDPADRE IN (
                SELECT
                    ID
                FROM
                    persona
                WHERE
                    nombre = 'Joaquin Chumacero Yupanqui'
            )
    );