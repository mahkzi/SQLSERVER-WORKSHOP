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

-- 2. Posicionarse dentro de la base de datos recién creada
USE TiendaDB;
GO
--Eliminación de tablas pro las dudas
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS pedidos;



CREATE TABLE clientes(
    clienteID INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo NVARCHAR(100) UNIQUE NOT NULL,
);
GO

CREATE TABLE categorias(
    categoriaID INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
);
GO

CREATE TABLE productos(
    productoID INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    categoriaID INT,
    precio MONEY 
    CONSTRAINT fk_categorias
        FOREIGN KEY(categoriaID)
        REFERENCES categorias(categoriaID)
        ON DELETE CASCADE,
    CONSTRAINT precio_positivo CHECK (precio > 0)
);
GO

CREATE TABLE pedidos(
    pedidoID INT IDENTITY(1,1) PRIMARY KEY,
    cantidad INT NOT NULL,
    fecha DATETIME2 NOT NULL,
    clienteID INT,
    productoID INT,
    CONSTRAINT fk_clientes
        FOREIGN KEY(clienteID)
        REFERENCES clientes(clienteID)
        ON DELETE CASCADE,
    CONSTRAINT fk_productos
        FOREIGN KEY(productoID)
        REFERENCES productos(productoID)
        ON DELETE CASCADE
);
GO

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
INSERT INTO clientes (nombre, apellido, correo) VALUES
('Juan', 'Perez', 'Juanperez@gmail.com'),
('Max', 'Limon', 'Max@gmail.com'),
('Rodrigo', 'Durazno', 'Rodrigo@gmail.com'),
('Kimino', 'Lisano', 'Kimino@gmail.com'),
('Pimon', 'Rodíguez', 'Pimon@gmail.com'),
('Estanislao', 'Perez', 'Estanislao@gmail.com'),
('Ana', 'Gomez', 'ana.gomez@gmail.com');
GO

-- DML: Inserción de registros en productos
INSERT INTO productos (nombre, descripcion, precio, categoriaID) VALUES
('Television AK34', 'Muy buena para mirar peliculas', 150, 1),
('Mouse RTK', 'Muy bueno para juegos', 60, 2),
('Monitor 75 Hz Rirulo', 'Destaca por su frecuencia de refresco', 125, 1),
('Teclado HTR19', 'Muy bueno para codear tranquilo', 90, 2),
('Mouse G901', 'Mouse ergonomico de primera calidad', 75, 2),
('Silla Grimorio34', 'Silla muy buena para la postura', 154, 3),
('Escritorio Z1', 'Escritorio amplio de madera', 200, 3),
('Disco Duro SSD 1TB', 'Alta velocidad de lectura y escritura', 85, 4),
('Memoria RAM 16GB', 'Ideal para multitarea y gaming', 45, 5),
('Auriculares SoundMax', 'Con cancelación de ruido activa', 110, 6),
('Placa de Video RTX 4060', 'Gráficos de última generación', 350, 5),
('Pendrive 64GB', 'Almacenamiento portátil de bolsillo', 15, 4),
('Mousepad XL', 'Superficie antideslizante para escritorio', 25, 2);
GO
-- DML: Inserción de registros en pedidos 
INSERT INTO pedidos (clienteID, productoID, cantidad, fecha) VALUES
(1, 4, 2, '2026-04-23'),
(2, 6, 1, '2026-06-25'),
(2, 2, 3, '2026-07-13'),
(3, 1, 1, '2026-09-16'),
(4, 2, 1, '2026-10-08'),
(3, 3, 2, '2026-09-04'),
(1, 2, 1, '2026-10-10'),
(5, 8, 2, '2026-11-02'),
(6, 9, 4, '2026-11-05'),
(1, 11, 1, '2026-11-10');
GO