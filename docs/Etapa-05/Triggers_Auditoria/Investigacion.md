# Investigación: Triggers y Auditoría en BD_VENTAS

## Concepto y Funcionamiento
- **Definición**: Un trigger (disparador) es un objeto almacenado en la base de datos que se ejecuta de forma automática (se "dispara") en respuesta a un evento determinado sobre una tabla o vista, típicamente operaciones DML como `INSERT`, `UPDATE` o `DELETE`.
- **Tablas Virtuales (Inserted / Deleted)**: SQL Server utiliza tablas lógicas internas para gestionar los triggers. La tabla `Inserted` almacena las nuevas filas creadas (en `INSERT` y `UPDATE`), mientras que la tabla `Deleted` almacena las filas eliminadas o anteriores al cambio (en `DELETE` y `UPDATE`).

## Aplicación en Auditoría y Control
- **Auditoría de Cambios**: En sistemas transaccionales como `BD_VENTAS`, los triggers son fundamentales para registrar automáticamente operaciones críticas (por ejemplo, cambios de precios, eliminaciones de registros o modificaciones de stock) guardando quién y cuándo realizó la acción, garantizando la trazabilidad y la seguridad de los datos.
- **Restricciones complejas**: Permiten validar reglas de negocio avanzadas que van más allá de las restricciones estándar (`CHECK` o `FOREIGN KEY`), asegurando la integridad lógica de la base de datos.