/* Ejercicio 1*/
/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */
CREATE TABLE Clientes(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR (255)
)

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/
INSERT INTO clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com')

/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE clientes
SET email = 'juan@gmail.com'
WHERE id = 1

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM clientes
WHERE id = 1

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero). */
CREATE TABLE pedidos(
	id INT PRIMARY KEY,
	cliente_id INT,
	producto VARCHAR (255),
	cantidad INT,
	FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/
INSERT INTO pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'camiseta', 2)

/* 7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos
SET cantidad = 3
WHERE id=1

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE id=1

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE productos(
	id INT PRIMARY KEY,
	nombre VARCHAR (255),
	precio DECIMAL
)

/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO productos (id, nombre, precio)
VALUES (1,'camiseta',15.90),
(2,'pantalon',29.50),
(3,'gorra',10)

/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
SELECT pedidos.id, pedidos.producto, pedidos.cantidad, clientes.nombre
FROM pedidos
LEFT JOIN clientes
ON pedidos.cliente_id=clientes.id

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM productos
WHERE precio>50

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */
SELECT * FROM pedidos
WHERE cantidad>=5

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT * FROM clientes
WHERE nombre LIKE 'A%' 

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/
SELECT clientes.nombre,pedidos.producto, pedidos.cantidad
FROM public.clientes
INNER JOIN public.pedidos
ON clientes.id = pedidos.cliente_id 

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/
SELECT clientes.nombre,pedidos.producto, pedidos.cantidad
FROM public.clientes
INNER JOIN public.pedidos
ON clientes.id = pedidos.cliente_id AND pedidos.producto = 'camiseta'

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE pedidos
ADD COLUMN fecha DATE 

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/

20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
