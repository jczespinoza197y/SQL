/* Ejercicio 3 */
 
/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/ 

CREATE TABLE "Productos" (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio NUMERIC(10,2) NOT NULL
);

/*  2. Inserta al menos cinco registros en la tabla "Productos". */

INSERT INTO "Productos" (nombre, precio) 
VALUES  ('Mikas', 19.99),
  ('Lompa', 39.50),
  ('Zapas', 59.90),
  ('Chamarra', 89.00),
  ('Chompa', 14.25),
  ('Bufanda', 12.75),
  ('Calcetines', 5.99);

 /* 3. Actualiza el precio de un producto en la tabla "Productos". */

UPDATE "Productos"
SET precio = 21.99
WHERE nombre = 'Lompa';

/*  4. Elimina un producto de la tabla "Productos". */

DELETE FROM "Productos"
WHERE nombre = 'Chompa';

 /* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los 
nombres de los productos que han comprado (utiliza un INNER JOIN con la 
tabla "Productos"). */

/* Agregamos columna producto_id dentro de la tabla Usuarios*/ 
ALTER TABLE "Usuarios"
ADD COLUMN productos_id INT;

/* Enlazamos la tabla de usuarios con la tabla de productos*/
ALTER TABLE "Usuarios"
ADD CONSTRAINT fk_productos
FOREIGN KEY (productos_id)
REFERENCES "Productos"(id);

/* Actualizamos valores en la columna producto ID dentro de Usuarios*/
UPDATE "Usuarios"
SET "productos_id" = "datos"."productos_id"
FROM (
  VALUES
    (3, 1),
    (4, 4)
) AS "datos"("id_usuario", "productos_id")
WHERE "Usuarios"."id" = "datos"."id_usuario";


/* Hacemos la consulta 5*/
SELECT  "Usuarios"."nombre" AS "nombre_usuario",
  "Productos"."nombre" AS "nombre_Producto",
  "Productos"."precio"
FROM "Usuarios"
INNER JOIN "Productos" ON "Usuarios"."productos_id" = "Productos"."id";


