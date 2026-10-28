# Investigación: Procedimientos Almacenados y Funciones en BD_VENTAS

## Stored Procedures (Procedimientos Almacenados)
- **Definición**: Subrutinas almacenadas en el servidor que agrupan lógica de negocio en T-SQL. En `BD_VENTAS`, son ideales para operaciones complejas transaccionales o de consulta parametrizada.
- **Ventajas aplicadas**: Centralizan la validación de stock y precios, mejoran el rendimiento por el plan de ejecución cacheado y reducen el trasiego de consultas desde la aplicación cliente.

## Funciones (Functions)
- **Definición**: Rutinas que aceptan parámetros y devuelven un valor escalar o una tabla completa. Se integran de forma nativa dentro de las cláusulas `SELECT` o `WHERE`.
- **Uso en el sistema**: Se implementan funciones escalares para calcular subtotales o totales dinámicos de ventas sin duplicar lógica.