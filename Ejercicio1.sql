/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), 
nombre (texto) y email (texto). */ 

CREATE TABLE IF NOT EXISTS "clientes" (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL, -- Hasta 255 caracteres
    email VARCHAR(255) -- hasta 255 caracteres
);

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y 
email="juan@example.com". */

INSERT INTO "clientes" (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com');

/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */

UPDATE "clientes"
SET email = 'juan@gmail.com'
WHERE id = 1;

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */

DELETE FROM "clientes"
WHERE id = 1; -- Borra todos los datos del ID 1

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), 
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto 
(texto) y cantidad (entero). */

CREATE TABLE "pedidos" (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    producto TEXT,
    cantidad INT,
    CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id)
);

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.

-- Hay que volver a ejecutar el punto 3 para que haya dato, si no el INSERT fallara */

INSERT INTO "pedidos" (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

/*  7. Actualizar la cantidad del pedido con id=1 a 3. */

UPDATE "pedidos"
SET cantidad = 3
WHERE id = 1;

 /*8. Eliminar el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM "Pedidos"
WHERE id = 1;

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave 
primaria), nombre (texto) y precio (decimal). */

CREATE TABLE "productos" (
    id INT PRIMARY KEY,
    nombre TEXT,
    precio DECIMAL(10, 2)
);

/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

INSERT INTO "productos" (id, nombre, precio)
VALUES
	(1, 'Historia del Perú Antiguo', 25.99), -- Precio en euros
	(2, 'Los Incas y su Imperio', 30.50),   -- Precio en euros
	(3, 'La Independencia Peruana', 20.00), -- Precio en euros
	(4, 'Crónicas del Virreinato', 18.75), -- Precio en euros
	(5, 'Evolución Cultural del Perú', 22.40); -- Precio en euros


 /* 11. Consultar todos los clientes de la tabla "Clientes". */

SELECT * FROM "clientes";

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */

SELECT pedidos.id AS pedido_id,
    clientes.nombre AS cliente_nombre,
    pedidos.producto,
    pedidos.cantidad
FROM Pedidos
JOIN Clientes
ON pedidos.cliente_id = clientes.id;

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */

SELECT nombre, precio
FROM productos
WHERE precio > 50;

 /* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */

SELECT *
FROM pedidos
WHERE cantidad >= 5;

/*  15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra 
"A". */

SELECT *
FROM clientes
WHERE nombre LIKE 'A%';

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */

SELECT clientes.nombre AS cliente_nombre,
    COUNT(Pedidos.id) AS total_pedidos
FROM clientes
LEFT JOIN pedidos
ON clientes.id = Pedidos.cliente_id
GROUP BY clientes.nombre;

 /* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */

SELECT pedidos.producto AS producto_nombre,
    SUM(pedidos.cantidad) AS total_cantidad
FROM pedidos
GROUP BY pedidos.producto;

 /* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */

ALTER TABLE pedidos ADD COLUMN fecha DATE;

 /* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */


/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de 
los productos y las cantidades de los pedidos donde coincida la clave externa.*/ 

SELECT clientes.nombre AS cliente_nombre,
    productos.nombre AS producto_nombre,
    pedidos.cantidad AS cantidad_pedida
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
JOIN productos ON pedidos.producto = productos.id;