# 🛒 Proyecto Base de Datos: Sistema de Gestión Comercial de Librerías "Yenny - El Ateneo"

Repositorio oficial correspondiente al trabajo práctico integrador de la materia, desarrollado por el **Equipo 27** (Comisión 2 - UNNE).

---

## 👥 Integrantes del Equipo
* **Giménez, Carlos Nahuel** — DNI: 44410650
* **Medina, Andrea Marisol** — DNI: 37883537
* **Gonzales Machado, Darío Nahuel** — DNI: 43266200
* **Montiel, Valentina** — DNI: 45526766
---

## 📋 Descripción del Proyecto
Este sistema está diseñado para la gestión y administración integral de una sucursal de la cadena de librerías **"Yenny - El Ateneo"**. El desarrollo abarca desde el modelado conceptual y relacional hasta la implementación de esquemas en bases de datos y la resolución de consultas complejas utilizando Transact-SQL en SQL Server.
---

### 🎯 Alcance del Sistema
* **Gestión de inventario y stock:** Control de libros, textos académicos y artículos de papelería, actualización automática por ventas y alertas de stock mínimo.
* **Gestión de clientes y socios:** Registro de compradores, validación de datos únicos y administración de categorías de socios preferenciales.
* **Gestión de ventas y facturación:** Proceso de cobro en línea de cajas, cálculo automático de subtotales y totales, y almacenamiento del detalle de venta con el historial inalterable del precio unitario.
* **Medios de pago:** Procesamiento y registro de pagos en efectivo, tarjetas y billeteras virtuales.
---

## 📂 Estructura del Repositorio
El repositorio se encuentra organizado por las distintas etapas de desarrollo exigidas por la cátedra:
* `documentos/` -> Contiene las carpetas y archivos correspondientes a las distintas etapas del proyecto (Etapas I a V).
* `etapa01/` -> Diagramas Entidad-Relación y modelado conceptual.
* `etapa02/` -> Normalización (hasta 3FN) y esquemas relacionales.
* `etapa03/` -> Creación de tablas, restricciones (Constraints) y scripts DDL/DML.
* `etapa04/` -> **Consultas y Casos de Uso** (incluye el manifiesto individual con comprobantes, reportes agregados y consultas avanzadas).
* `etapa05/`Procedimientos, funciones, transacciones, triggers
* `sql/` -> Scripts de Transact-SQL utilizados para la creación de esquemas, tablas, cargas y pruebas de consultas.
---

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Gestor de Base de Datos:** Microsoft SQL Server (Transact-SQL).
* **Modelado:** ERDPlus / Herramientas de diseño relacional.
* **Control de Versiones:** Git y GitHub.

---

## 🚀 Cómo probar las consultas
1. Clona este repositorio o descarga los scripts SQL.
2. Abre tu entorno de **SQL Server Management Studio (SSMS)**.
3. Ejecuta primero los scripts de creación de la base de datos ubicados en las etapas anteriores si aún no la tienes cargada.
4. Abre los archivos de la **Etapa IV** para probar los scripts de facturación, reportes con `GROUP BY` y consultas con subconsultas y `HAVING`.
