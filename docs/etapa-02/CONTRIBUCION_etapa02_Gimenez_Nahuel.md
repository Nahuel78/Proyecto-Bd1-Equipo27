# Contribución individual -- Etapa 02
**Equipo:** 27 
**Integrante:** Carlos Nahuel Giménez 
**Fecha:** 2026-09-11

## 1. Aporte realizado
En esta etapa me enfoqué en armar y corregir los diagramas en ERDPlus para el sistema de la librería:
- Pasé las relaciones de muchos a muchos a tablas reales: armé `Detalle_venta` (para unir ventas con productos), `Proveedor_Producto` y `Producto_Deposito`.
- Ayudé a ordenar los datos para que no se repitan cosas innecesarias, sacando categorías, géneros de libros y las localidades de los proveedores a tablas aparte.
- Separé los teléfonos de los clientes y proveedores para que cada persona o empresa pueda tener más de un número sin problemas.

## 2. Decisiones en las que participé
- **Congelar el precio en cada venta:** Decidimos meter el precio unitario adentro de `Detalle_venta`. Si no hacíamos esto, cuando un libro subiera de precio en el sistema, se iban a modificar solos los precios de ventas hechas meses atrás.
- **Cómo controlar el stock:** Optamos por crear una tabla intermedia entre `Producto` y `Deposito` para registrar ahí cuánto stock disponible y stock mínimo hay de cada artículo en cada lugar.
- **Permitir varios pagos:** Diseñamos la tabla `Pago_ventas` para que una persona pueda pagar una misma compra repartiendo el monto (por ejemplo, mitad efectivo y mitad tarjeta).
- **Separar provincias y localidades:** Acordamos no escribir la ciudad y provincia a mano como texto en cada proveedor, sino vincularlas con códigos para no tener errores de tipeo ni datos duplicados.

## 3. Problemas o dificultades identificadas
- **Los dos diagramas no decían lo mismo:** Al pasar a tablas agregamos cosas más detalladas (como las tablas de `Categoria` y `Localidad`), pero en el diagrama conceptual (DER) nos habían quedado todavía como simples datos sueltos adentro de Producto y Proveedor.
- **Nombres cruzados en las claves:** En la tabla de stock le habíamos puesto `Id_stock` al campo que se conectaba con Depósito, cuando en la tabla original se llamaba `Id_deposito`. Eso generaba confusión de qué campo se conectaba con cuál.
- **El error en los teléfonos:** Habíamos puesto solo el teléfono como identificador principal, sin darnos cuenta de que dos personas pueden compartir el mismo número (como un teléfono fijo de casa) y el sistema no lo iba a permitir.

## 4. Soluciones o propuestas realizadas
- **Usar claves compuestas:** Propuse que en las tablas de teléfonos la clave sea la combinación del DNI/CUIT con el número, y lo mismo en las tablas intermedias (unir los dos IDs) para que el registro sea único.
- **Corregir el nombre de las claves:** Cambiar `Id_stock` por `Id_deposito` en la tabla intermedia para que coincida exactamente con la tabla de donde viene.
- **Emparejar los dos esquemas:** Dejar anotado que en el DER conceptual hay que reflejar las tablas nuevas que armamos en el relacional para que ambos dibujos coincidan.

## 5. Evidencias en el repositorio
- `docs/etapa-02/esquema relacional etapa 2.png`: Imagen del diagrama relacional en ERDPlus con las tablas y claves primarias/foráneas.
- `docs/etapa-02/Etapa.2.png`: Imagen del diagrama entidad-relación (DER) conceptual.
- `docs/etapa-02/CONTRIBUCION_etapa02_Gimenez_Nahuel.md`: Archivo con este manifiesto de contribución individual.
- **Commit:** "docs(etapa-02): agrega diagramas DER, relacional y manifiesto individual"
- **Rama:** `main` (repositorio: `https://github.com/Nahuel78/Proyecto-Bd1-Equipo27`)

## 6. Reflexión individual
Lo que más me quedó claro en esta etapa es que los dos diagramas tienen que coincidir siempre: no podés inventar una tabla en el esquema relacional que después no exista en el DER. También aprendí a ver los problemas de la vida real en el diseño, como acordarse de congelar el precio en un ticket para que la inflación no te cambie las ventas pasadas, o cómo resolver que una persona tenga más de un teléfono sin romper la base de datos.
