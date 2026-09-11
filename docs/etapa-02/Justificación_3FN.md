# Justificación del Proceso de Normalización (1FN, 2FN y 3FN)
**Proyecto:** Sistema de Gestión de Librería ("Yenny - El Ateneo")  
**Equipo:** 27  
**Etapa:** II - Modelado Conceptual y Lógico  

A continuación se detalla la evolución y aplicación sistemática de las reglas de normalización sobre el esquema relacional del sistema, garantizando la atomicidad de los datos, la integridad referencial y la eliminación total de dependencias redundantes.

---

### 1. Primera Forma Normal (1FN)
Una tabla se encuentra en 1FN si y solo si todos sus atributos contienen valores atómicos (indivisibles) y no existen grupos repetitivos ni atributos multivaluados dentro de una misma tupla:

- **Descomposición de atributos multivaluados (Teléfonos):** 
  En el modelo conceptual, tanto los clientes como los proveedores cuentan con números de contacto que pueden ser múltiples. Para evitar listas separadas por comas o columnas repetitivas (`telefono_1`, `telefono_2`), se crearon tablas dedicadas:
  - `Telefono_Cliente` con clave primaria compuesta `(DNI, Telefono)`[cite: 3].
  - `Telefono_Proveedor` con clave primaria compuesta `(CUIT, Telefono)`[cite: 3].
  Esto asegura la atomicidad y permite que un cliente o proveedor registre $N$ teléfonos sin duplicar registros principales[cite: 3].
- **Descomposición de atributos compuestos (Dirección):** 
  La dirección del proveedor se desglosó en componentes elementales: `Calle` e `Id_localidad` (FK)[cite: 3]. No se almacena una cadena de texto consolidada, facilitando consultas precisas.

---

### 2. Segunda Forma Normal (2FN)
Una tabla se encuentra en 2FN si ya cumple con la 1FN y todos sus atributos no clave poseen **dependencia funcional completa** respecto a la clave primaria. Esto aplica específicamente a las tablas cuyas claves primarias son compuestas (tablas asociativas/intermedias):

- **`Detalle_venta` [PK: `(Id_venta, Id_producto)`]:** 
  Los atributos no clave `Cantidad` y `precio_unitario` dependen funcionalmente de la combinación completa de ambos identificadores[cite: 3]. La cantidad vendida solo tiene sentido para un producto específico en una transacción puntual, y el precio unitario corresponde al valor histórico pactado en esa venta en particular[cite: 3]. Ninguno depende únicamente de `Id_venta` ni de `Id_producto` por separado[cite: 3].
- **`Producto_Deposito` [PK: `(Id_producto, Id_deposito)`]:** 
  Los atributos `Stock_disponible` y `Stock_minimo` dependen de la combinación de ambos campos, ya que cuantifican la existencia física de un producto específico en un depósito determinado[cite: 3].
- **`Proveedor_Producto` [PK: `(CUIT, Id_producto)`]:** 
  Resuelve la relación muchos a muchos ($N:M$) entre proveedores y artículos sin albergar atributos parciales redundantes[cite: 3].
- **`Pago_Ventas` [PK: `(Id_venta, Id_medio_pago)`]:** 
  El atributo `Monto_ingresado` depende conjuntamente de la venta y del canal de cobro utilizado, permitiendo desglosar pagos mixtos sin dependencias parciales[cite: 3].

---

### 3. Tercera Forma Normal (3FN)
Una tabla se encuentra en 3FN si ya cumple con la 2FN y **no existen dependencias transitivas** entre atributos no clave ($X \rightarrow Y$, donde $Y$ no es un subconjunto de ninguna clave candidata):

- **Catálogos independientes de Clasificación (`Categoria` y `Genero`):** 
  En `Producto`, el nombre descriptivo de la categoría o género literario generaría anomalías de actualización y redundancia si se almacenara como texto plano[cite: 3]. Se aislaron las entidades `Categoria` e `Genero` con sus respectivas claves primarias, migrando únicamente `Id_categoria (FK)` e `Id_genero (FK)` hacia la tabla `Producto`[cite: 3]. De este modo, un cambio de nombre en una categoría se actualiza en una sola tupla.
- **Normalización Jerárquica Geográfica (`Localidad` y `Provincia`):** 
  En `Proveedor`, la provincia no depende directamente del proveedor, sino de la localidad geográfica a la que pertenece su domicilio[cite: 3]. Almacenar la provincia junto al proveedor introduciría una dependencia transitiva (`CUIT` $\rightarrow$ `Id_localidad` $\rightarrow$ `Id_provincia`)[cite: 3]. Se resolvió estructurando dos tablas normalizadas:
  - `Localidad` [PK: `Id_localidad`, FK: `Id_provincia`][cite: 3].
  - `Provincia` [PK: `Id_provincia`].
- **Segregación del Documento Fiscal (`Comprobante`):** 
  Los datos de facturación e importes calculados (`Comprobante`, `Subtotal`, `Descuento`, `Precio_total`) se aislaron de la transacción base de `Ventas`, estructurando la emisión formal del ticket fiscal vinculada a la venta mediante clave foránea.
- **Inmutabilidad y Preservación Histórica del Precio:** 
  El atributo `precio_unitario` en `Detalle_venta` evita que el historial contable de ventas dependa transitivamente del atributo `Precio` dinámico de la tabla `Producto`[cite: 3].

---

**Resultado final:** El modelo resultante garantiza que cada atributo no clave dependa únicamente de la clave primaria (1FN), de la clave completa (2FN) y de nada más que de la clave (3FN), asegurando integridad frente a inserciones, actualizaciones y borrados.