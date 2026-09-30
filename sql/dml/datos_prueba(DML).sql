-- -------------------------------------------------------------------------
-- SCRIPT DML (Data Manipulation Language) 
-- -------------------------------------------------------------------------

-- Tabla: Provincia
INSERT INTO Provincia (Nombre_provincia) VALUES ('Buenos Aires');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Córdoba');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Santa Fe');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Mendoza');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Tucumán');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Entre Ríos');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Salta');
INSERT INTO Provincia (Nombre_provincia) VALUES ('Corrientes');
GO

-- Tabla: Localidad
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('La Plata', 1);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Mar del Plata', 1);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Córdoba Capital', 2);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Villa Carlos Paz', 2);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Rosario', 3);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Santa Fe Capital', 3);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Mendoza Capital', 4);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('San Miguel de Tucumán', 5);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Paraná', 6);
INSERT INTO Localidad (Nombre_localidad, id_provincia) VALUES ('Corrientes Capital', 8);
GO

-- Tabla: Proveedor 
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-11111111-3', 'Av. Corrientes 1234', 'Distribuidora Norte S.R.L.', 'contacto@distribuidoranorte.com', 1);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-22222222-3', 'San Martín 567', 'Comercial del Plata S.A.', 'ventas@comercialplata.com', 2);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-33333333-3', 'Belgrano 890', 'Mayorista Cordobés S.A.', 'info@mayoristacordobes.com', 3);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-44444444-3', 'Mitre 432', 'Litoral Insumos S.R.L.', 'ventas@litoralinsumos.com', 5);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-55555555-3', 'Rivadavia 789', 'Cuyo Logística S.A.', 'contacto@cuyologistica.com', 7);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-66666666-3', 'Sarmiento 159', 'Norte Grande S.R.L.', 'nortegrande@proveedores.com', 8);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-77777777-3', 'San Lorenzo 357', 'Paraná Suministros S.A.', 'ventas@paranasuministros.com', 9);
INSERT INTO Proveedor (CUIT, Calle, Razon_social, Email, Id_localidad) VALUES ('20-88888888-3', 'Catamarca 951', 'Austral Distribuciones S.R.L.', 'info@australdistribuciones.com', 10);
GO

-- Tabla: Telefono_Proveedor
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('011-45678910', '20-11111111-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('011-98765432', '20-11111111-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0223-4987654', '20-22222222-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0351-4231567', '20-33333333-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0341-4789632', '20-44444444-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0261-4253698', '20-55555555-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0381-4312546', '20-66666666-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0343-4221133', '20-77777777-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0379-4466778', '20-88888888-3');
INSERT INTO Telefono_Proveedor (Telefono, CUIT) VALUES ('0379-4499881', '20-88888888-3');
GO

-- Tabla: Categoria 
INSERT INTO Categoria (nombre_categoria) VALUES ('Libros y Literatura');
INSERT INTO Categoria (nombre_categoria) VALUES ('Infantil y Juvenil');
INSERT INTO Categoria (nombre_categoria) VALUES ('Útiles Escolares');
INSERT INTO Categoria (nombre_categoria) VALUES ('Papelería y Oficina');
INSERT INTO Categoria (nombre_categoria) VALUES ('Arte y Manualidades');
GO

-- Tabla: Genero 
INSERT INTO Genero (nombre_genero) VALUES ('Novela y Ficción');
INSERT INTO Genero (nombre_genero) VALUES ('Ciencia Ficción');
INSERT INTO Genero (nombre_genero) VALUES ('Infantil');
INSERT INTO Genero (nombre_genero) VALUES ('Educativo / Texto');
INSERT INTO Genero (nombre_genero) VALUES ('No ficción / Ensayo');
GO

-- Tabla: Producto 
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Cien años de soledad - Gabriel Garcia Marquez', '7791234567890', 18500.00, 1, 1);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('El Principito - Antoine de Saint-Exupery', '7791234567891', 9200.50, 2, 3);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Cuaderno A4 rayado 100 hojas', '7791234567892', 4500.00, 3, 4);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Pack x4 Boligrafos Bic Azul/Negro', '7791234567893', 2800.00, 3, 4);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Rayuela - Julio Cortazar', '7791234567894', 16200.00, 1, 1);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Matemáticas 1er Año Secundaria', '7791234567895', 21000.00, 1, 4);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Carpeta N°3 con cordón', '7791234567896', 6100.00, 4, 4);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Set de 12 Lápices de colores Faber-Castell', '7791234567897', 8900.00, 5, 3);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Fahrenheit 451 - Ray Bradbury', '7791234567898', 14300.00, 1, 2);
INSERT INTO Producto (titulo_nombre, codigo_barra, precio, id_categoria, id_genero) VALUES ('Bloc de hojas Canson N°5 para dibujo', '7791234567899', 7500.00, 5, 3);
GO

-- Tabla: Proveedor_Producto 
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-11111111-3', 1);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-22222222-3', 2);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-33333333-3', 3);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-44444444-3', 4);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-55555555-3', 5);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-66666666-3', 6);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-77777777-3', 7);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-88888888-3', 8);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-11111111-3', 9);
INSERT INTO Proveedor_Producto (CUIT, Id_producto) VALUES ('20-22222222-3', 10);
GO

