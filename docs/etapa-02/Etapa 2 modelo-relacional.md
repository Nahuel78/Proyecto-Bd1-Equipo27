# Modelo relacional \- Etapa 2

Este documento contiene la representación en Markdown del diagrama de entidad-relación del sistema.

## 📊 Diagrama de Relaciones 

## modelo relacional

    PROVINCIA {

        int id\_provincia PK

        string nombre\_provincia

    }

    LOCALIDAD {

        int id\_localidad PK

        string nombre\_localidad

        int id\_provincia FK

    }

    PROVEEDOR {

        string CUIT PK

        string calle

        string razon\_social

        string email

        int id\_localidad FK

    }

    TELEFONO\_PROVEEDOR {

        string telefono

        string CUIT FK

    }

    PROVEEDOR\_PRODUCTO {

        string CUIT PK,FK

        int id\_producto PK,FK

    }

    CATEGORIA {

        int id\_categoria PK

        string nombre\_categoria

    }

    GENERO {

        int id\_genero PK

        string nombre\_genero

    }

    PRODUCTO {

        int id\_producto PK

        string titulo\_nombre

        string codigo\_barra

        float precio

        int id\_categoria FK

        int id\_genero FK

    }

    DEPOSITO {

        int id\_deposito PK

        string nombre\_deposito

        string direccion

        date fecha\_creacion

    }

    PRODUCTO\_DEPOSITO {

        int id\_producto PK,FK

        int id\_deposito PK,FK

        int stock\_disponible

    }

    CLIENTE {

        string DNI PK

        string nombre

        string apellido

        string email

        boolean socio\_preferencial

    }

    TELEFONO\_CLIENTE {

        string telefono

        string DNI FK

    }

    VENTAS {

        int id\_venta PK

        date fecha\_compra

        string DNI FK

    }

    DETALLE\_VENTA {

        int id\_producto PK,FK

        int id\_venta PK,FK

        int cantidad

        float precio\_unitario

    }

    COMPROBANTE {

        int id\_comprobante PK

        float importe

        float descuento

        float precio\_total

        float subtotal

        int id\_venta FK

    }

    MEDIO\_PAGO {

        int id\_medio\_pago PK

        string nombre\_medio

        string tipo\_movimiento

    }

    PAGO\_VENTAS {

        int id\_medio\_pago PK,FK

        int id\_venta PK,FK

        float monto\_ingresado

    }

    PROVINCIA ||--o{ LOCALIDAD : "tiene"

    LOCALIDAD ||--o{ PROVEEDOR : "pertenece"

    PROVEEDOR ||--o{ TELEFONO\_PROVEEDOR : "tiene"

    PROVEEDOR ||--o{ PROVEEDOR\_PRODUCTO : "provee"

    PRODUCTO ||--o{ PROVEEDOR\_PRODUCTO : "es\_proveído\_por"

    CATEGORIA ||--o{ PRODUCTO : "clasifica"

    GENERO ||--o{ PRODUCTO : "clasifica"

    PRODUCTO ||--o{ PRODUCTO\_DEPOSITO : "almacena"

    DEPOSITO ||--o{ PRODUCTO\_DEPOSITO : "contiene"

    CLIENTE ||--o{ TELEFONO\_CLIENTE : "tiene"

    CLIENTE ||--o{ VENTAS : "realiza"

    VENTAS ||--o{ DETALLE\_VENTA : "contiene"

    PRODUCTO ||--o{ DETALLE\_VENTA : "incluye"

    VENTAS ||--o| COMPROBANTE : "genera"

    VENTAS ||--o{ PAGO\_VENTAS : "paga"

    MEDIO\_PAGO ||--o{ PAGO\_VENTAS : "utiliza"

---

## 📋 Detalle de Tablas y Atributos

### 1. Ubicación y Proveedores

* **Provincia**: `id_provincia` (PK), `nombre_provincia`  
* **Localidad**: `id_localidad` (PK), `nombre_localidad`, `id_provincia` (FK)  
* **Proveedor**: `CUIT` (PK), `calle`, `razon_social`, `email`, `id_localidad` (FK)  
* **Telefono\_Proveedor**: `telefono`, `CUIT` (FK)  
* **Proveedor\_Producto**: `CUIT` (PK/FK), `id_producto` (PK/FK)

### 2\. Catálogo y Stock

* **Categoria**: `id_categoria` (PK), `nombre_categoria`  
* **Genero**: `id_genero` (PK), `nombre_genero`  
* **Producto**: `id_producto` (PK), `titulo_nombre`, `codigo_barra`, `precio`, `id_categoria` (FK), `id_genero` (FK)  
* **Deposito**: `id_deposito` (PK), `nombre_deposito`, `direccion`, `fecha_creacion`  
* **Producto\_Deposito**: `id_producto` (PK/FK), `id_deposito` (PK/FK), `stock_disponible`

### 3\. Clientes y Ventas

* **Cliente**: `DNI` (PK), `nombre`, `apellido`, `email`, `socio_preferencial`  
* **Telefono\_Cliente**: `telefono`, `DNI` (FK)  
* **Ventas**: `id_venta` (PK), `fecha_compra`, `DNI` (FK)  
* **Detalle\_Venta**: `id_producto` (PK/FK), `id_venta` (PK/FK), `cantidad`, `precio_unitario`  
* **Comprobante**: `id_comprobante` (PK), `importe`, `descuento`, `precio_total`, `subtotal`, `id_venta` (FK)  
* **Medio\_Pago**: `id_medio_pago` (PK), `nombre_medio`, `tipo_movimiento`  
* **Pago\_Ventas**: `id_medio_pago` (PK/FK), `id_venta` (PK/FK), `monto_ingresado`