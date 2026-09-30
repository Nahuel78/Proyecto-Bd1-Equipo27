# Etapa 3: Implementación del Modelo Físico (DDL)

## 1. Descripción General
En esta etapa se realiza la implementación física de la base de datos relacional `BD_VENTAS` sobre el motor **Microsoft SQL Server**, traduciendo el esquema relacional normalizado a sentencias DDL (`CREATE DATABASE`, `CREATE TABLE`).

## 2. Decisiones de Diseño y Tipos de Datos
* **Claves Numéricas e Incrementales:** Para las entidades catálogo y transaccionales (`Provincia`, `Categoria`, `Genero`, `Medio_Pago`, `Deposito`, `Localidad`, `Producto`, `Ventas`, `Comprobante`), se utilizó el tipo de dato `INT` junto con la propiedad `IDENTITY(1,1)` para garantizar claves subrogadas autoincrementales, consistentes y de bajo consumo de almacenamiento.
* **Identificadores Naturales:** Se mantuvieron como claves primarias naturales aquellas entidades que poseen identificación unívoca estándar: `Cliente(DNI)` con `VARCHAR(10)` y `Proveedor(CUIT)` con `VARCHAR(13)`.
* **Manejo de Monedas y Precios:** Para todos los importes monetarios (`Precio`, `Cantidad`, `Precio_unitario`, `Descuento`, `Subtotal`, `Precio_total`, `Monto_ingresado`), se utilizó `DECIMAL(12,2)` para evitar errores de redondeo de punto flotante.
* **Orden de Creación de Tablas:** El script respeta el orden estricto de dependencias por claves foráneas:
  1. Tablas independientes / maestras (`Provincia`, `Cliente`, `Categoria`, `Genero`, `Medio_Pago`, `Deposito`).
  2. Tablas dependientes de primer orden (`Localidad`, `Telefono_Cliente`).
  3. Tablas dependientes de segundo orden (`Proveedor`, `Producto`).
  4. Tablas intermedias N:M y dependientes (`Telefono_Proveedor`, `Proveedor_Producto`, `Producto_Deposito`).
  5. Circuito transaccional de ventas (`Ventas`, `Detalle_venta`, `Comprobante`, `Pago_Ventas`).

---

## 3. Script SQL de Implementación (DDL)

