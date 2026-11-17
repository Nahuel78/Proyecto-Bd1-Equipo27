Investigación: Seguridad y Permisos en el Sistema Yenny - El Ateneo

Control de Acceso y Principio de Menor Privilegio (GRANT / DENY)

* Definición : Comandos del Lenguaje de Control de Datos (DCL) en SQL Server que permiten otorgar (GRANT) o prohibir explícitamente (DENY) el acceso a objetos de la base de datos, asegurando que cada usuario tenga únicamente los permisos mínimos necesarios para trabajar.

* Uso en el sistema : Se aplicó un GRANT de SELECT e INSERT al Rol_Vendedor sobre las tablas de facturación para permitirles operar la caja. Para prevenir fraudes, se implementó un DENY DELETE estricto sobre la tabla Ventas, bloqueando a nivel motor cualquier intento de eliminar comprobantes.

Auditoría de Permisos (sp_helprotect)

* Definición : Procedimiento almacenado nativo del sistema en SQL Server que devuelve un reporte detallado (tabla resumen) con los permisos efectivos, el objeto afectado y el tipo de protección (GRANT/DENY) asignado a un usuario o rol.

* Uso en el sistema : Se utiliza como herramienta de control y auditoría por parte del esquema administrador (dbo). Permite al Equipo 27 validar rápidamente que las políticas de seguridad del cajero estén correctamente aplicadas y que no existan vulnerabilidades en el acceso a los datos.