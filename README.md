# Sistema de Gestión de Tienda - Checkpoint SQL

## Descripción del Proyecto

Este proyecto establece la base técnica para un sistema de **gestión de tienda**. El objetivo es estructurar un modelo de datos relacional que permita registrar clientes, organizar productos por categoría y llevar el control de los pedidos realizados.

Este repositorio es el entregable del "Checkpoint de estructura base", y demuestra la creación de objetos de base de datos y la ejecución de consultas básicas en **SQL Server**.

## Estructura de Archivos

```
raiz_del_proyecto/
├── README.md                        <- Documentación principal (este archivo)
└── scripts/
    ├── 01_tablas_base.sql           <- DDL y DML: creación de BD, tablas e inserción de datos
    └── 02_consultas_iniciales.sql   <- DQL: consultas de validación, filtrado y pruebas lógicas
```

## Detalles de Implementación Técnica

**Base de datos:** `TiendaDB`

**Tablas (4):**

| Tabla | Descripción | Clave primaria |
|---|---|---|
| `clientes` | Datos de las personas que compran | `clienteID` |
| `categorias` | Clasificación de los productos | `categoriaID` |
| `productos` | Catálogo, vinculado a una categoría | `productoID` |
| `pedidos` | Compras, vinculadas a cliente y producto | `pedidoID` |

**Relaciones:**

- `productos.categoriaID` → `categorias.categoriaID`
- `pedidos.clienteID` → `clientes.clienteID`
- `pedidos.productoID` → `productos.productoID`

Todas las claves foráneas usan `ON DELETE CASCADE`.

**Tipos de datos utilizados:**

- `INT` — identificadores y cantidades
- `VARCHAR` / `NVARCHAR` — nombres, apellidos, descripciones y correos
- `DECIMAL(10,2)` — precio de los productos
- `DATETIME2` — fecha del pedido

**Restricciones:**

- `PRIMARY KEY` con `IDENTITY(1,1)` en las cuatro tablas
- `FOREIGN KEY` en `productos` y `pedidos`
- `UNIQUE` sobre `clientes.correo`
- `CHECK` sobre `productos.precio` (debe ser mayor a 0) y `pedidos.cantidad`
- `NOT NULL` en todas las columnas obligatorias

**Manejo de nulos:** las columnas `clientes.telefono` y `productos.descripcion` admiten `NULL`, y los datos de prueba incluyen registros sin cargar en ambas, para poder validar `IS NULL` e `IS NOT NULL` con resultados reales.

**Datos de prueba cargados:** 6 categorías, 7 clientes, 13 productos y 10 pedidos. Supera el mínimo de 5 registros por tabla.

## Pasos para Ejecutar los Scripts

1. **Abrir el gestor de base de datos.** SQL Server Management Studio (SSMS) o Azure Data Studio, conectado a tu instancia local.

2. **Ejecutar la estructura base.** Abrí `scripts/01_tablas_base.sql` y ejecutalo completo (F5). Crea la base `TiendaDB`, las cuatro tablas con sus restricciones y carga los datos de prueba. El script es re-ejecutable: elimina las tablas existentes antes de crearlas, en el orden correcto según las dependencias.

3. **Ejecutar las consultas de validación.** Abrí `scripts/02_consultas_iniciales.sql` y ejecutalo. Contiene:
   - `SELECT *` sobre las cuatro tablas para auditar la carga inicial
   - filtros con operadores lógicos (`AND`, `OR`)
   - comparaciones relacionales (`>`, `<`, `<>`)
   - control de datos faltantes (`IS NULL`, `IS NOT NULL`)