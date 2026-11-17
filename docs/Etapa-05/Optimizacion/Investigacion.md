Investigación: Optimización en el Sistema Yenny - El Ateneo

Índices (Indexes)
- Definición : Estructuras de datos a nivel físico (agrupados y no agrupados) que evitan escaneos completos de tablas (Table Scans) al buscar registros específicos en SQL Server.
- Ventajas aplicadas : Aceleran las lecturas en las tablas más consultadas del sistema, como la búsqueda del catálogo de libros o el filtrado del historial de compras de los clientes, reduciendo significativamente los tiempos de respuesta en caja.

Optimización de Consultas (Query Tuning)
- Definición : Aplicación de buenas prácticas en la escritura de código T-SQL, como evitar el uso de SELECT *, priorizar el operador EXISTS sobre IN, y no aplicar funciones directamente en la cláusula WHERE (consultas SARGables).
- Uso en el sistema : Se estandarizan estas reglas en todos los Procedimientos Almacenados y Vistas del proyecto para minimizar el consumo de memoria RAM, reducir el tráfico de red y mantener la escalabilidad aunque la base de datos crezca.