```sql
CREATE DATABASE BD_VENTAS;
GO

USE BD_VENTAS;
GO

-- 1. Provincia
CREATE TABLE Provincia (
    Id_provincia INT IDENTITY(1,1),
    Nombre_provincia VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Provincia PRIMARY KEY (Id_provincia),
    CONSTRAINT UQ_Provincia_Nombre UNIQUE (Nombre_provincia)
);
GO

-- 2. Cliente
CREATE TABLE Cliente (
    DNI VARCHAR(10),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL,
    Socio_preferencial BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Cliente PRIMARY KEY (DNI),
    CONSTRAINT UQ_Cliente_Email UNIQUE (Email),
    CONSTRAINT CHK_Cliente_Email CHECK (Email LIKE '%@%')
);
GO

-- 3. Categoria
CREATE TABLE Categoria (
    Id_categoria INT IDENTITY(1,1),
    Nombre_categoria VARCHAR(80) NOT NULL,
    CONSTRAINT PK_Categoria PRIMARY KEY (Id_categoria),
    CONSTRAINT UQ_Categoria_Nombre UNIQUE (Nombre_categoria)
);
GO

-- 4. Genero
CREATE TABLE Genero (
    Id_genero INT IDENTITY(1,1),
    Nombre_genero VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Genero PRIMARY KEY (Id_genero),
    CONSTRAINT UQ_Genero_Nombre UNIQUE (Nombre_genero)
);
GO

-- 5. Medio_Pago
CREATE TABLE Medio_Pago (
    Id_medio_pago INT IDENTITY(1,1),
    Nombre_medio VARCHAR(50) NOT NULL,
    Tasa_medio_pago DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT PK_Medio_Pago PRIMARY KEY (Id_medio_pago),
    CONSTRAINT UQ_Medio_Pago_Nombre UNIQUE (Nombre_medio),
    CONSTRAINT CHK_Medio_Pago_Tasa CHECK (Tasa_medio_pago >= 0)
);
GO

-- 6. Deposito
CREATE TABLE Deposito (
    Id_deposito INT IDENTITY(1,1),
    Estado_reposicion VARCHAR(30) NOT NULL,
    Orden_reposicion INT NOT NULL DEFAULT 0,
    Fecha_reposicion DATE NULL,
    CONSTRAINT PK_Deposito PRIMARY KEY (Id_deposito),
    CONSTRAINT CHK_Deposito_Orden CHECK (Orden_reposicion >= 0)
);
GO

-- 7. Localidad
CREATE TABLE Localidad (
    Id_localidad INT IDENTITY(1,1),
    Nombre_localidad VARCHAR(100) NOT NULL,
    Id_provincia INT NOT NULL,
    CONSTRAINT PK_Localidad PRIMARY KEY (Id_localidad),
    CONSTRAINT UQ_Localidad UNIQUE (Nombre_localidad, Id_provincia),
    CONSTRAINT FK_Localidad_Provincia
        FOREIGN KEY (Id_provincia)
        REFERENCES Provincia(Id_provincia)
        ON DELETE NO ACTION
);
GO

-- 8. Proveedor
CREATE TABLE Proveedor (
    CUIT VARCHAR(13),
    Calle VARCHAR(120) NOT NULL,
    Razon_social VARCHAR(120) NOT NULL,
    Email VARCHAR(120) NOT NULL,
    Id_localidad INT NOT NULL,
    CONSTRAINT PK_Proveedor PRIMARY KEY (CUIT),
    CONSTRAINT UQ_Proveedor_Email UNIQUE (Email),
    CONSTRAINT CHK_Proveedor_Email CHECK (Email LIKE '%@%'),
    CONSTRAINT FK_Proveedor_Localidad
        FOREIGN KEY (Id_localidad)
        REFERENCES Localidad(Id_localidad)
        ON DELETE NO ACTION
);
GO

-- 9. Telefono_Proveedor
CREATE TABLE Telefono_Proveedor (
    Telefono VARCHAR(25),
    CUIT VARCHAR(13),
    CONSTRAINT PK_Telefono_Proveedor PRIMARY KEY (Telefono, CUIT),
    CONSTRAINT FK_Telefono_Proveedor
        FOREIGN KEY (CUIT)
        REFERENCES Proveedor(CUIT)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- 10. Producto
CREATE TABLE Producto (
    Id_producto INT IDENTITY(1,1),
    Titulo_nombre VARCHAR(120) NOT NULL,
    Codigo_barra VARCHAR(30) NOT NULL,
    Precio DECIMAL(12,2) NOT NULL,
    Id_categoria INT NOT NULL,
    Id_genero INT NOT NULL,
    CONSTRAINT PK_Producto PRIMARY KEY (Id_producto),
    CONSTRAINT UQ_Producto_Codigo_Barra UNIQUE (Codigo_barra),
    CONSTRAINT CHK_Producto_Precio CHECK (Precio >= 0),
    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (Id_categoria)
        REFERENCES Categoria(Id_categoria)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_Producto_Genero
        FOREIGN KEY (Id_genero)
        REFERENCES Genero(Id_genero)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO

-- 11. Proveedor_Producto
CREATE TABLE Proveedor_Producto (
    CUIT VARCHAR(13),
    Id_producto INT,
    CONSTRAINT PK_Proveedor_Producto PRIMARY KEY (CUIT, Id_producto),
    CONSTRAINT FK_Proveedor_Producto_Proveedor
        FOREIGN KEY (CUIT)
        REFERENCES Proveedor(CUIT)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_Proveedor_Producto_Producto
        FOREIGN KEY (Id_producto)
        REFERENCES Producto(Id_producto)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- 12. Producto_Deposito
CREATE TABLE Producto_Deposito (
    Id_producto INT,
    Id_deposito INT,
    Stock_minimo INT NOT NULL DEFAULT 0,
    Stock_disponible INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Producto_Deposito PRIMARY KEY (Id_producto, Id_deposito),
    CONSTRAINT CHK_Producto_Deposito_Stock_Minimo CHECK (Stock_minimo >= 0),
    CONSTRAINT CHK_Producto_Deposito_Stock_Disponible CHECK (Stock_disponible >= 0),
    CONSTRAINT FK_Producto_Deposito_Producto
        FOREIGN KEY (Id_producto)
        REFERENCES Producto(Id_producto)
        ON DELETE CASCADE,
    CONSTRAINT FK_Producto_Deposito_Deposito
        FOREIGN KEY (Id_deposito)
        REFERENCES Deposito(Id_deposito)
        ON DELETE CASCADE
);
GO

-- 13. Telefono_Cliente
CREATE TABLE Telefono_Cliente (
    Telefono VARCHAR(25),
    DNI VARCHAR(10),
    CONSTRAINT PK_Telefono_Cliente PRIMARY KEY (Telefono, DNI),
    CONSTRAINT FK_Telefono_Cliente
        FOREIGN KEY (DNI)
        REFERENCES Cliente(DNI)
        ON DELETE CASCADE
);
GO

-- 14. Ventas
CREATE TABLE Ventas (
    Id_venta INT IDENTITY(1,1),
    Fecha_compra DATETIME NOT NULL,
    DNI VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Ventas PRIMARY KEY (Id_venta),
    CONSTRAINT FK_Ventas_Cliente
        FOREIGN KEY (DNI)
        REFERENCES Cliente(DNI)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO

-- 15. Detalle_venta
CREATE TABLE Detalle_venta (
    Id_producto INT,
    Id_venta INT,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(12,2) NOT NULL,
    CONSTRAINT PK_Detalle_venta PRIMARY KEY (Id_producto, Id_venta),
    CONSTRAINT CHK_Detalle_Cantidad CHECK (Cantidad > 0),
    CONSTRAINT CHK_Detalle_Precio CHECK (Precio_unitario >= 0),
    CONSTRAINT FK_Detalle_venta_Producto
        FOREIGN KEY (Id_producto)
        REFERENCES Producto(Id_producto)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_Detalle_venta_Venta
        FOREIGN KEY (Id_venta)
        REFERENCES Ventas(Id_venta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- 16. Comprobante
CREATE TABLE Comprobante (
    Id_comprobante INT IDENTITY(1,1),
    Id_venta INT NOT NULL,
    Descuento DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    Precio_total DECIMAL(12,2) NOT NULL,
    Subtotal DECIMAL(12,2) NOT NULL,
    CONSTRAINT PK_Comprobante PRIMARY KEY (Id_comprobante),
    CONSTRAINT UQ_Comprobante_Venta UNIQUE (Id_venta),
    CONSTRAINT CHK_Comprobante_Descuento CHECK (Descuento >= 0),
    CONSTRAINT CHK_Comprobante_Precio_Total CHECK (Precio_total >= 0),
    CONSTRAINT CHK_Comprobante_Subtotal CHECK (Subtotal >= 0),
    CONSTRAINT FK_Comprobante_Venta
        FOREIGN KEY (Id_venta)
        REFERENCES Ventas(Id_venta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- 17. Pago_Ventas
CREATE TABLE Pago_Ventas (
    Id_medio_pago INT,
    Id_venta INT,
    Monto_ingresado DECIMAL(12,2) NOT NULL,
    CONSTRAINT PK_Pago_Ventas PRIMARY KEY (Id_medio_pago, Id_venta),
    CONSTRAINT CHK_Pago_Monto CHECK (Monto_ingresado >= 0),
    CONSTRAINT FK_Pago_Ventas_Medio
        FOREIGN KEY (Id_medio_pago)
        REFERENCES Medio_Pago(Id_medio_pago)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_Pago_Ventas_Venta
        FOREIGN KEY (Id_venta)
        REFERENCES Ventas(Id_venta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO