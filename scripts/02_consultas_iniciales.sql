/* =========================================================
   02_consultas_iniciales.sql
   Sistema de Gestión de Tienda - Checkpoint SQL
   DQL: consultas de validación y pruebas lógicas
   Requiere haber ejecutado antes 01_tablas_base.sql
   ========================================================= */

USE TiendaDB;
GO

/* ---------------------------------------------------------
   1. Validación de la carga inicial: SELECT * por tabla
   --------------------------------------------------------- */

SELECT * FROM categorias;

SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM pedidos;
GO

/* ---------------------------------------------------------
   2. Filtros con operadores lógicos (AND / OR)
   --------------------------------------------------------- */

-- AND: pedidos de más de una unidad entre los primeros registros
SELECT *
FROM pedidos
WHERE cantidad > 1 AND pedidoID < 7;

-- OR: productos caros o que no pertenecen a Almacenamiento
SELECT *
FROM productos
WHERE precio > 320 OR categoriaID <> 4;
GO

/* ---------------------------------------------------------
   3. Operadores relacionales (>, <, <>)
   --------------------------------------------------------- */

-- Mayor que
SELECT nombre, descripcion, precio
FROM productos
WHERE precio > 100;

-- Menor que
SELECT nombre, precio
FROM productos
WHERE precio < 50;

-- Distinto de
SELECT nombre, categoriaID
FROM productos
WHERE categoriaID <> 2;
GO

/* ---------------------------------------------------------
   4. Control de datos faltantes (IS NULL / IS NOT NULL)
   --------------------------------------------------------- */

-- Clientes que no cargaron teléfono
SELECT clienteID, nombre, apellido, telefono
FROM clientes
WHERE telefono IS NULL;

-- Clientes con teléfono cargado
SELECT clienteID, nombre, apellido, telefono
FROM clientes
WHERE telefono IS NOT NULL;

-- Productos sin descripción
SELECT productoID, nombre, descripcion
FROM productos
WHERE descripcion IS NULL;

-- Productos con descripción cargada
SELECT productoID, nombre, descripcion
FROM productos
WHERE descripcion IS NOT NULL;
GO

/* ---------------------------------------------------------
   5. Combinación: lógico + relacional + NULL
   --------------------------------------------------------- */

SELECT nombre, descripcion, precio
FROM productos
WHERE precio < 100 AND descripcion IS NOT NULL;
GO