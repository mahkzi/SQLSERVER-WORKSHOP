--

SELECT
    COUNT(pedidoID) AS total_pedidos
FROM pedidos
WHERE fecha >= '2025-04-01';

--

--

SELECT
    MAX(precio) AS precio_maximo,
    MIN(precio) AS precio_minimo,
    AVG(precio) AS precio_promedio
FROM productos;

--

--
SELECT
    categorias.nombre AS categoria,
    COUNT(productoID) AS total_productos,
    SUM(precio) AS suma_precios
FROM productos
INNER JOIN categorias
ON productos.categoriaID = categorias.categoriaID
GROUP BY categoria.nombre;

--

--

SELECT
    categorias.nombre AS categoria,
    COUNT(productoID) AS total_productos,
    SUM(precio) AS suma_precios
FROM productos
INNER JOIN categorias
ON productos.categoriaID = categorias.categoriaID
GROUP BY categoria.nombre
ORDER BY suma_precios DESC;

--

SELECT
    categorias.nombre AS categoria,
    COUNT(productoID) AS total_productos,
    SUM(precio) AS suma_precios
FROM productos
INNER JOIN categorias
ON productos.categoriaID = categorias.categoriaID
GROUP BY categorias.nombre
    HAVING (SUM(precio) > 150) 
    AND (COUNT(productoID) > 2)
ORDER BY suma_precios DESC;

--

