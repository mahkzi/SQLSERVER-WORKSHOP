/* =========================================================
   01_tablas_base.sql
   Sistema de Gestión de Tienda - Checkpoint SQL
   DDL: creación de base de datos y tablas
   DML: carga de datos de prueba
   Motor: SQL Server 2016 o superior
   ========================================================= */
 
-- 1. Validar que la base de datos no exista previamente
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TiendaDB')
BEGIN
    CREATE DATABASE TiendaDB;
    PRINT 'Base de datos creada exitosamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos ya existe.';
END
GO

-- 2. Posicionarse dentro de la base de datos
USE TiendaDB;
GO


/* ---------------------------------------------------------
   3. Eliminación de tablas (script re-ejecutable)
   IMPORTANTE: se eliminan primero las tablas hijas.
   'pedidos' referencia a 'clientes' y 'productos';
   'productos' referencia a 'categorias'.
   Invertir este orden produce error de clave foránea.
   --------------------------------------------------------- */
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;
GO


/* ---------------------------------------------------------
   4. Creación de tablas
   --------------------------------------------------------- */

CREATE TABLE clientes (
    clienteID INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo NVARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NULL 
);
GO

CREATE TABLE categorias (
    categoriaID INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
GO

CREATE TABLE productos (
    productoID  INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NULL,
    categoriaID INT NULL,
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_productos_categorias
        FOREIGN KEY (categoriaID)
        REFERENCES categorias (categoriaID)
        ON DELETE CASCADE,
    CONSTRAINT ck_precio_positivo CHECK (precio > 0)
);
GO

CREATE TABLE pedidos (
    pedidoID   INT IDENTITY(1,1) PRIMARY KEY,
    cantidad   INT       NOT NULL,
    fecha      DATETIME2 NOT NULL,
    clienteID  INT       NULL,
    productoID INT       NULL,
    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (clienteID)
        REFERENCES clientes (clienteID)
        ON DELETE CASCADE,
    CONSTRAINT fk_pedidos_productos
        FOREIGN KEY (productoID)
        REFERENCES productos (productoID)
        ON DELETE CASCADE,
    CONSTRAINT ck_cantidad_positiva CHECK (cantidad > 0)
);
GO

/* ---------------------------------------------------------
   5. Carga de datos de prueba
   El orden importa: primero las tablas padre.
   --------------------------------------------------------- */

-- DML: Inserción de registros en categorias

INSERT INTO categorias (nombre) VALUES
('Pantallas'), 
('Periféricos'), 
('Muebles de Oficina'),
('Almacenamiento'),
('Componentes PC'),
('Audio');
GO
-- DML: Inserción de registros en clientes 
-- Clientes (7 registros; dos sin teléfono para probar IS NULL)
INSERT INTO clientes (nombre, apellido, correo, telefono) VALUES
('Juan',       'Perez',     'juan.perez@gmail.com',   '11-4555-0101'),
('Max',        'Limon',     'max.limon@gmail.com',    '11-4555-0102'),
('Rodrigo',    'Durazno',   'rodrigo.durazno@gmail.com', NULL),
('Kimino',     'Lisano',    'kimino.lisano@gmail.com','11-4555-0104'),
('Pimon',      'Rodriguez', 'pimon.rodriguez@gmail.com', NULL),
('Estanislao', 'Perez',     'estanislao.perez@gmail.com', '11-4555-0106'),
('Ana',        'Gomez',     'ana.gomez@gmail.com',    '11-4555-0107');
GO

-- DML: Inserción de registros en productos
-- Productos (13 registros; uno sin descripción para probar IS NULL)
INSERT INTO productos (nombre, descripcion, precio, categoriaID) VALUES
('Television AK34',         'Muy buena para mirar peliculas',          150.00, 1),
('Mouse RTK',               'Muy bueno para juegos',                    60.00, 2),
('Monitor 75 Hz Rirulo',    'Destaca por su frecuencia de refresco',   125.00, 1),
('Teclado HTR19',           'Muy bueno para codear tranquilo',          90.00, 2),
('Mouse G901',              'Mouse ergonomico de primera calidad',      75.00, 2),
('Silla Grimorio34',        'Silla muy buena para la postura',         154.00, 3),
('Escritorio Z1',           'Escritorio amplio de madera',             200.00, 3),
('Disco Duro SSD 1TB',      'Alta velocidad de lectura y escritura',    85.00, 4),
('Memoria RAM 16GB',        'Ideal para multitarea y gaming',           45.00, 5),
('Auriculares SoundMax',    'Con cancelación de ruido activa',         110.00, 6),
('Placa de Video RTX 4060', 'Gráficos de última generación',           350.00, 5),
('Pendrive 64GB',           NULL,                                       15.00, 4),
('Mousepad XL',             'Superficie antideslizante para escritorio', 25.00, 2);
GO
-- DML: Inserción de registros en pedidos 
-- Pedidos (10 registros)
INSERT INTO pedidos (clienteID, productoID, cantidad, fecha) VALUES
(1,  4, 2, '2026-04-23'),
(2,  6, 1, '2026-06-25'),
(2,  2, 3, '2026-07-13'),
(3,  1, 1, '2026-09-16'),
(4,  2, 1, '2026-10-08'),
(3,  3, 2, '2026-09-04'),
(1,  2, 1, '2026-10-10'),
(5,  8, 2, '2026-11-02'),
(6,  9, 4, '2026-11-05'),
(1, 11, 1, '2026-11-10');
GO