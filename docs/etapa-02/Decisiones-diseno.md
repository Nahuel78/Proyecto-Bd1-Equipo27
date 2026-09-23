# Proceso de Diseño de Bases de Datos y Normalización

El proceso de diseño de bases de datos que muestran las imágenes transita desde una visión abstracta del mundo real hasta una estructura técnica y optimizada. A continuación, se detalla el recorrido metodológico y la justificación detrás de cada decisión.

---

## 1\. Del Dominio al DER (Modelo Conceptual)

El diseño comienza analizando las reglas del negocio y los requerimientos del dominio real:

* **Identificación de Entidades:** Se detectan los objetos principales del sistema que poseen existencia propia y sobre los cuales interesa almacenar información, tales como Cliente, Producto, Proveedor, Ventas, Depósito y Medio Pago.  
* **Definición de Atributos:** A cada entidad se le asignan sus características descriptivas; por ejemplo, la entidad Cliente define atributos como DNI, Nombre, Apellido y Email.  
* **Establecimiento de Relaciones y Cardinalidades:** Se define cómo interactúan las entidades entre sí (por ejemplo, un Cliente *Realiza* Ventas, o un Proveedor *Provee* Productos) determinando los grados de participación y los límites de las asociaciones.

---

## 2\. Del DER al Modelo Relacional (Modelo Lógico)

Una vez obtenido el diagrama conceptual, este se traduce a un esquema relacional estructurado en tablas (relaciones) apto para un Sistema de Gestión de Bases de Datos (SGBD):

* **Transformación de Entidades en Tablas:** Cada entidad del DER pasa a ser una tabla con filas y columnas (por ejemplo, las tablas Cliente, Producto, Proveedor y Localidad).  
* **Asignación de Claves Primarias (PK):** Los identificadores únicos del DER se convierten en las Claves Primarias que garantizan la unicidad de cada registro (como el DNI en la tabla Cliente o Id\_producto en Producto).  
* **Resolución de Atributos Multivaluados:** Los atributos que pueden tener múltiples valores para una misma entidad (como los números de teléfono) se extraen a tablas independientes vinculadas por una clave foránea, generando tablas como Telefono\_Cliente y Telefono\_Proveedor.  
* **Resolución de Relaciones Muchos a Muchos (N:M):** Las relaciones complejas se descomponen creando tablas intermedias o asociativas. Un ejemplo de esto es la tabla Proveedor\_Producto o Producto\_Deposito, las cuales conectan ambas entidades mediante las respectivas claves foráneas (FK).

