# Etapa 3: Restricciones de Integridad

En este documento se detallan y clasifican las restricciones implementadas en la base de datos `BD_VENTAS` para garantizar la consistencia, validez y precisión de la información según las reglas del negocio.

---

## 1. Integridad de Entidad (Primary Keys)
Garantizan que cada tupla en cada relación sea única y no nula:
* `PK_Provincia`: `Id_provincia`
* `PK_Cliente`: `DNI`
* `PK_Categoria`: `Id_categoria`
* `PK_Genero`: `Id_genero`
* `PK_Medio_Pago`: `Id_medio_pago`
* `PK_Deposito`: `Id_deposito`
* `PK_Localidad`: `Id_localidad`
* `PK_Proveedor`: `CUIT`
* `PK_Telefono_Proveedor`: Clave compuesta `(Telefono, CUIT)`
* `PK_Producto`: `Id_producto`
* `PK_Proveedor_Producto`: Clave compuesta `(CUIT, Id_producto)`
* `PK_Producto_Deposito`: Clave compuesta `(Id_producto, Id_deposito)`
* `PK_Telefono_Cliente`: Clave compuesta `(Telefono, DNI)`
* `PK_Ventas`: `Id_venta`
* `PK_Detalle_venta`: Clave compuesta `(Id_producto, Id_venta)`
* `PK_Comprobante`: `Id_comprobante`
* `PK_Pago_Ventas`: Clave compuesta `(Id_medio_pago, Id_venta)`

---

## 2. Integridad Referencial (Foreign Keys)
Aseguran que las relaciones entre entidades sean válidas en todo momento:

| Nombre Restricción | Tabla Origen | Columna(s) | Tabla Destino | Regla ON UPDATE | Regla ON DELETE | Justificación |
|---|---|---|---|---|---|---|
| `FK_Localidad_Provincia` | Localidad | Id_provincia | Provincia | NO ACTION | NO ACTION | No se debe borrar una provincia si tiene localidades vinculadas. |
| `FK_Proveedor_Localidad` | Proveedor | Id_localidad | Localidad | NO ACTION | NO ACTION | Mantiene la integridad del domicilio fiscal. |
| `FK_Telefono_Proveedor` | Telefono_Proveedor | CUIT | Proveedor | CASCADE | CASCADE | Si se elimina o actualiza un proveedor, sus teléfonos asociados se ajustan automáticamente. |
| `FK_Producto_Categoria` | Producto | Id_categoria | Categoria | CASCADE | NO ACTION | Protege el catálogo de productos ante borrados accidentales de categorías. |
| `FK_Producto_Genero` | Producto | Id_genero | Genero | CASCADE | NO ACTION | Impide eliminar géneros asignados a productos existentes. |
| `FK_Proveedor_Producto_Proveedor` | Proveedor_Producto | CUIT | Proveedor | CASCADE | CASCADE | Limpieza automática de la tabla de abastecimiento. |
| `FK_Proveedor_Producto_Producto` | Proveedor_Producto | Id_producto | Producto | CASCADE | CASCADE | Si se elimina un producto, se desvinculan sus proveedores. |
| `FK_Producto_Deposito_Producto` | Producto_Deposito | Id_producto | Producto | NO ACTION | CASCADE | Se depuran las líneas de stock si el producto se da de baja. |
| `FK_Producto_Deposito_Deposito` | Producto_Deposito | Id_deposito | Deposito | NO ACTION | CASCADE | Al eliminar un depósito se dan de baja sus registros de stock. |
| `FK_Telefono_Cliente` | Telefono_Cliente | DNI | Cliente | NO ACTION | CASCADE | Si se borra un cliente, se eliminan sus teléfonos de contacto. |
| `FK_Ventas_Cliente` | Ventas | DNI | Cliente | CASCADE | NO ACTION | **Historial protegido:** No permite borrar un cliente si posee ventas registradas. |
| `FK_Detalle_venta_Producto` | Detalle_venta | Id_producto | Producto | CASCADE | NO ACTION | No permite borrar productos que ya forman parte de un historial de venta. |
| `FK_Detalle_venta_Venta` | Detalle_venta | Id_venta | Ventas | CASCADE | CASCADE | Si se anula la venta cabecera, se eliminan sus ítems de detalle. |
| `FK_Comprobante_Venta` | Comprobante | Id_venta | Ventas | CASCADE | CASCADE | El comprobante depende directamente del ciclo de vida de la venta. |
| `FK_Pago_Ventas_Medio` | Pago_Ventas | Id_medio_pago | Medio_Pago | CASCADE | NO ACTION | Protege los medios de pago utilizados en transacciones. |
| `FK_Pago_Ventas_Venta` | Pago_Ventas | Id_venta | Ventas | CASCADE | CASCADE | Al eliminarse la venta se cancela el registro del pago asociado. |

