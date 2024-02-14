/* Ejercicio 4*/
/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE public.pedidos(
id INT PRIMARY KEY,
id_usuario INT,
id_producto INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_producto) REFERENCES productos (id)
)

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO pedidos (id, id_usuario, id_producto)
VALUES (1,1,4),
(2,1,2),
(3,2,1),
(4,1,5),
(5,2,4)

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT pedidos.id, usuarios.nombre, productos.nombre
FROM pedidos
LEFT JOIN usuarios ON pedidos.id_usuario = usuarios.id
LEFT JOIN productos ON pedidos.id_producto = productos.id

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT usuarios.nombre, pedidos.id
FROM usuarios
LEFT JOIN pedidos ON pedidos.id_usuario = usuarios.id

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE pedidos
ADD COLUMN cantidad INT

UPDATE pedidos
SET cantidad = 2
