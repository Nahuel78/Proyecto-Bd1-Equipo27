# Decisiones de Diseño: Sistema de Gestión Comercial - Yenny - El Ateneo

## 1. Arquitectura del Sistema
* Se adopta una arquitectura modular basada en capas (Presentación, Lógica de Negocio y Acceso a Datos) para garantizar la mantenibilidad y escalabilidad del sistema en la sucursal.

## 2. Persistencia y Almacenamiento
* **Modelo Relacional:** Se utilizará una base de datos relacional (ej. PostgreSQL o MySQL) para asegurar la integridad referencial entre clientes, ventas, detalles de venta e inventario.
* **Inmutabilidad Histórica (RN.03):** La tabla de detalles de venta almacenará explícitamente el `precio_unitario` al momento de la transacción (`snapshot`), desacoplándolo del catálogo actual de productos para evitar modificaciones retroactivas indeseadas.

## 3. Control de Concurrencia y Stock
* Transacciones atómicas (ACID) para el procesamiento de ventas: la reducción de stock y la generación del comprobante se ejecutan en una única transacción para evitar inconsistencias por stock negativo o ventas simultáneas.

## 4. Validaciones y Seguridad
* Validación estricta en backend y frontend de campos únicos (DNI y correo electrónico) para nuevos clientes.
* Control de roles básicos (Cajero, Supervisor/Administrador) para autorizaciones especiales (ej. ventas con stock cero o devoluciones).
