# Contribución individual -- Etapa 02
**Equipo:** 27 
**Integrante:** Carlos Nahuel Giménez 
**Fecha:** 2026-09-11

## 1. Aporte realizado
En esta etapa me enfoqué en armar, revisar y corregir los diagramas en ERDPlus para el sistema de gestión de la librería:
- Pasé las relaciones de muchos a muchos a tablas asociativas reales: armé `Detalle_venta` (para relacionar ventas con productos), `Proveedor_Producto` y `Producto_Deposito`.
- Ayudé a normalizar la base de datos hasta 3FN para eliminar redundancias: separamos las categorías, géneros y la estructura geográfica (localidades y provincias) en tablas independientes.
- Descompuse los atributos multivaluados de teléfonos en clientes y proveedores para garantizar la atomicidad en 1FN.

## 2. Decisiones en las que participé
- **Congelar el precio histórico de venta:** Decidimos registrar `precio_unitario` adentro de `Detalle_venta` para asegurar que las actualizaciones de precios en `Producto` no alteren las ventas registradas con anterioridad.
- **Control de stock por ubicación:** Creamos la tabla intermedia `Producto_Deposito` para registrar las existencias reales (`Stock_disponible`) y el punto de reposición (`Stock_minimo`) por cada depósito de la sucursal.
- **Soporte de pagos múltiples:** Diseñamos la tabla intermedia `Pago_Ventas` con `Monto_ingresado` para permitir transacciones con medios de pago combinados (ej. efectivo y tarjeta).
- **Segregación del documento fiscal:** Se aisló la entidad `Comprobante` de la cabecera comercial `Ventas` para estructurar la emisión formal del comprobante y sus importes calculados (subtotal, descuento y total).
- **Jerarquía geográfica limpia:** Normalizamos la dirección del proveedor vinculándolo a `Localidad` y esta a su vez a `Provincia`, eliminando dependencias transitivas.

## 3. Problemas o dificultades identificadas
- **Inconsistencias entre DER y Relacional:** Al normalizar a tablas lógicas agregamos entidades necesarias (como `Categoria`, `Genero`, `Localidad`), pero en el DER inicial seguían figurando como atributos simples, lo que rompía la correspondencia entre ambos modelos.
- **Claves foráneas invertidas y cruzadas:** Detectamos que se habían ubicado claves foráneas en las tablas de catálogo (`Id_producto` dentro de Categoría/Género) y nombres inconsistentes como `Id_stock` en vez de `Id_deposito` en la tabla intermedia de depósitos.
- **Riesgo de unicidad en teléfonos:** Advertimos que definir únicamente `Telefono` como PK impedía registrar el mismo número de contacto fijo para más de un cliente o proveedor.

## 4. Soluciones o propuestas realizadas
- **Definición de claves compuestas:** Propuse establecer claves primarias compuestas en `Telefono_Cliente` (`DNI` + `Telefono`) y `Telefono_Proveedor` (`CUIT` + `Telefono`), además de componer las PK de las tablas intermedias (`Detalle_venta`, `Producto_Deposito`, `Proveedor_Producto`).
- **Corrección de dependencias y foráneas:** Reubicar las FK `Id_categoria` e `Id_genero` dentro de la tabla `Producto`, y corregir la referencia a `Id_deposito` en `Producto_Deposito`.
- **Documentación de normalización formal:** Redactar la justificación técnica paso a paso (1FN, 2FN y 3FN) para fundamentar formalmente cada una de las tablas desagregadas.

## 5. Evidencias en el repositorio
- `docs/etapa-02/Etapa 2 Esquema relacional.png`: Diagrama relacional lógico final en ERDPlus con tablas, PKs y FKs.
- `docs/etapa-02/Etapa 2 diagrama.png`: Diagrama conceptual Entidad-Relación (DER) en ERDPlus.
- `docs/etapa-02/justificacion_3fn.md`: Documentación técnica del proceso de normalización (1FN, 2FN y 3FN).
- `docs/etapa-02/CONTRIBUCION_etapa02_Gimenez_Nahuel.md`: Archivo con este manifiesto de contribución individual.
- **Commit:** "docs(etapa-02): version final de diagramas DER, relacional y normalizacion 3FN"
- **Rama:** `main` (repositorio: `https://github.com/Nahuel78/Proyecto-Bd1-Equipo27`)

## 6. Reflexión individual
Esta etapa me permitió entender en profundidad la necesidad de mantener total consistencia entre el diseño conceptual y el lógico: una tabla o relación no puede surgir en el relacional sin un sustento claro en las reglas del negocio y en el DER. Además, poner en práctica la normalización demostró cómo resolver problemas reales de negocio, tales como evitar la sobreescritura de precios históricos o estructurar correctamente atributos repetitivos sin redundancia de datos.