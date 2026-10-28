# Investigación: Transacciones en BD_VENTAS

## Concepto y Propiedad ACID
- **Definición**: Una transacción agrupa un conjunto de sentencias SQL bajo el principio **ACID** (Atomicidad, Consistencia, Aislamiento y Durabilidad). O se ejecutan todas con éxito (`COMMIT`) o se revierte por completo ante un fallo (`ROLLBACK`).
- **Aplicación crítica**: En `BD_VENTAS`, el registro de una venta implica múltiples tablas relacionadas: insertar en `Ventas`, registrar los ítems en `Detalle_venta`, descontar el stock en `Producto_Deposito` y generar el `Comprobante`. Si falta stock o falla algún dato, la transacción debe cancelarse íntegramente para evitar inconsistencias de inventario.