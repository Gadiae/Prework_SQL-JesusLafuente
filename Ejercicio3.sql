/* Ejercicio 3*/
/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE public.productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL
	)

/* 2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO productos (id, nombre, precio)
VALUES (1, 'sal', 1.25),
(2,'cereales',3.29),
(3,'salmon',15.95),
(4, 'leche',1.45),
(5, 'pan',0.95)

/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE productos
SET precio=1.30
WHERE id=4

/* 4. Elimina un producto de la tabla "Productos".*/
DELETE FROM productos
WHERE id=3

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos")*/
SELECT usuarios.nombre, usuarios.fk_producto_comprado, productos.nombre
FROM usuarios
LEFT JOIN productos
ON usuarios.fk_producto_comprado=productos.id