-- Tabla: Deposito 
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Completado', 101, '20260110 08:30:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Pendiente', 102, '20260215 09:00:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('En Proceso', 103, '20260301 10:15:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Completado', 104, '20260312 11:45:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Urgente', 105, '20260320 14:20:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Completado', 106, '20260325 16:00:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Pendiente', 107, '20260328 08:00:00');
INSERT INTO Deposito (Estado_reposicion, Orden_reposicion, Fecha_reposicion) VALUES ('Cancelado', 108, '20260329 12:30:00');
GO

-- Tabla: Producto_Deposito 
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (1, 1, 5, 20);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (2, 2, 3, 12);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (3, 3, 4, 8);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (4, 4, 2, 5);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (5, 5, 6, 25);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (6, 6, 5, 15);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (7, 7, 10, 50);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (8, 8, 8, 30);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (9, 1, 5, 18);
INSERT INTO Producto_Deposito (Id_producto, Id_deposito, Stock_minimo, Stock_disponible) VALUES (10, 2, 3, 10);
GO

-- Tabla: Cliente 
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('35123456', 'Juan', 'Perez', 'juan.perez@email.com', 1);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('36789123', 'Maria', 'Gómez', 'maria.gomez@email.com', 0);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('32456789', 'Carlos', 'Rodriguez', 'carlos.rodriguez@email.com', 1);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('38987654', 'Ana', 'Lopez', 'ana.lopez@email.com', 0);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('40112233', 'Lucas', 'Martinez', 'lucas.martinez@email.com', 0);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('33445566', 'Sofia', 'Fernandez', 'sofia.fernandez@email.com', 1);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('37889900', 'Diego', 'Gonzalez', 'diego.gonzalez@email.com', 0);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('39554433', 'Lucia', 'Diaz', 'lucia.diaz@email.com', 1);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('31223344', 'Martin', 'Alvarez', 'martin.alvarez@email.com', 0);
INSERT INTO Cliente (DNI, Nombre, Apellido, Email, Socio_preferencial) VALUES ('34667788', 'Valeria', 'Romero', 'valeria.romero@email.com', 1);
GO

-- Tabla: Telefono_Cliente 
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('11-55551234', '35123456');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('11-55555678', '36789123');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('351-4441122', '32456789');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('341-3334455', '38987654');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('261-2227788', '40112233');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('381-1119900', '33445566');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('379-4443322', '37889900');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('379-4448899', '39554433');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('011-66667777', '31223344');
INSERT INTO Telefono_Cliente (Telefono, DNI) VALUES ('011-88889999', '34667788');
GO

-- Tabla: Ventas 
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260220 10:00:00', '35123456');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260220 11:30:00', '36789123');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260321 14:15:00', '32456789');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260322 16:45:00', '38987654');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260423 09:20:00', '40112233');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260424 15:10:00', '33445566');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260525 17:00:00', '37889900');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260526 12:05:00', '39554433');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260627 13:40:00', '31223344');
INSERT INTO Ventas (Fecha_compra, DNI) VALUES ('20260628 18:25:00', '34667788');
GO

-- Tabla: Detalle_venta 
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (1, 1, 1, 18500.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (2, 2, 1, 9200.50);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (3, 3, 1, 4500.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (4, 4, 1, 2800.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (5, 5, 2, 16200.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (6, 6, 1, 21000.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (7, 7, 3, 6100.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (8, 8, 2, 8900.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (9, 9, 1, 14300.00);
INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario) VALUES (10, 10, 1, 7500.00);
GO

-- Tabla: Comprobante 
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (1, 10.00, 16650.00, 18500.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (2, 0.00, 9200.50, 9200.50);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (3, 5.00, 4275.00, 4500.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (4, 15.00, 2380.00, 2800.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (5, 0.00, 32400.00, 32400.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (6, 10.00, 18900.00, 21000.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (7, 0.00, 18300.00, 18300.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (8, 5.00, 16910.00, 17800.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (9, 0.00, 14300.00, 14300.00);
INSERT INTO Comprobante (Id_venta, Descuento, Precio_total, Subtotal) VALUES (10, 10.00, 6750.00, 7500.00);
GO

-- Tabla: Medio_Pago 
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Efectivo', 0.00);
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Tarjeta de Crédito', 10.00);
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Tarjeta de Débito', 0.00);
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Mercado Pago', 3.50);
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Transferencia Bancaria', 0.00);
INSERT INTO Medio_Pago (Nombre_medio, Tasa_medio_pago) VALUES ('Cuenta Corriente', 5.00);
GO

-- Tabla: Pago_Ventas 
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (2, 1, 16650.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (1, 2, 9200.50);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (4, 3, 4275.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (2, 4, 2380.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (3, 5, 32400.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (5, 6, 18900.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (1, 7, 18300.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (4, 8, 16910.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (2, 9, 14300.00);
INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado) VALUES (6, 10, 6750.00);
GO
