USE TiendaDB;

SELECT * 
FROM pedidos
WHERE cantidad > 1 AND pedidoID < 7;

SELECT *
FROM clientes
WHERE correo IS NOT NULL;

SELECT *
FROM productos
WHERE precio > 320 OR categoriaID <> 4;