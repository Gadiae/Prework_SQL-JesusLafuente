/* Ejercicio 2*/
/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE public.usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

/* 3. Inserta dos registros en la tabla "Usuarios".*/ 
INSERT INTO public.usuarios(id, nombre, edad)
VALUES (1, 'Jesús', 39), 
(2,'Tamara',36), 
(3, 'Aston',9)

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE usuarios
SET edad = 38
WHERE id=1

/* 5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM usuarios
WHERE id=3

/*Nivel de dificultad: Moderado

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE public.ciudades (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR (255)
)

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO public.ciudades (id, nombre, pais)
VALUES (1, 'Zaragoza', 'España'),
(2, 'Roma','Italia'),
(3, 'París', 'Francia'),
(4,'Madrid', 'España')

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */
ALTER TABLE usuarios
	ADD COLUMN fk_usuarios_ciudades INT

ALTER TABLE usuarios
	ADD CONSTRAINT fk_usuarios_ciudades
	FOREIGN KEY (fk_usuarios_ciudades) 
	REFERENCES ciudades(id) /*¿Es necesario hacerlo en dos pasos?*/

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
LEFT JOIN ciudades 
ON usuarios.fk_usuarios_ciudades = ciudades.id

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/ 
SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
INNER JOIN ciudades 
ON usuarios.fk_usuarios_ciudades = ciudades.id