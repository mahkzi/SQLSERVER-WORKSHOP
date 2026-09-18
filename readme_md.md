# 📦 Sistema de Gestión de Inventario - Checkpoint SQL

## 📌 Descripción del Proyecto
Este proyecto establece la base técnica para un sistema de **Control de Inventario**. El objetivo principal es estructurar un modelo de datos relacional que permita registrar productos, clasificarlos en categorías y realizar un seguimiento de los movimientos de stock (entradas y salidas) a lo largo del tiempo. 

Este repositorio sirve como entregable para el "Checkpoint de estructura base", demostrando el dominio en la creación de objetos de base de datos y la ejecución de consultas básicas utilizando **SQL Server 2025**.

## 📂 Estructura de Archivos
El proyecto está organizado de la siguiente manera para asegurar una lectura limpia y profesional:

```text
📁 raiz_del_proyecto/
├── 📄 README.md                        <- Documentación principal (este archivo)
└── 📁 scripts/
    ├── 📄 01_tablas_base.sql           <- DDL y DML: Creación de BD, tablas e inserción de datos (mín. 5 registros)
    └── 📄 02_consultas_iniciales.sql   <- DQL: Consultas de validación, filtrado y pruebas lógicas
```

## 🛠️ Detalles de Implementación Técnica
Para satisfacer los criterios de aceptación, el modelo de datos implementa lo siguiente:
* **Tablas Relacionadas (3):** `Categorias`, `Productos`, y `MovimientosStock`.
* **Tipos de Datos:** 
  * `INT` (Ej: IDs y cantidades)
  * `VARCHAR` / `NVARCHAR` (Ej: Nombres y descripciones)
  * `DECIMAL` (Ej: Precio de los productos)
  * `DATE` / `DATETIME` (Ej: Fecha de registro o movimiento)
* **Restricciones:** Uso de `PRIMARY KEY` en todas las tablas y columnas obligatorias definidas como `NOT NULL`.
* **Manejo de Nulos:** Se incluyeron campos opcionales (ej. notas u observaciones) para poder testear condiciones `IS NULL` / `IS NOT NULL`.

## 🚀 Pasos para Ejecutar los Scripts

Para replicar este entorno en tu servidor local, sigue estos pasos:

1. **Abrir el Gestor de Base de Datos:**
   Abre SQL Server Management Studio (SSMS) o Azure Data Studio y conéctate a tu instancia de SQL Server 2025.

2. **Paso 1: Ejecutar la Estructura Base**
   * Ve a `Archivo > Abrir > Archivo...` y selecciona el script `scripts/01_tablas_base.sql`.
   * Ejecuta el script completo (F5).
   * *¿Qué hace?* Este script creará la base de datos `GestionInventarioDB`, construirá las 3 tablas con sus respectivas restricciones, y poblará cada tabla con al menos 5 registros de prueba.

3. **Paso 2: Ejecutar las Consultas de Validación**
   * Abre el segundo archivo: `scripts/02_consultas_iniciales.sql`.
   * Ejecuta el script.
   * *¿Qué hace?* Este script contiene las pruebas solicitadas en el checkpoint:
     * `SELECT *` para auditar la carga inicial de las 3 tablas.
     * Consultas con filtros lógicos (`AND`, `OR`) y comparaciones relacionales (`>`, `<`, `<>`).
     * Filtros específicos de control de datos faltantes (`IS NULL` / `IS NOT NULL`).

---
**Autor:** [Tu Nombre/Apellido]
**Curso/Módulo:** [Nombre de tu curso]
**Fecha:** [Fecha de entrega]