---

## 3. Integridad de Dominio y Restricciones Semánticas (UNIQUE, CHECK y DEFAULT)

### Restricciones de Unicidad (`UNIQUE`)
* `UQ_Provincia_Nombre`: Evita registrar dos provincias con el mismo nombre.
* `UQ_Cliente_Email`: Evita cuentas de clientes duplicadas mediante el mismo correo.
* `UQ_Categoria_Nombre`: Nombres de categorías únicos en el catálogo.
* `UQ_Genero_Nombre`: Géneros únicos.
* `UQ_Medio_Pago_Nombre`: Nombres de medios de pago únicos.
* `UQ_Localidad`: Restricción compuesta `(Nombre_localidad, Id_provincia)` que permite localidades con el mismo nombre en provincias distintas, pero no duplicadas dentro de la misma provincia.
* `UQ_Proveedor_Email`: Correo único por empresa proveedora.
* `UQ_Producto_Codigo_Barra`: Códigos de barra comerciales únicos en el catálogo.
* `UQ_Comprobante_Venta`: Relación 1 a 1 formal entre `Ventas` y `Comprobante`.

### Restricciones de Chequeo (`CHECK`)
* `CHK_Cliente_Email`: `Email LIKE '%@%'` (Verifica estructura básica de correo electrónico).
* `CHK_Medio_Pago_Tasa`: `Tasa_medio_pago >= 0` (No permite comisiones negativas).
* `CHK_Deposito_Orden`: `Orden_reposicion >= 0`.
* `CHK_Proveedor_Email`: `Email LIKE '%@%'`.
* `CHK_Producto_Precio`: `Precio >= 0` (No permite productos con importe negativo).
* `CHK_Producto_Deposito_Stock_Minimo`: `Stock_minimo >= 0`.
* `CHK_Producto_Deposito_Stock_Disponible`: `Stock_disponible >= 0`.
* `CHK_Detalle_Cantidad`: `Cantidad > 0` (En un detalle de venta se debe comprar al menos 1 unidad).
* `CHK_Detalle_Precio`: `Precio_unitario >= 0`.
* `CHK_Comprobante_Descuento`: `Descuento >= 0`.
* `CHK_Comprobante_Precio_Total`: `Precio_total >= 0`.
* `CHK_Comprobante_Subtotal`: `Subtotal >= 0`.
* `CHK_Pago_Monto`: `Monto_ingresado >= 0`.

### Valores por Defecto (`DEFAULT`)
* `Cliente.Socio_preferencial`: `DEFAULT 0` (Por defecto un cliente no es socio preferencial).
* `Medio_Pago.Tasa_medio_pago`: `DEFAULT 0.00`.
* `Deposito.Orden_reposicion`: `DEFAULT 0`.
* `Producto_Deposito.Stock_minimo`: `DEFAULT 0`.
* `Producto_Deposito.Stock_disponible`: `DEFAULT 0`.
* `Comprobante.Descuento`: `DEFAULT 0.00`.