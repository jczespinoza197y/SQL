/* Ejercicio 4 
 Nivel de dificultad: Experto */

/*  1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave 
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y 
"id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE "Pedidos" (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES "Usuarios"(id),
    FOREIGN KEY (id_producto) REFERENCES "Productos"(id)
);

/*  2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con 
productos. */

INSERT INTO "Pedidos" (id_usuario, id_producto) 
VALUES  (1, 3),
  (3, 1),
  (4, 4);

/*  3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de 
los productos que han comprado, incluidos aquellos que no han realizado 
ningún pedido (utiliza LEFT JOIN y COALESCE). */

SELECT  "u"."nombre" AS "nombre_usuario",
  COALESCE("p"."nombre", 'Sin pedido') AS "nombre_producto"
FROM "Usuarios" AS "u"
LEFT JOIN "Pedidos" AS "pe" ON "u"."id" = "pe"."id_usuario"
LEFT JOIN "Productos" AS "p" ON "pe"."id_producto" = "p"."id";

 /* 4. Realiza una consulta que muestre los nombres de los usuarios que han 
realizado un pedido, pero también los que no han realizado ningún pedido 
(utiliza LEFT JOIN). */

SELECT  "u"."nombre" AS "nombre_usuario",
  "p"."nombre" AS "nombre_producto"
FROM "Usuarios" AS "u"
LEFT JOIN "Pedidos" AS "pe" ON "u"."id" = "pe"."id_usuario"
LEFT JOIN "Productos" AS "p" ON "pe"."id_producto" = "p"."id";


/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza 
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

/* Agrega la nueva columna*/

ALTER TABLE "Pedidos"
ADD COLUMN cantidad INT;

/* Actualiza todos los registos existentes con el valor 1*/

UPDATE "Pedidos"
SET cantidad = 1;
