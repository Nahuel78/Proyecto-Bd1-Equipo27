# Etapa 3: Pruebas de Validación (DML)

Este documento contiene el plan de pruebas para verificar el correcto funcionamiento del modelo físico, la inserción válida del circuito completo de datos y la comprobación de que el motor de base de datos hace cumplir activamente cada restricción de integridad (`CHECK`, `UNIQUE`, `FOREIGN KEY`).

---

## 1. Carga de Datos Válidos (Happy Path)

Ejecutar el siguiente bloque para poblar la base con datos válidos que cubren todo el circuito:

```sql
USE BD_VENTAS;
GO

-- 1. Tablas Maestras
INSERT INTO Provincia (Nombre_provincia) VALUES ('Corrientes'), ('Chaco'), ('Misiones');
INSERT INTO Categoria (Nombre_categoria) VALUES ('Indumentaria'), ('Calzado'), ('Accesorios');
INSERT INTO Genero (Nombre_genero) VALUES ('Masculino'), ('Femenino'), ('Unisex');
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Efectivo', 0.00), ('Mercado Pago', 1.50);
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Al día', 0, NULL);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES 
('40123456', 'Nahuel', 'Giménez', 'nahuel@gmail.com', 1),
('35987654', 'María', 'López', 'maria_lopez@hotmail.com', 0);
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('3794112233', '40123456');

-- 2. Localidades y Proveedores
INSERT INTO Localidad (Nombre_localidad, Id_provincia) VALUES ('Corrientes Capital', 1), ('Resistencia', 2);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES 
('30-71112233-4', 'Av. 3 de Abril 1540', 'Distribuidora Litoral S.R.L.', 'ventas@litoral.com', 1);
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('3794-001122', '30-71112233-4');

-- 3. Productos y Stock
INSERT INTO Producto (Titulo_nombre, Codigo_barra, Precio, Id_categoria, Id_genero) VALUES 
('Camiseta Titular Boca Juniors', '779001', 45000.00, 1, 3),
('Zapatillas Running Ultraboost', '779002', 85000.00, 2, 1);

INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('30-71112233-4', 1);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (1, 1, 5, 20);

-- 4. Circuito de Venta Completo
INSERT INTO Ventas (Fecha_compra, DNI) VALUES (GETDATE(), '40123456'); -- Genera Id_venta = 1
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (1, 1, 2, 45000.00);
INSERT INTO Comprobante (Id_venta, Descuento, Subtotal, Precio_total) VALUES (1, 9000.00, 90000.00, 81000.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (2, 1, 81000.00);
GO