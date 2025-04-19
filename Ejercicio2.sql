/* Nivel de dificultad: Fácil*/

 /*1. Crea una base de datos llamada "MiBaseDeDatos". */

/* Se pone el nombre entre comillas para mantener las mayusculas*/
CREATE DATABASE "MiBaseDeDatos"; 

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE IF NOT EXISTS "Usuarios" (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL, 
    edad INT NOT NULL
);

/* 3. Inserta dos registros en la tabla "Usuarios". */

INSERT INTO "Usuarios" (nombre, edad)
VALUES ('Martin', 28),
  ('Aita', 34);

 /* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */

 /* Actualizaremos la edad de Aita */ 
UPDATE "Usuarios"
SET edad = 30
WHERE id = 2;

 /* 5. Elimina un usuario de la tabla "Usuarios". */

/* Borramos Aita */ 
DELETE FROM "Usuarios"
WHERE id = 2;


/*  Nivel de dificultad: Moderado
 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */

CREATE TABLE IF NOT EXISTS "Ciudades" (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL, 
    pais TEXT NOT NULL
);

 /* 2. Inserta al menos tres registros en la tabla "Ciudades". */

INSERT INTO "Ciudades" (nombre, pais)
VALUES ('Lima', 'Peru'),
  ('Barcelona', 'España'),
  ('Madrid', 'España'),
  ('Chester', 'Inglaterra'),
  ('Carrick on Shannon', 'Irlanda');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */
 
 ALTER TABLE "Usuarios"
ADD COLUMN ciudad_id INT;

ALTER TABLE "Usuarios"
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id)
REFERENCES "Ciudades"(id);
 
/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el 
nombre de su ciudad y país (utiliza un LEFT JOIN). */

/* 1ero actualizamos y agregamos datos*/

UPDATE "Usuarios"
SET ciudad_id = 3
WHERE id = 1;

INSERT INTO "Usuarios" (nombre, edad, ciudad_id)
VALUES ('Maribel', 47, 2),
  ('Aitor', 10, 4);

/* Consulta solicitada */
SELECT  "Usuarios"."nombre" AS "nombre_usuario",
  "Ciudades"."nombre" AS "nombre_ciudad",
  "Ciudades"."pais"
FROM "Usuarios"
LEFT JOIN "Ciudades" ON "Usuarios"."ciudad_id" = "Ciudades"."id";


 /* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad 
asociada (utiliza un INNER JOIN) */

/* Consulta solicitada */
SELECT  "Usuarios"."nombre" AS "nombre_usuario",
  "Ciudades"."nombre" AS "nombre_ciudad",
  "Ciudades"."pais"
FROM "Usuarios"
INNER JOIN "Ciudades" ON "Usuarios"."ciudad_id" = "Ciudades"."id";


